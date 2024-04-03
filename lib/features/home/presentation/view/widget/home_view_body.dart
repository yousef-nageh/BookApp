import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/widget/no_internet_widget.dart';
import '../../../../../core/utils/app_string.dart';

import '../../manager/lower_list_block/lower_list_cubit.dart';
import '../../manager/upper_list_block/upper_list_cubit.dart';
import '../../manager/upper_list_block/upper_list_states.dart';
import 'lower_books_block_builder.dart';
import 'upper_books_block_builder.dart';

import 'home_middle_text.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  Future<void> onRefresh(context) async {
    BlocProvider.of<UpperListCubit>(context).getUpperListData();
    BlocProvider.of<LowerListCubit>(context).getLowerListData();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () {
        return onRefresh(context);
      },
      backgroundColor: ColorManager.white,
      child: BlocBuilder<UpperListCubit, UpperListStates>(
          builder: (BuildContext context, state) {
        if (state is GetUpperListErrorState) {
          if (state.errorMessage == AppString.noInternet) {
            return const NoInternetWidget();
          }
        }
        return  CustomScrollView(
          controller: LowerListCubit.instance(context).controller,
          physics: const AlwaysScrollableScrollPhysics(),
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
      }),
    );
  }
}
