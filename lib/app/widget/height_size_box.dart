import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/cupertino.dart';

class HeightSizeBox extends StatelessWidget {
  const HeightSizeBox({super.key, required this.height});
final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.hR(),
    );
  }
}
