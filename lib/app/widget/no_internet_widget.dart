import 'package:flutter/material.dart';

import '../../core/utils/app_string.dart';
import '../../features/authentication/presentation/widgets/my_behavior.dart';

import 'error_widget.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height*0.8,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ErrorText(text: AppString.noInternet),
            ],
          ),
        ),
      ),
    );
  }
}
