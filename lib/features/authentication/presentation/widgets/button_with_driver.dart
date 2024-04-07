import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/my_elevated_button.dart';
import '../../../../core/utils/app_string.dart';
import 'or_driver.dart';

class ButtonWithDriver extends StatelessWidget {
  const ButtonWithDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.hR(), bottom: 2.hR()),
          child: BlocBuilder<LoginCubit, LoginStates>(
            builder: (BuildContext context, state) {
              if(state is LongInWaitingState){
                return const Center(child:  CircularProgressIndicator());
              }
              return MyElevatedButton(
              text: AppString.login,
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).checkAndGoHome();
              },
            );
            },
          ),
        ),
        const OrDriver(),
      ],
    );
  }
}
