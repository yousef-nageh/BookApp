

import 'package:flutter/material.dart';

import '../config/routes/routes.dart';

import '../config/theme/app_theme.dart';
import '../core/utils/size_config.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(

      initialRoute: AppRoutes.splashRoutes,
      onGenerateRoute: AppRoutes.generateRoute,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
