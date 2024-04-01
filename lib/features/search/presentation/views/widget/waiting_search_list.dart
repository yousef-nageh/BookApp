import 'package:flutter/material.dart';

import '../../../../../constance.dart';
import '../../../../home/presentation/view/widget/waiting_lower_item.dart';

class WaitingSearchList extends StatelessWidget {
  const WaitingSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return    ListView.separated(
      padding:const EdgeInsets.symmetric(vertical: kPadding),
      itemBuilder: (BuildContext context, int index) =>const WaitingLowerItem(),
      separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 20,),
      itemCount: 10,
    );
  }
}
