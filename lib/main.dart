import 'package:flutter/material.dart';
import 'package:worldt_ime/pages/choose_location.dart';
import 'package:worldt_ime/pages/home.dart';
import 'package:worldt_ime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation()
    },
  ));
}
