import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Account",
          style: GoogleFonts.workSans(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 24,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.mail, size: 24, color: AppColors.black),
                SizedBox(width: 10),
                Text(
                  GetStorage().read("email"),
                  style: GoogleFonts.workSans(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/change_password');
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.lock, size: 24, color: AppColors.black),
                  SizedBox(width: 10),
                  Text(
                    "Change Password",
                    style: GoogleFonts.workSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: AppColors.grey2,
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