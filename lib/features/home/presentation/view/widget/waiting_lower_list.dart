import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/waiting_lower_item.dart';
import 'package:flutter/material.dart';

class WaitingLowerList extends StatelessWidget {
  const WaitingLowerList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverList.separated(
      itemBuilder: (BuildContext context, int index) =>const WaitingLowerItem(),
      separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 20,),
      itemCount: 5,
    );
  }
}

