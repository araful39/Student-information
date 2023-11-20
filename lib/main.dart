import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main(){
  runApp(MyApp());
}
MaterialApp MyApp(){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  );
}