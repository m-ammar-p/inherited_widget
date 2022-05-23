import 'package:flutter/material.dart';
import 'package:state_management/State/state.dart';
import '../Views/home.dart';

void main() {
  runApp(const StateManagement());
}

class StateManagement extends StatelessWidget {
  const StateManagement({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Inherited Widget
    return AppStateWidget(
      child: MaterialApp(
        title: 'State Management',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  } // build
} // StateManagement