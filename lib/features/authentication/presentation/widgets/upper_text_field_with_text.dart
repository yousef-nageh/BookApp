
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_string.dart';




import '../../../../app/widget/my_text_field.dart';
import '../../../../app/widget/text_form_validator_function.dart';
import '../manager/signup_cubit/sign_up_cubit.dart';
import '../manager/signup_cubit/sign_up_state.dart';
import 'my_text.dart';


class SignUPUpperTextFormWithText extends StatelessWidget {
  const SignUPUpperTextFormWithText({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit=BlocProvider.of<SignUpCubit>(context);

    return  BlocBuilder<SignUpCubit,SignUpStates>(
      builder: (BuildContext context, state) =>Form(
        key: cubit.signUpFormKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:7.hR(), bottom: 2.hR()),
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
              padding: EdgeInsets.only(top: 3.hR(), bottom: 2.hR()),
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
              padding: EdgeInsets.only(top: 3.hR(), bottom: 2.hR()),
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
