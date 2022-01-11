import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_theme_converter/appvantage_theme.dart';
import 'package:json_theme_converter/root_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}



class MyApp extends ConsumerStatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

 
 
  
  @override
  Widget build(BuildContext context) {    
    return   MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeNotifierProvider),
      darkTheme:  ref.watch(darkThemeProvider),
      home: const RootPage()
    );
  }
}





