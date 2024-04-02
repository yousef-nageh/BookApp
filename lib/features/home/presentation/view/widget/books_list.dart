import 'package:bookly_app_with_mvvm/config/extantion.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/constance.dart';

import '../../../../../core/widget/error_widget.dart';
import '../../manager/upper_list_block/upper_list_cubit.dart';
import '../../manager/upper_list_block/upper_list_states.dart';
import 'home_books_item.dart';
import 'waiting_books_list.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return BlocBuilder<UpperListCubit, UpperListStates>(
        builder: (BuildContext context, state) {
      if (state is GetUpperListSuccessState) {
        return SizedBox(
          height: h * 0.3,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: (){
                context.navigateTo(arguments:state.upperBooks[index] ,pageName: AppRoutes.bookDetailsViewRoute );
              },
              child: BooksItem(
                  model: state.upperBooks[index]

                     ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 20,
            ),
            itemCount: state.upperBooks.length,
          ),
        );
      } else if (state is GetUpperListErrorState) {
        return ErrorText(text: state.errorMessage);
      } else {
        return const WaitingBooksList();
      }
    });
  }
}
