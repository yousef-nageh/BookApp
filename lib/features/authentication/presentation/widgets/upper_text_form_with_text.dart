import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/my_text_field.dart';
import '../../../../app/class/text_form_validator_function.dart';
import '../../../../core/utils/app_string.dart';

import 'my_text.dart';


class UpperTextFormWithText extends StatelessWidget {
   const UpperTextFormWithText({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit=BlocProvider.of<LoginCubit>(context);
    double h = MediaQuery.sizeOf(context).height;
    return  BlocBuilder<LoginCubit,LoginStates>(
      builder: (BuildContext context, state) =>Form(
        key: cubit.loginFormKey,

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.07, bottom: h * 0.02),
              child: const MyText(
                text: AppString.email,
              ),
            ),
             MyTextForm(
              onChanged: (value){

              },

                validator:Validator. emailValidator,
                hintText: AppString.email,
                prefixIcon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress),
            Padding(
              padding: EdgeInsets.only(top: h * 0.03, bottom: h * 0.02),
              child: const MyText(
                text: AppString.password,
              ),
            ),
             MyTextForm(
               obscureText: cubit.loginObscureText,
              validator:Validator.passwordValidator,
              hintText: AppString.passwordHint,
              prefixIcon: Icons.password,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: cubit.loginIcon,suffixIconFunction: cubit.showLoginPassword,

            ),
          ],
        ),
      ),

    );
  }

}
