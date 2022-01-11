part of '../json_to_theme.dart';


extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll("#", "");
    if(hexColorString.length == 6){
      hexColorString = "FF"+hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}