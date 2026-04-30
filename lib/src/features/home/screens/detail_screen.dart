import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/core/icons/app_icons.dart';
import 'package:news_app/src/features/home/cubit/share.dart';
import 'package:news_app/src/features/home/model/news_model.dart';

final ShareService share = ShareService();

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.model});
  final Article model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,size: 20,)),
        ),
        actions: [
          SvgPicture.asset(AppIcons.save),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              await share.shareImage(
                text: 'Bu yangilikni kordingizmi 😱',
                imageUrl:
                    model.urlToImage ??
                    'https://avatars.mds.yandex.net/i?id=d0c55b7fcba08338e632881c4831db5c267b204d-16921443-images-thumbs&n=13',
              );
            },
            child: SvgPicture.asset(AppIcons.share),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  model.urlToImage ??
                      'https://avatars.mds.yandex.net/i?id=d0c55b7fcba08338e632881c4831db5c267b204d-16921443-images-thumbs&n=13',
                ),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'By ${model.author ?? 'Unknown'}',
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColors.greyText,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${model.publishedAt.minute}m ago',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  model.description ?? 'no comment',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
