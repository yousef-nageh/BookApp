
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';

import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/is_login.dart';
import '../../../../app/widget/my_elevated_button.dart';
import '../manager/signup_cubit/sign_up_state.dart';

class SignUPButtonWithIsLogin extends StatelessWidget {
  const SignUPButtonWithIsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return  Column(
      children: [
        BlocBuilder<SignUpCubit,SignUpStates>(
          builder: (BuildContext context, state) => Padding(
            padding:  EdgeInsets.only(top: h*0.06,bottom: h*0.02),
            child: MyElevatedButton(text: AppString.signUp, onPressed: (){
                 BlocProvider.of<SignUpCubit>(context).checkAndGoLogin(context);
              //context.navigateToReplacement(pageName: AppRoutes.loginViewRoute);
            }),
          ),

        ),
        IsLogin(isLogin: true, goTo: (){
          Navigator.of(context).pop();
        })
      ],
    );
  }
}
