import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';
import 'video_content_image_card.dart';

class VideoContentCard extends StatelessWidget {
  const VideoContentCard({
    Key? key,
    required this.videoCategory,
    required this.duration,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String videoCategory, duration, title, description;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          color: kBackgroundColor,
          elevation: 3,
          shadowColor: kLightColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: VideoContentImageCard(
                        asset: 'assets/images/dummy1.png')),
                const VerticalSpace(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      videoCategory,
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: kGreyColor,
                              ),
                    ),
                    Text(
                      duration,
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: kGreyColor,
                                fontWeight: kSemiBoldWeight,
                              ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 5),
                Text(
                  title,
                  style:
                      AppTheme.theme(context).textTheme.titleMedium?.copyWith(
                            fontWeight: kSemiBoldWeight,
                          ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpace(height: 5),
                Text(
                  description,
                  style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                        color: kDarkColor,
                        fontSize: 10,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
