import 'package:flutter/material.dart';
import 'package:thimar/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.icon,
      this.obscureText,

      this.textInputType,
      required this.validatorWord,
      this.color,
      this.fill});
  final String hint;
  final Icon icon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final String validatorWord;
  final Color? color;
  final bool? fill;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: 60.h,
      width: double.infinity,
      child: TextFormField(
        obscureText: obscureText ?? false,
        validator: (value) => value!.isEmpty ? ' ادخل $validatorWord ' : null,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
            fillColor: color ?? Colors.white,
            filled: fill ?? false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            prefixIcon: icon,
            hintText: hint,
            hintStyle: Styles.textStyle15.copyWith(color: Colors.grey)),
      ),
    );
  }
}
