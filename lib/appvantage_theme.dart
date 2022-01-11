
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_to_theme/json_to_theme.dart';

class ThemeNotifier extends StateNotifier<ThemeData?> {
  final ThemeConverter ref;
  ThemeNotifier({required this.ref}):super(null){
    load();
  }

  void load()async{
    state = await ref.loadTheme('assets/themes/default_light.json');
  }

  changeTheme(ThemeModes modes)async{
    if(modes == ThemeModes.DARK ){
      state = await ref.loadTheme('assets/themes/default_dark.json');
    }else{
      state = await ref.loadTheme('assets/themes/default_light.json');
    }
  }
  
}


class DarkThemeNotifier extends StateNotifier<ThemeData?> {
  final ThemeConverter ref;
  DarkThemeNotifier({required this.ref}):super(null){
    load();
  }

  void load()async{
    state = await ref.loadTheme('assets/themes/default_dark.json');
  }


  
}



enum ThemeModes{
  LIGHT,
  DARK
}

final  themeManagerProvider= Provider<ThemeConverter>((ref) {
  return ThemeConverterImpl();
});


final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,ThemeData?>((ref) => ThemeNotifier(ref: ref.watch(themeManagerProvider) ));

final darkThemeProvider = StateNotifierProvider<DarkThemeNotifier,ThemeData?>((ref) => DarkThemeNotifier(ref: ref.watch(themeManagerProvider) ));