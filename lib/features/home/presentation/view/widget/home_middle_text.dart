import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constance.dart';
import '../../manager/lower_list_block/lower_list_cubit.dart';
import '../../manager/lower_list_block/lower_list_state.dart';

class HomeMiddleText extends StatelessWidget {
  const HomeMiddleText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LowerListCubit,LowerListStates> (builder: (BuildContext context, state) {
      if(state is GetLowerListErrorState){
        return const SizedBox();
      }else{
        return   Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Text(
           AppString.besSeller,
            style: StyleManager.textStyle18.copyWith( fontWeight: FontWeight.bold)
          ),
        );
      }
    },);
  }
}
