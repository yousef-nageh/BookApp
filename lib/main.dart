import 'package:bookly_app_with_mvvm/app/class/cache_helper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/functions/service_locator.dart';
import 'features/home/presentation/manager/BlocObserver.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  setUp();
  runApp(const MyApp());
}
