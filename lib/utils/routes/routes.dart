import 'package:auto_route/annotations.dart';
import 'package:workout_zone/views/authentication/create_new_pass.dart';
import 'package:workout_zone/views/authentication/forget_password_page.dart';
import 'package:workout_zone/views/authentication/sign_in_page.dart';
import 'package:workout_zone/views/authentication/sign_up_page.dart';
import 'package:workout_zone/views/authentication/verfikasi_signup.dart';
import 'package:workout_zone/views/authentication/verifikasi_forget_password.dart';

import 'package:workout_zone/views/class/class_page.dart';
import 'package:workout_zone/views/home/home_page.dart';
import 'package:workout_zone/views/initial/initial_page.dart';
import 'package:workout_zone/views/membership/membership_page.dart';
import 'package:workout_zone/views/newsletter/newsletter_page.dart';
import 'package:workout_zone/views/on_boarding/landing_page.dart';
import 'package:workout_zone/views/on_boarding/on_boarding_page.dart';
import 'package:workout_zone/views/payment/payment_page.dart';
import 'package:workout_zone/views/profile/profile_page.dart';
import 'package:workout_zone/views/schedule/schedule_page.dart';
import 'package:workout_zone/views/video_content/video_content_page.dart';
import 'package:workout_zone/views/wrapper/home_wrapper.dart';
import '../../views/authentication/sign_in_page.dart';
import '../../views/authentication/sign_up_page.dart';
import '../../views/class/class_page.dart';
import '../../views/home/home_page.dart';
import '../../views/membership/membership_detail_page.dart';
import '../../views/membership/membership_page.dart';
import '../../views/membership/membership_payment_page.dart';
import '../../views/newsletter/newsletter_page.dart';
import '../../views/on_boarding/on_boarding_page.dart';
import '../../views/payment/payment_page.dart';
import '../../views/profile/profile_page.dart';
import '../../views/schedule/schedule_page.dart';
import '../../views/video_content/video_content_page.dart';
import '../../views/wrapper/home_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'initial',
      page: InitialPage,
      initial: true,
    ),
    AutoRoute(
      path: 'onBoarding',
      page: OnBoardingPage,
    ),
    AutoRoute(
      path: 'LandingPage',
      page: Landingpage,
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
      path: 'forgetPassword',
      page: ForgetPasswordPage,
    ),
    AutoRoute(
      path: 'verfikasiSignUp',
      page: VerfikasiSignUp,
    ),
    AutoRoute(
      path: 'verfikasiForgetPassword',
      page: VerfikasiForgetPassword,
    ),
    AutoRoute(
      path: 'createNewPassword',
      page: CreateNewPass,
    ),
    AutoRoute(
      path: 'homeWrapper',
      page: HomeWrapper,
      children: <AutoRoute>[
        AutoRoute(
          path: 'home',
          page: HomePage,
          children: <AutoRoute>[],
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
    AutoRoute(
      path: 'membership',
      page: MembershipPage,
    ),
    AutoRoute(
      path: 'membershipDetail',
      page: MembershipDetailPage,
    ),
    AutoRoute(
      path: 'membershipPayment',
      page: MembershipPaymentPage,
    ),
  ],
)
class $AppRouter {}
