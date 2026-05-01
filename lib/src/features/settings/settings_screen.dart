import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Settings",
          style: GoogleFonts.workSans(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.person, size: 20, color: AppColors.black),
                  SizedBox(width: 10),
                  Text(
                    "Account",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: AppColors.grey2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(CupertinoIcons.bell, size: 20, color: AppColors.black),
                SizedBox(width: 10),
                Text(
                  "Push Notifications",
                  style: GoogleFonts.workSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.black,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/terms');
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.question_circle,
                    size: 20,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Terms & Conditions",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),

            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.info, size: 20, color: AppColors.black),
                  SizedBox(width: 10),
                  Text(
                    "About",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: AppColors.grey2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),

            SizedBox(height: 10),
            InkWell(
              onDoubleTap: () {
                GetStorage().remove("email");
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (_) => false,
                );
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.square_arrow_right,
                    size: 20,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Log out",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
