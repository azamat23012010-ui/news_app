import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/features/home/model/news_model.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: model.articles.length > 10 ? 10 : model.articles.length,
      itemBuilder: (_, int index) {
        return SizedBox(
          height: 190,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: model.articles[index]);
                },
                child: Container(
                  height: 140,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                model.articles[index].urlToImage?.isNotEmpty ==
                                        true
                                    ? model.articles[index].urlToImage!
                                    : 'https://avatars.mds.yandex.net/i?id=d0c55b7fcba08338e632881c4831db5c267b204d-16921443-images-thumbs&n=13',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.articles[index].title ?? 'no title',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'By ${model.articles[index].author ?? "Unknown"}',
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.greyText,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 3),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      model.articles[index].source?.name ?? 'unknown',
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: AppColors.blue,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColors.greyText,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${model.articles[index].publishedAt?.minute ?? 0}m ago',
                                    style: GoogleFonts.workSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.more_horiz),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Divider(color: AppColors.grey),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
