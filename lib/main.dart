// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
//https://www.youtube.com/watch?v=QIn-_GA3_b0&t=1383s
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemg/bloc/bloc.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: (MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Form',
        color: Color(0xFF44697D),
        home: Home(),
      )),
    );
  }
}
