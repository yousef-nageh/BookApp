import 'package:bookly_app_with_mvvm/features/home/presentation/manager/upper_list_block/upper_list_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/no_internet_widget.dart';
import '../manager/lower_list_block/lower_list_cubit.dart';
import '../manager/upper_list_block/upper_list_states.dart';
import 'widget/home_app_bar.dart';
import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const HomeAppBar(),
      ),
      body: BlocBuilder<UpperListCubit, UpperListStates>(
        builder: (context, state) {
          if (state is GetUpperListErrorState) {
            return NoInternetWidget(text:state.errorMessage, onPressed: () {
              BlocProvider.of<UpperListCubit>(context).getUpperListData();
              BlocProvider.of<LowerListCubit>(context).getLowerListData();
            }, );
          }
          return const HomeViewBody();
        },
      ),
    );
  }
}
