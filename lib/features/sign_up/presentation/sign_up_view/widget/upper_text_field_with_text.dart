
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/widget/text_form_validator_function.dart';
import '../../../../login/presentation/views/widget/my_text.dart';
import '../../../../../core/widget/my_text_field.dart';
import '../../manger/sign_up_cubit.dart';
import '../../manger/sign_up_state.dart';


class SignUPUpperTextFormWithText extends StatelessWidget {
  const SignUPUpperTextFormWithText({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit=BlocProvider.of<SignUpCubit>(context);
    double h = MediaQuery.sizeOf(context).height;
    return  BlocBuilder<SignUpCubit,SignUpStates>(
      builder: (BuildContext context, state) =>Form(
        key: cubit.signUpFormKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.07, bottom: h * 0.02),
              child: const MyText(
                text: AppString.userName,
              ),
            ),
            const MyTextForm(

                validator:Validator.userNameValidator,
                hintText: AppString.userHint,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text),
            Padding(
              padding: EdgeInsets.only(top: h * 0.03, bottom: h * 0.02),
              child: const MyText(
                text: AppString.email,
              ),
            ),
            const MyTextForm(

                validator: Validator.emailValidator,
                hintText: AppString.emailHint,
                prefixIcon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress),
            Padding(
              padding: EdgeInsets.only(top: h * 0.03, bottom: h * 0.02),
              child: const MyText(
                text: AppString.password,
              ),
            ),
            MyTextForm(
              obscureText: cubit.signUpObscureText,
              validator:Validator.passwordValidator,
              hintText: AppString.passwordHint,
              prefixIcon: Icons.password,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: cubit.signUPIcon,suffixIconFunction: cubit.showSignUpPassword,

            ),
          ],
        ),
      ),

    );
  }

}
