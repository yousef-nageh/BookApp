


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../manager/lower_list_block/lower_list_cubit.dart';
import '../../manager/lower_list_block/lower_list_state.dart';
import 'lower_books_item.dart';
import 'waiting_lower_item.dart';

class LowerBooksList extends StatelessWidget {
  const LowerBooksList({super.key});

  @override
    build(BuildContext context) {
    return  BlocBuilder<LowerListCubit,LowerListStates>(builder: (BuildContext context, state) {
      LowerListCubit cubit=LowerListCubit.instance(context) ;

        return SliverList.separated(


          itemBuilder: (BuildContext context, int index) {
            if ( index< cubit.lowerBooks.length) {
              return LowerBooksItem(model: cubit.lowerBooks[index] );
            }else{
              return const WaitingLowerItem();
            }
          },
          separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 20,),
            itemCount:cubit.lowerBooks.length+1 ,);

    },

    );
  }
}

