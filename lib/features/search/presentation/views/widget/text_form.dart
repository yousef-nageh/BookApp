
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/class/text_form_validator_function.dart';
import '../../../../../app/widget/my_text_field.dart';
import '../../manager/search_home_cubit/search_cubit.dart';



class TextForm extends StatelessWidget {
 const TextForm({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only( right: 15, left: 15),
        child: Form(
           key:  BlocProvider.of<SearchCubit>(context).formKey,
          child: Column(
            children: [
             MyTextForm(
               onTap:  SearchCubit.instance(context).onTap,
               validator: Validator.searchValidator,
                onFieldSubmitted: SearchCubit.instance(context).onSubmit,
                 hintText: AppString.hintSearch, prefixIcon: Icons.search, keyboardType: TextInputType.text)
            ],
          ),
        ),
      ),
    );
  }
}
