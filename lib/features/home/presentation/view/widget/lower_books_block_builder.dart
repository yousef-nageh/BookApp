import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/waiting_lower_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../app/widget/no_internet_widget.dart';
import '../../manager/lower_list_block/lower_list_cubit.dart';
import '../../manager/lower_list_block/lower_list_state.dart';

import 'lower_books_list.dart';

class LowerBooksBlockBuilder extends StatelessWidget {
  const LowerBooksBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LowerListCubit,LowerListStates>(builder: (BuildContext context, state) {
      if (state is GetLowerListSuccessState || state is GetLowerListWithPaginationWaitingState) {
        return const LowerBooksList();
      }else if( state is GetLowerListErrorState) {
        return SliverToBoxAdapter(
          child: NoInternetWidget(text:state.errorMessage , onPressed: () {
            LowerListCubit.instance(context).getLowerListData();
          },),
        );

      }else{
        return const WaitingLowerList();
      }
    });
  }
}
