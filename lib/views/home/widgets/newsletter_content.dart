import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../models/newsletter__model.dart';
import '../../../utils/routes/routes.gr.dart';
import 'image_card.dart';

class NewsletterContent extends StatelessWidget {
  const NewsletterContent({
    Key? key,
    required this.newsletters,
  }) : super(key: key);

  final List<Newsletter> newsletters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newsletters.length > 5 ? 5 : newsletters.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            context.router.push(
              NewsletterDetailRoute(
                content: newsletters[index].content!,
                date: newsletters[index].date!,
                link: newsletters[index].image!,
                newsletterTitle: newsletters[index].title!,
              ),
            );
          },
          child: ImageCard(
            link: newsletters[index].image!,
            title: newsletters[index].title!,
          ),
        );
      }),
    );
  }
}
