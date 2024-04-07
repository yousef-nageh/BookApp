import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:bookly_app_with_mvvm/core/utils/constance.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manager/upper_list_block/upper_list_cubit.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manager/upper_list_block/upper_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../core/utils/image_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Row(
        children: [
          SvgPicture.asset(ImageManager.logo, height: 20,),
          const Spacer(),


          IconButton(onPressed: () {
            (context).navigateTo(pageName: AppRoutes.searchViewRoute);
          }, icon: const Icon(Icons.search_sharp, size: 30,)),
          BlocBuilder<UpperListCubit, UpperListStates>(
            builder: (context, state) {
              return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    UpperListCubit.instance(context).userLogout(context);
                  }, icon: const Icon(Icons.logout,size: 30,)

              );
            },
          ),
        ],),
    );
  }
}
