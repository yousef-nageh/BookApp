
import '../../core/utils/size_config.dart';

double getResponsiveFontSize(double fontSize,){
double scaleFactor=getScaleFactor( );
double responsiveFontSize=fontSize *scaleFactor;
double lowerLimit=fontSize *0.8;
double upperLimit=fontSize *1.4;

return responsiveFontSize.clamp(lowerLimit, upperLimit);



}

double getScaleFactor(){

  if(SizeConfig.width<SizeConfig.maxMobileWidth){
    return SizeConfig.width/400;
  }else{
    return SizeConfig.width/700;
  }
}


