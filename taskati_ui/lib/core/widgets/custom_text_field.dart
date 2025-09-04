import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
     this.hint,
     this.validator,  required this.controller,
  });

  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller : controller,
      validator: validator,

      decoration: InputDecoration(
        hintText: hint,

       
      ),
    );
  }
}
