import 'package:auto_route/annotations.dart';
import 'package:workout_zone/views/home/search_bar_page.dart';
import 'package:workout_zone/views/notification/notification_page.dart';
import '../../views/authentication/create_new_pass.dart';
import '../../views/authentication/forget_password_page.dart';
import '../../views/authentication/sign_in_page.dart';
import '../../views/authentication/sign_up_page.dart';
import '../../views/authentication/verfikasi_signup.dart';
import '../../views/authentication/verifikasi_forget_password.dart';
import '../../views/class/booking_detail_page.dart';
import '../../views/class/class_detail_page.dart';
import '../../views/class/class_page.dart';
import '../../views/error/error_page.dart';
import '../../views/home/home_page.dart';
import '../../views/initial/initial_page.dart';
import '../../views/membership/membership_page.dart';
import '../../views/newsletter/newsletter_detail_page.dart';
import '../../views/newsletter/newsletter_page.dart';
import '../../views/on_boarding/landing_page.dart';
import '../../views/on_boarding/on_boarding_page.dart';
import '../../views/profile/new_password.dart';
import '../../views/profile/profile_edit.dart';
import '../../views/profile/profile_page.dart';
import '../../views/profile/profile_setting.dart';
import '../../views/schedule/schedule_page.dart';
import '../../views/video_content/video_content_page.dart';
import '../../views/wrapper/home_inner.dart';
import '../../views/wrapper/home_wrapper.dart';
import '../../views/membership/membership_detail_page.dart';
import '../../views/membership/membership_payment_page.dart';

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
          path: 'homeInner',
          page: HomeInner,
          children: <AutoRoute>[
            AutoRoute(
              path: 'home',
              page: HomePage,
              initial: true,
            ),
            AutoRoute(
              path: 'membership',
              page: MembershipPage,
            ),
            AutoRoute(
              path: 'videoContent',
              page: VideoContentPage,
            ),
            AutoRoute(
              path: 'class',
              page: ClassPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'schedulePage',
          page: SchedulePage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: 'profileSeting',
      page: ProfileSeting,
    ),
    AutoRoute(
      path: 'profileEdit',
      page: ProfileEdit,
    ),
    AutoRoute(
      path: 'editProfilePassword',
      page: NewPassword,
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
      path: 'newsletterDetail',
      page: NewsletterDetailPage,
    ),
    AutoRoute(
      path: 'classDetail',
      page: ClassDetailPage,
    ),
    AutoRoute(
      path: 'membershipDetail',
      page: MembershipDetailPage,
    ),
    AutoRoute(
      path: 'membershipPayment',
      page: MembershipPaymentPage,
    ),
    AutoRoute(
      path: 'bookingDetail',
      page: BookingDetailPage,
    ),
    AutoRoute(
      path: 'error',
      page: ErrorPage,
    ),
    AutoRoute(
      path: 'membership',
      page: MembershipPage,
    ),
    AutoRoute(
      path: 'notification',
      page: NotificationPage,
    ),
    AutoRoute(
      path: 'search',
      page: SearchBarPage,
    ),
  ],
)
class $AppRouter {}
