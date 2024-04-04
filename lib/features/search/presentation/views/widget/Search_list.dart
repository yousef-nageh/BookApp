
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/widget/no_internet_widget.dart';
import '../../../../../core/utils/constance.dart';
import '../../../../home/presentation/view/widget/lower_books_item.dart';
import '../../manger/search_home_cubit/search_cubit.dart';
import '../../manger/search_home_cubit/search_state.dart';
import 'waiting_search_list.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
            padding:const EdgeInsets.symmetric(vertical: kPadding),

            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                LowerBooksItem(model: state.model[index] ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 20,
            ),
            itemCount: state.model.length,
          );
        } else if (state is SearchErrorState) {

          return  NoInternetWidget(text: state.errorMassage, onPressed: () {  },);

        } else if(state is SearchWaitingState){
          return const WaitingSearchList();
        }else{
          return const SizedBox(height: 0,);
        }
      },
    );
  }
}
