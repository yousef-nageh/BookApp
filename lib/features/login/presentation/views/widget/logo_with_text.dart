import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/image_manager.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SvgPicture.asset(ImageManager.logo,width: 100,height: 40,),


      ],
    );
  }
}
