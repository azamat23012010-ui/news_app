import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/core/widgets/app_button_widget.dart';
import 'package:news_app/src/core/widgets/input_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Image.asset(
                  "assets/images/logo.png",
                  height: 135,
                  width: 90,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  "             Enter your email\nto be sent a reset password link.",
                  style: GoogleFonts.workSans(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                InputWidget(
                  controller: emailController,
                  labelText: 'Enter your email!',
                ),
                SizedBox(height: 50),
                AppButton(
                  text: 'Reset',
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/forgot_password',
                        (_) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
