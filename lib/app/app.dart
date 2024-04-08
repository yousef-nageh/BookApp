

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/routes/routes.dart';

import '../config/theme/app_theme.dart';
import '../core/utils/size_config.dart';
import '../features/home/data/repo/home_repo_impl.dart';
import '../features/home/domain/use_cases/lower_list_use_case.dart';
import '../features/home/domain/use_cases/upper_list_use_case.dart';
import '../features/home/presentation/manager/lower_list_block/lower_list_cubit.dart';
import '../features/home/presentation/manager/upper_list_block/upper_list_cubit.dart';
import 'functions/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
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
      child: MaterialApp(

        initialRoute: AppRoutes.splashRoutes,
        onGenerateRoute: AppRoutes.generateRoute,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
