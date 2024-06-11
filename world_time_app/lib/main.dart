import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/loading.dart';

import 'pages/home.dart';

void  main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes:{
    '/': (context)=> loading(),
    '/home':(context)=> Home(),
    '/location': (context)=> ChooseLocation(),
  }
));
