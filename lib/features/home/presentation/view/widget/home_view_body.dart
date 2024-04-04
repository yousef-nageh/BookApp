
import 'package:flutter/material.dart';
import '../../manager/lower_list_block/lower_list_cubit.dart';
import 'lower_books_block_builder.dart';
import 'upper_books_block_builder.dart';

import 'home_middle_text.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  Future<void> onRefresh(context) async {

  }

  @override
  Widget build(BuildContext context) {


      return  CustomScrollView(
        controller: LowerListCubit.instance(context).controller,
        slivers: const[
           SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ UpperBooksBlockBuilder(), HomeMiddleText()],
            ),
          ),
           LowerBooksBlockBuilder(),
           SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          )
        ],
      );

  }
}
