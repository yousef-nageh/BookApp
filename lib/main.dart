
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/functions/service_locator.dart';
import 'features/home/presentation/manager/BlocObserver.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  setUp();
  runApp(DevicePreview(builder: (BuildContext context) => const MyApp()));
}


