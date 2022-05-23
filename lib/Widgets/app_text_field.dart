import 'package:flutter/material.dart';

class AppTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final String? hintText;
  final bool isPassField;

  const AppTextFields({
    Key? key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.isPassField = false,
  }) : super(key: key);

  @override
  _AppTextFieldsState createState() => _AppTextFieldsState();
}

class _AppTextFieldsState extends State<AppTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(
      //   top: 20,
      // ),
      // padding: const EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(color: const Color(0xFF5D5D67), width: 1),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassField,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          //border: InputBorder.none,
        ),
      ),
    );
  } // build
} // _AppTextFieldsState Class
