import 'package:bookly_app_with_mvvm/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/views/login_success_view.dart';
import 'package:bookly_app_with_mvvm/features/details/data/repositories/book_details_repo_impl.dart';
import 'package:bookly_app_with_mvvm/features/details/domain/use_cases/get_related_books_use_case.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/views/book_details_view.dart';

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/search/domain/use_cases/search_book_use_case.dart';

import 'package:bookly_app_with_mvvm/features/home/presentation/view/home_view.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_cubit.dart';

import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:bookly_app_with_mvvm/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/functions/service_locator.dart';


import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/use_cases/lower_list_use_case.dart';
import '../../features/home/domain/use_cases/upper_list_use_case.dart';
import '../../features/home/presentation/manager/lower_list_block/lower_list_cubit.dart';
import '../../features/home/presentation/manager/upper_list_block/upper_list_cubit.dart';
import '../../features/search/data/repo/search_repo_impl.dart';
import '../../features/search/presentation/manager/search_home_cubit/search_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/authentication/presentation/views/sign_up_view.dart';

abstract class AppRoutes {
  static const splashRoutes = '/';
  static const homeViewRoute = 'homeView';
  static const bookDetailsViewRoute = 'bookDetailsView';
  static const searchViewRoute = 'searchView';
  static const loginViewRoute = 'loginView';
  static const signUpViewRoute = 'signUpView';
  static const loginSuccessRoute = ' loginSuccessView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoutes:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case AppRoutes.homeViewRoute:
        return MaterialPageRoute(

          builder: (BuildContext context) =>  MultiBlocProvider(providers: [
            BlocProvider(
              create: (BuildContext context) =>
              UpperListCubit(UpperListUseCase(getIt.get<HomeRepoImpl>()))
                ..getUpperListData()
                ..startController(),
            ),
            BlocProvider(
              create: (BuildContext context) =>
              LowerListCubit(LowerListUseCase(getIt.get<HomeRepoImpl>()))
                ..getLowerListData()
                ..setScrollController(),
            )
          ],
          child:const HomeView()),
        );
      case AppRoutes.bookDetailsViewRoute:
        var bookEntity = settings.arguments as BookEntity;
        return MaterialPageRoute(

          builder: (BuildContext context) {

            return BlocProvider(
            create: (context) => BookDetailsCubit(
                GetRelatedBooksUseCase(getIt.get<BookDetailsRepoImpl>()))..getRelatedBooks(bookEntity.title),
            child: BookDetailsView(
              model: bookEntity,
            ),
          );
          },
        );
      case AppRoutes.searchViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (context) => SearchCubit(
                      SearchBooksUseCase(getIt.get<SearchRepoImpl>())),
                  child: const SearchView(),
                ));
      case AppRoutes.loginViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (context) => LoginCubit(getIt.get<AuthenticationRepoImpl>()),
                  child: const LoginView(),
                ));
      case AppRoutes.signUpViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (context) => SignUpCubit(getIt.get<AuthenticationRepoImpl>()),
                  child: const SignUpView(),
                ));
      case AppRoutes.loginSuccessRoute:
        return MaterialPageRoute(builder: (BuildContext context) =>const LoginSuccessView());
      default:
        return noRouteFound();
    }
  }

  static Route<dynamic> noRouteFound() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text("no Route found"),
              ),
            ));
  }
}
