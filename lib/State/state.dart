import 'package:flutter/material.dart';
import 'package:state_management/State/user.dart';

class AppStateWidget extends StatefulWidget {

  final Widget child;
  const AppStateWidget({
    required this.child,
    Key? key}) : super(key: key);

  // global state
  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

// global state
class AppStateWidgetState extends State<AppStateWidget> {

 User? user;

  updateUsername(User newUser) => setState((){
    user = newUser;
  });

  @override
  Widget build(BuildContext context) {
    // current class is attached to inherited widget (state: this)
    return MyInheritedWidget(child: widget.child, state: this,);
  } // build
} // _AppStateWidgetState

class MyInheritedWidget extends InheritedWidget {

  final AppStateWidgetState state;

  MyInheritedWidget({
    required super.child,
    required this.state,
  });

  // another way of accessing value
  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;// updateShouldNotify

} // MyInheritedWidget