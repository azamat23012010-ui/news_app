import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/core/widgets/app_button_widget.dart';
import 'package:news_app/src/core/widgets/input_widget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InputWidget(
                    controller: emailController,
                    labelText: 'Enter your email!',
                  ),
                ),
                InputWidget(
                  controller: passwordController,
                  labelText: 'Enter your password!',
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.workSans(color: AppColors.black, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                AppButton(
                  text: 'Sign In',
                  onPressed: () {
                    box.write('email', emailController.text);
                    Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
                  },
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/sign.png',height: 120,width: double.infinity,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}