import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_to_theme/json_to_theme.dart';

import 'appvantage_theme.dart';


class RootPage extends ConsumerWidget {
  const RootPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
         appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children:  [
            const Align(
              alignment: Alignment.topCenter,
              child:  CircularProgressIndicator()),
            const SizedBox(height: 16,),
            Text('This is Headline 6',style: Theme.of(context).textTheme.headline6,),
            Text('This is Subtitle',style: Theme.of(context).textTheme.subtitle1,),
            Text('This is Custom Text',style: getCustomTextStyle(),),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const SizedBox(height: 8,),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.favorite), label: const Text('Icon Button')),
            const Icon(Icons.headphones)
          ],
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
        
          children: [
             FloatingActionButton(
        onPressed: (){
          ref.read(themeNotifierProvider.notifier).changeTheme(ThemeModes.LIGHT);
          // onThemeSelected(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.wb_sunny)
      ),
      const SizedBox(width: 16,),
       FloatingActionButton(
        onPressed: (){
          ref.read(themeNotifierProvider.notifier).changeTheme(ThemeModes.DARK);
          // onThemeSelected(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.dark_mode)
      )
          ],
        ),
     
      
      bottomNavigationBar:  BottomNavigationBar(
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "List"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
      ]),
      );
  }
}


TextStyle getCustomTextStyle(){
  return  TextStyle(
    color: HexColor.fromHex('#673AB7'),
    fontSize: 24,
    fontWeight: FontWeightManager.black
  );
}