import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';


class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
  });

  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.workSans(),
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      controller: widget.controller,
      cursorColor: AppColors.blueAccent,
      cursorWidth: 2,
      cursorErrorColor: AppColors.red,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
        suffixIconColor: AppColors.black,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.greyText,
        ),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey2,)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey2,),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black,),
        ),
      ),
    );
  }
}