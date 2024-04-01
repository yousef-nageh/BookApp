import 'package:bookly_app_with_mvvm/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'features/home/presentation/manger/BlocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setUp();
  runApp(DevicePreview(builder: (BuildContext context) => const MyApp()));
}


