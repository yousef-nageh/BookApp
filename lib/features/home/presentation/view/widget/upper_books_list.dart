import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/waiting_books_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/constance.dart';

import '../../manager/upper_list_block/upper_list_cubit.dart';
import '../../manager/upper_list_block/upper_list_states.dart';
import 'home_books_item.dart';

class UpperBooksList extends StatelessWidget {
  const UpperBooksList({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UpperListCubit, UpperListStates>(
        builder: (BuildContext context, state) {
          UpperListCubit cubit =UpperListCubit.instance(context);

        return SizedBox(
          height: 30.hR(),
          child: ListView.separated(
            controller:cubit.controller,
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index<cubit.upperBooks.length) {
                return InkWell(
                onTap: (){
                  context.navigateTo(arguments:cubit.upperBooks[index] ,pageName: AppRoutes.bookDetailsViewRoute );
                },
                child: BooksItem(
                    model: cubit.upperBooks[index]
                
                       ),
                            );
              }else{
                return const WaitingBooksItem();
              }
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 20,
            ),
            itemCount: cubit.upperBooks.length+1,
          ),
        );

    });
  }
}
