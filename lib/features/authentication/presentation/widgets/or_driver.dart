import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class OrDriver extends StatelessWidget {
  const OrDriver({super.key});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width:double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1.5,

                color: Colors.grey,
              ),
            ),
             Text(
              " OR",
              style: TextStyle(color: ColorManager.grey300),

            ),
            Expanded(
              child: Container(
                height: 1,

                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}