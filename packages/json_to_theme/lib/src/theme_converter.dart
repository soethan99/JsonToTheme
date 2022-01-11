part of '../json_to_theme.dart';

abstract class ThemeConverter {
  Future<ThemeData> loadTheme(String assetPath);
  Future<ThemeData> loadDarkTheme(String assetPath);
}


class ThemeConverterImpl implements ThemeConverter {
  
  @override
  Future<ThemeData> loadTheme(String assetPath) async{
    var themeStr = await rootBundle.loadString(assetPath);
    var themeJson = json.decode(themeStr);

    var theme = ThemeDecoder.decodeThemeData(themeJson,validate: true) ?? ThemeData();
    return theme;
  }

  @override
  Future<ThemeData> loadDarkTheme(String assetPath) async {
    var themeStr = await rootBundle.loadString(assetPath);
    var themeJson = json.decode(themeStr);

    var theme = ThemeDecoder.decodeThemeData(themeJson,validate: true) ?? ThemeData();
    return theme;
  }
  
}