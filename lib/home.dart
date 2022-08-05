// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemg/bloc/bloc.dart';
import 'package:statemg/bloc/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Hi Sourabh",
          ),
        ),
        body: SafeArea(
            child: Center(
          child:
              //we used consumer here for ui rendering(builder) and status checking (listner)
              BlocConsumer<InternetBloc, InternetState>(
                  //1.Status checking using listner
                  listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet lost!"),
                backgroundColor: Colors.red,
              ));
            }
          },
                  // 2. Ui REndreing using builder
                  builder: (context, state) {
            if (state is InternetGainedState) {
              return Text("Connected!");
            } else if (state is InternetLostState) {
              return Text("Not Connected!");
            } else {
              return Text("Loading...");
            }
          }),
        )

            //=========we can only use builder for ui ===========
            //   return  BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
            //   if (state is InternetGainedState) {
            //     return Text("Connected!");
            //   } else if (state is InternetLostState) {
            //     return Text("Not Connected!");
            //   } else {
            //     return Text("Loading...");
            //   }
            // }),
            //=========we can only use builder for ui ===========

            ));
  }
}
