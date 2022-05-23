import 'dart:io';

import 'package:flutter/material.dart';
import 'package:state_management/State/state.dart';
import 'package:state_management/State/user.dart';
import 'package:state_management/Views/profile_view.dart';
import 'package:state_management/Widgets/app_text_field.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();

  Home({Key? key}) : super(key: key);

  pickImage(BuildContext context) async {
    // Pick an image
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    var myAppState = MyInheritedWidget.of(context);

    myAppState?.updateUsername(
      User(
        name: usernameController.text,
        image: File(pickedImage?.path ?? ""),
      ),
    );
  } // pickImage

  @override
  Widget build(BuildContext context) {
    // taking out value from inherited widget (search this widget in context)
    var obj =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;

    // another way of taking value
    var myAppState = MyInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFields(
                hintText: "Please Enter Your Username",
                controller: usernameController,
              ),
              SizedBox(height: 10,),

              if (myAppState?.user != null)
              Text(myAppState!.user!.name,
              style: Theme.of(context).textTheme.headline4,
              ),

              ElevatedButton(
                onPressed: () {
                  pickImage(context);
                },
                child: Text("Update Username"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileView()));
                },
                child: Text("Go to Profile"),
              ),
              if (myAppState?.user != null)
                Image.file(
                  myAppState!.user!.image,
                  height: 100,
                ),
            ],
          ),
        ),
      ),
    );
  } // build
} // Home
