import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/home_view_body.dart';
import 'package:flutter/material.dart';

import 'widget/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
      surfaceTintColor: Colors.transparent,
        title:const HomeAppBar() ,
      ),
      body: const HomeViewBody() ,
    );
  }
}
