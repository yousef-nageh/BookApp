
import 'package:flutter/material.dart';

extension NavigateToExtension on BuildContext {
  navigateTo({required String pageName,Object? arguments}) {
    Navigator.of(this).pushNamed(pageName,arguments:arguments );
  }
}

extension NavigatorPopExtension on BuildContext {
  popTo() {
    Navigator.of(this).pop();
  }
}

extension NavigateReplacementExtension on BuildContext {
  navigateToReplacement({required String pageName}) {
    Navigator.of(this).pushReplacementNamed(pageName);
  }

}
extension ScreenHeight on BuildContext{
 double getHeight()=>MediaQuery.sizeOf(this).height;

}
