import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/cutom_elevated_button.dart';
import '../../widgets/vertical_space.dart';

class CarouselImageCard extends StatelessWidget {
  const CarouselImageCard({
    Key? key,
    required this.imgList,
    required this.index,
    required this.textList,
  }) : super(key: key);

  final List<String> imgList;
  final int index;
  final List<List<String>> textList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (shade) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ).createShader(shade);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgList[index],
              fit: BoxFit.cover,
              height: 166,
            ),
          ),
        ),
        Center(
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: textList[index][0] != '',
                    child: Column(
                      children: [
                        Text(
                          textList[index][0],
                          style: AppTheme.theme(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                fontSize: 10,
                                fontWeight: kMediumWeight,
                                color: kLightColor,
                              ),
                        ),
                        const VerticalSpace(height: 10),
                      ],
                    ),
                  ),
                  Text(
                    textList[index][1],
                    style:
                        AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: kBoldWeight,
                              color: kLightColor,
                            ),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    textList[index][2],
                    style:
                        AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: kMediumWeight,
                              color: kLightColor,
                            ),
                  ),
                  const VerticalSpace(height: 10),
                  CustomElevatedButton(
                    text: textList[index][3],
                    radius: 100,
                    fontSize: 10,
                    width: null,
                    height: 22,
                    fontWeight: kBoldWeight,
                    onPressed: () {
                      context.router.push(MembershipRoute());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
