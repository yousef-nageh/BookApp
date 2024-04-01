
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/widget/my_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/search_home_cubit/search_cubit.dart';


class TextForm extends StatelessWidget {
 const TextForm({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only( right: 15, left: 15),
        child: Column(
          children: [
           MyTextForm(
               onChanged: (String value){
                 BlocProvider.of<SearchCubit>(context).searchForBook(param: value);

               },
               hintText: AppString.hintSearch, prefixIcon: Icons.search, keyboardType: TextInputType.text)
          ],
        ),
      ),
    );
  }
}
