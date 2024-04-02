


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/widget/error_widget.dart';

import '../../manager/lower_list_block/lower_list_cubit.dart';
import '../../manager/lower_list_block/lower_list_state.dart';
import 'lower_books_item.dart';
import 'waiting_lower_list.dart';

class LowerBooksList extends StatelessWidget {
  const LowerBooksList({super.key});

  @override
    build(BuildContext context) {
    return  BlocBuilder<LowerListCubit,LowerListStates>(builder: (BuildContext context, state) {
      if (state is GetLowerListSuccessState) {
        return SliverList.separated(

          itemBuilder: (BuildContext context, int index) =>LowerBooksItem(model: state.lowerBooks[index] ),
          separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 20,),
            itemCount:state.lowerBooks.length ,);
      } else if(state is GetLowerListErrorState){
        return SliverToBoxAdapter(child: ErrorText( text: state.errorMessage,));
      }else{
        return const WaitingLowerList();
      }
    },

    );
  }
}

