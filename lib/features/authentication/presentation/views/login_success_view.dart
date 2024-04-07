import 'package:flutter/material.dart';

import '../widgets/login_success_body.dart';


class LoginSuccessView extends StatelessWidget {
  const LoginSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginSuccessBody(),
    );
  }
}
