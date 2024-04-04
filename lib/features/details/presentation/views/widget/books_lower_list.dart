


import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constance.dart';
import '../../../../home/presentation/manager/lower_list_block/lower_list_cubit.dart';
import '../../../../home/presentation/manager/lower_list_block/lower_list_state.dart';
import 'books_lower_item.dart';

class BooksLowerList extends StatelessWidget {
  const BooksLowerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LowerListCubit, LowerListStates>(
      builder: (BuildContext context, state) {
        LowerListCubit cubit =LowerListCubit.instance(context);

          return SizedBox(
            height: 12.hR(),
            child: ListView.separated(
              padding:const EdgeInsets.symmetric(horizontal: kPadding),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => BooksLowerItem(
                imageUrl: cubit.lowerBooks[index].image,


              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
              itemCount: cubit.lowerBooks.length,
            ),
          );

      },
    );
  }
}
