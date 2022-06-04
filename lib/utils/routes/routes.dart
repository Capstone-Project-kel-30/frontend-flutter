import 'package:auto_route/annotations.dart';
import 'package:workout_zone/views/authentication/sign_in_page.dart';
import 'package:workout_zone/views/authentication/sign_up_page.dart';
import 'package:workout_zone/views/class/class_page.dart';
import 'package:workout_zone/views/home/home_page.dart';
import 'package:workout_zone/views/membership/membership_page.dart';
import 'package:workout_zone/views/newsletter/newsletter_page.dart';
import 'package:workout_zone/views/on_boarding/on_boarding_page.dart';
import 'package:workout_zone/views/payment/payment_page.dart';
import 'package:workout_zone/views/profile/profile_page.dart';
import 'package:workout_zone/views/schedule/schedule_page.dart';
import 'package:workout_zone/views/video_content/video_content_page.dart';
import 'package:workout_zone/views/wrapper/home_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'onBoarding',
      page: OnBoardingPage,
      initial: true,
    ),
    AutoRoute(
      path: 'signIn',
      page: SignInPage,
    ),
    AutoRoute(
      path: 'signUp',
      page: SignUpPage,
    ),
    AutoRoute(
      path: 'homeWrapper',
      page: HomeWrapper,
      children: <AutoRoute>[
        AutoRoute(
          path: 'home',
          page: HomePage,
        ),
        AutoRoute(
          path: 'schedule',
          page: SchedulePage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: 'class',
      page: ClassPage,
    ),
    AutoRoute(
      path: 'membership',
      page: MembershipPage,
    ),
    AutoRoute(
      path: 'newsletter',
      page: NewsletterPage,
    ),
    AutoRoute(
      path: 'videoContent',
      page: VideoContentPage,
    ),
    AutoRoute(
      path: 'payment',
      page: PaymentPage,
    ),
  ],
)
class $AppRouter {}
