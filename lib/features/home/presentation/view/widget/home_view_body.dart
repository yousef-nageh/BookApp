import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manger/upper_list_block/upper_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/widget/no_internet_widget.dart';
import '../../manger/lower_list_block/lower_list_cubit.dart';
import '../../manger/upper_list_block/upper_list_cubit.dart';
import 'books_list.dart';
import 'home_middle_text.dart';
import 'lower_books_list.dart';

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
        return const CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ BooksList(), HomeMiddleText()],
              ),
            ),
            LowerBooksList(),
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
