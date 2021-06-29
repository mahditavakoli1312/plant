import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/BLoc/ShopingBloc.dart';
import 'package:plant/pages/splesh_screen_home.dart';

void main() {
  runApp(
     BlocProvider(create: (context)=>ShopingBloc(SuccessState(plants: [])),
     child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



