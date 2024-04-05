import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/book_details_cubit/book_details_cubit.dart';
import '../../manager/book_details_cubit/book_details_state.dart';
import 'books_lower_list.dart';
import 'waiting_books_lower_list.dart';

class DetailsBooksBlockBuilder extends StatelessWidget {
  const DetailsBooksBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit,BookDetailsStates>(builder: (BuildContext context, state) {

      if(state is BookDetailsGetRelatedBooksSuccessState){
        return const BooksLowerList();
      }else{
        return const WaitingBooksLowerList();
      }
    },);
  }
}
