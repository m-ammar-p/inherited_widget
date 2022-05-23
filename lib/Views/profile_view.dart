import 'package:flutter/material.dart';
import 'package:state_management/State/state.dart';
import 'package:state_management/State/user.dart';
import 'package:state_management/Widgets/app_text_field.dart';

class ProfileView extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller.text = MyInheritedWidget.of(context)!.user!.name;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.file(
                    MyInheritedWidget.of(context)!.user!.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: AppTextFields(
                    controller: controller,
                  ),
                ),
                
              ],
            ),
            ElevatedButton(onPressed: (){
              User newUser = User(name: controller.text, image: MyInheritedWidget.of(context)!.user!.image);
              MyInheritedWidget.of(context)?.updateUsername(newUser);
            },
                child: Text("Update State"))
          ],
        ),
      ),
    );
  } // build
} // ProfileView
