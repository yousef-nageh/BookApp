import 'package:bookly_app_with_mvvm/features/login/presentation/manger/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/login/presentation/manger/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/widget/my_elevated_button.dart';
import 'or_driver.dart';

class ButtonWithDriver extends StatelessWidget {
  const ButtonWithDriver({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return  Column(
      children: [

        Padding(
          padding:  EdgeInsets.only(top: h * 0.03,bottom:  h * 0.02),
          child: BlocBuilder<LoginCubit,LoginStates>(
            builder: (BuildContext context, state) =>   MyElevatedButton(text: AppString.login, onPressed: () {
              BlocProvider.of<LoginCubit>(context).checkAndGoHome(context);


            },),

          ),
        ),
       const OrDriver(

       ),
      ],
    );
  }
}
