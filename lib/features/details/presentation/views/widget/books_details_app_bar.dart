import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/manager/book_details_cubit/book_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/functions/show_snack_bar.dart';

class BooksDetailsAppBar extends StatelessWidget {
  const BooksDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<BookDetailsCubit, BookDetailsStates>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  if (state is !BookDetailsGetRelatedBooksWaitingState) {
                    Navigator.of(context).pop();
                  }else{
                    showCustomSnackBar(context,AppString.waitingLoading);
                  }
                },
                icon: const Icon(Icons.close));
          },
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
      ],
    );
  }
}
