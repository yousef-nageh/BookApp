import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Function()? suffixIconFunction;
  final bool obscureText;
  final VoidCallback? onTap;
final TextEditingController? controller;
  const MyTextForm(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      this.validator,
      this.onChanged,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.obscureText = false,
      this.suffixIconFunction, this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            onPressed: suffixIconFunction,
            icon: Icon(suffixIcon),
          ),
          hintText: hintText),
    );
  }
}
