import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/upper_books_list.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/waiting_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../manager/upper_list_block/upper_list_cubit.dart';
import '../../manager/upper_list_block/upper_list_states.dart';

class UpperBooksBlockBuilder extends StatelessWidget {
  const UpperBooksBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<UpperListCubit, UpperListStates>(
        builder: (BuildContext context, state) {
          if (state is GetUpperListSuccessState || state is GetUpperListPaginationWaitingState) {
            return const UpperBooksList();
          } else {
            return const WaitingBooksList();
          }
        });
  }
}
