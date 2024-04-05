import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/widget/book_small_image_waiting_item.dart';

class WaitingBooksLowerItem extends StatelessWidget {
  const WaitingBooksLowerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.hR(),
      child: const BookSmallImageWaitingItem(),
    );
  }
}
