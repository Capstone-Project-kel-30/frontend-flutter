import 'package:auto_route/annotations.dart';
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
