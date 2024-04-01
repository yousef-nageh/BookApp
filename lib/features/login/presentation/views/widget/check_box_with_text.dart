import 'package:bookly_app_with_mvvm/features/login/presentation/manger/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/login/presentation/manger/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/color_manager.dart';
import 'my_text.dart';

class CheckBoxWIthText extends StatelessWidget {
  const CheckBoxWIthText({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit=BlocProvider.of<LoginCubit>(context);
    return   Row(children: [
      BlocBuilder<LoginCubit,LoginStates>(
        builder: (BuildContext context, state) => Checkbox(
            checkColor: ColorManager.primaryColor,

            side: BorderSide(color: ColorManager.white,width: 2),
            activeColor: ColorManager.white,




            value: cubit.checkBoxValue, onChanged: (value){

cubit.setCheckBoxValue(value);
        }),

      ),
      const MyText(text: AppString.rememberMe)

    ],);
  }
}
