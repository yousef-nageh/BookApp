import 'package:bookly_app_with_mvvm/core/utils/service_locator.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/views/book_details_view.dart';

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/search_book_use_case.dart';

import 'package:bookly_app_with_mvvm/features/home/presentation/view/home_view.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/search/presentation/manger/search_home_cubit/search_cubit.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:bookly_app_with_mvvm/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repo/home_repo_impl.dart';

import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/authentication/presentation/views/sign_up_view.dart';

abstract class AppRoutes {
  static const splashRoutes = '/';
  static const homeViewRoute = 'homeView';
  static const bookDetailsViewRoute = 'bookDetailsView';
  static const searchViewRoute = 'searchView';
  static const loginViewRoute = 'loginView';
  static const signUpViewRoute = 'signUpView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoutes:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case AppRoutes.homeViewRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case AppRoutes.bookDetailsViewRoute:
        var bookEntity = settings.arguments as BookEntity;
        return MaterialPageRoute(
          builder: (BuildContext context) => BookDetailsView(
            model: bookEntity,
          ),
        );
      case AppRoutes.searchViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (context) => SearchCubit(
                      SearchBooksUseCase(getIt.get<HomeRepoImpl>())
                    ),
                    child: const SearchView(),
            ));
      case AppRoutes.loginViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (context) => LoginCubit(),
              child: const LoginView(),
                ));
      case AppRoutes.signUpViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                BlocProvider(create: (context) => SignUpCubit(),
                  child:const SignUpView(),
                ));
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
