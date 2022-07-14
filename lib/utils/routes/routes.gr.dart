// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i29;
import 'package:flutter/material.dart' as _i30;

import '../../models/book_info_model.dart' as _i35;
import '../../models/class_model.dart' as _i32;
import '../../models/membership_model.dart' as _i33;
import '../../models/membership_payment_model.dart' as _i34;
import '../../models/user_model.dart' as _i31;
import '../../views/authentication/create_new_pass.dart' as _i9;
import '../../views/authentication/forget_password_page.dart' as _i6;
import '../../views/authentication/sign_in_page.dart' as _i4;
import '../../views/authentication/sign_up_page.dart' as _i5;
import '../../views/authentication/verfikasi_signup.dart' as _i7;
import '../../views/authentication/verifikasi_forget_password.dart' as _i8;
import '../../views/class/booking_detail_page.dart' as _i20;
import '../../views/class/class_detail_page.dart' as _i17;
import '../../views/class/class_page.dart' as _i14;
import '../../views/error/error_page.dart' as _i21;
import '../../views/home/home_page.dart' as _i27;
import '../../views/initial/initial_page.dart' as _i1;
import '../../views/membership/membership_detail_page.dart' as _i18;
import '../../views/membership/membership_page.dart' as _i22;
import '../../views/membership/membership_payment_page.dart' as _i19;
import '../../views/newsletter/newsletter_detail_page.dart' as _i16;
import '../../views/newsletter/newsletter_page.dart' as _i15;
import '../../views/notification/notification_page.dart' as _i23;
import '../../views/on_boarding/landing_page.dart' as _i3;
import '../../views/on_boarding/on_boarding_page.dart' as _i2;
import '../../views/profile/new_password.dart' as _i13;
import '../../views/profile/profile_edit.dart' as _i12;
import '../../views/profile/profile_page.dart' as _i26;
import '../../views/profile/profile_setting.dart' as _i11;
import '../../views/schedule/schedule_page.dart' as _i25;
import '../../views/video_content/video_content_page.dart' as _i28;
import '../../views/wrapper/home_inner.dart' as _i24;
import '../../views/wrapper/home_wrapper.dart' as _i10;

class AppRouter extends _i29.RootStackRouter {
  AppRouter([_i30.GlobalKey<_i30.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    OnBoardingRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    Landingpage.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Landingpage());
    },
    SignInRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignUpPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ForgetPasswordPage());
    },
    VerfikasiSignUp.name: (routeData) {
      final args = routeData.argsAs<VerfikasiSignUpArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerfikasiSignUp(
              key: args.key, email: args.email, otp: args.otp));
    },
    VerfikasiForgetPassword.name: (routeData) {
      final args = routeData.argsAs<VerfikasiForgetPasswordArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.VerfikasiForgetPassword(
              key: args.key, email: args.email, otp: args.otp));
    },
    CreateNewPass.name: (routeData) {
      final args = routeData.argsAs<CreateNewPassArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.CreateNewPass(key: args.key, email: args.email));
    },
    HomeWrapper.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeWrapper());
    },
    ProfileSeting.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfileSeting());
    },
    ProfileEdit.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ProfileEdit());
    },
    NewPassword.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.NewPassword());
    },
    ClassRoute.name: (routeData) {
      final args = routeData.argsAs<ClassRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ClassPage(
              key: args.key, user: args.user, classType: args.classType));
    },
    NewsletterRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.NewsletterPage());
    },
    NewsletterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsletterDetailRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.NewsletterDetailPage(
              key: args.key,
              link: args.link,
              newsletterTitle: args.newsletterTitle,
              date: args.date,
              content: args.content));
    },
    ClassDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ClassDetailRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.ClassDetailPage(
              key: args.key,
              user: args.user,
              classes: args.classes,
              fromSchedule: args.fromSchedule));
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.MembershipDetailPage(key: args.key, member: args.member));
    },
    MembershipPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipPaymentRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.MembershipPaymentPage(
              key: args.key, membershipPayment: args.membershipPayment));
    },
    BookingDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BookingDetailRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.BookingDetailPage(
              key: args.key, bookInfo: args.bookInfo, user: args.user));
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.ErrorPage(
              key: args.key, isHome: args.isHome, message: args.message));
    },
    MembershipRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.MembershipPage());
    },
    NotificationRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.NotificationPage());
    },
    HomeInner.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.HomeInner());
    },
    ScheduleRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.ProfilePage());
    },
    HomeRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.HomePage());
    },
    VideoContentRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.VideoContentPage());
    }
  };

  @override
  List<_i29.RouteConfig> get routes => [
        _i29.RouteConfig('/#redirect',
            path: '/', redirectTo: 'initial', fullMatch: true),
        _i29.RouteConfig(InitialRoute.name, path: 'initial'),
        _i29.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i29.RouteConfig(Landingpage.name, path: 'LandingPage'),
        _i29.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i29.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i29.RouteConfig(ForgetPasswordRoute.name, path: 'forgetPassword'),
        _i29.RouteConfig(VerfikasiSignUp.name, path: 'verfikasiSignUp'),
        _i29.RouteConfig(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword'),
        _i29.RouteConfig(CreateNewPass.name, path: 'createNewPassword'),
        _i29.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i29.RouteConfig(HomeInner.name,
              path: 'homeInner',
              parent: HomeWrapper.name,
              children: [
                _i29.RouteConfig('#redirect',
                    path: '',
                    parent: HomeInner.name,
                    redirectTo: 'home',
                    fullMatch: true),
                _i29.RouteConfig(HomeRoute.name,
                    path: 'home', parent: HomeInner.name),
                _i29.RouteConfig(MembershipRoute.name,
                    path: 'membership', parent: HomeInner.name),
                _i29.RouteConfig(VideoContentRoute.name,
                    path: 'videoContent', parent: HomeInner.name),
                _i29.RouteConfig(ClassRoute.name,
                    path: 'class', parent: HomeInner.name)
              ]),
          _i29.RouteConfig(ScheduleRoute.name,
              path: 'schedulePage', parent: HomeWrapper.name),
          _i29.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i29.RouteConfig(ProfileSeting.name, path: 'profileSeting'),
        _i29.RouteConfig(ProfileEdit.name, path: 'profileEdit'),
        _i29.RouteConfig(NewPassword.name, path: 'editProfilePassword'),
        _i29.RouteConfig(ClassRoute.name, path: 'class'),
        _i29.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i29.RouteConfig(NewsletterDetailRoute.name, path: 'newsletterDetail'),
        _i29.RouteConfig(ClassDetailRoute.name, path: 'classDetail'),
        _i29.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i29.RouteConfig(MembershipPaymentRoute.name,
            path: 'membershipPayment'),
        _i29.RouteConfig(BookingDetailRoute.name, path: 'bookingDetail'),
        _i29.RouteConfig(ErrorRoute.name, path: 'error'),
        _i29.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i29.RouteConfig(NotificationRoute.name, path: 'notification')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i29.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: 'initial');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingRoute extends _i29.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i3.Landingpage]
class Landingpage extends _i29.PageRouteInfo<void> {
  const Landingpage() : super(Landingpage.name, path: 'LandingPage');

  static const String name = 'Landingpage';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i29.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i29.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.ForgetPasswordPage]
class ForgetPasswordRoute extends _i29.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: 'forgetPassword');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i7.VerfikasiSignUp]
class VerfikasiSignUp extends _i29.PageRouteInfo<VerfikasiSignUpArgs> {
  VerfikasiSignUp({_i30.Key? key, required String email, required String otp})
      : super(VerfikasiSignUp.name,
            path: 'verfikasiSignUp',
            args: VerfikasiSignUpArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiSignUp';
}

class VerfikasiSignUpArgs {
  const VerfikasiSignUpArgs({this.key, required this.email, required this.otp});

  final _i30.Key? key;

  final String email;

  final String otp;

  @override
  String toString() {
    return 'VerfikasiSignUpArgs{key: $key, email: $email, otp: $otp}';
  }
}

/// generated route for
/// [_i8.VerfikasiForgetPassword]
class VerfikasiForgetPassword
    extends _i29.PageRouteInfo<VerfikasiForgetPasswordArgs> {
  VerfikasiForgetPassword(
      {_i30.Key? key, required String email, required String otp})
      : super(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword',
            args:
                VerfikasiForgetPasswordArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiForgetPassword';
}

class VerfikasiForgetPasswordArgs {
  const VerfikasiForgetPasswordArgs(
      {this.key, required this.email, required this.otp});

  final _i30.Key? key;

  final String email;

  final String otp;

  @override
  String toString() {
    return 'VerfikasiForgetPasswordArgs{key: $key, email: $email, otp: $otp}';
  }
}

/// generated route for
/// [_i9.CreateNewPass]
class CreateNewPass extends _i29.PageRouteInfo<CreateNewPassArgs> {
  CreateNewPass({_i30.Key? key, required String email})
      : super(CreateNewPass.name,
            path: 'createNewPassword',
            args: CreateNewPassArgs(key: key, email: email));

  static const String name = 'CreateNewPass';
}

class CreateNewPassArgs {
  const CreateNewPassArgs({this.key, required this.email});

  final _i30.Key? key;

  final String email;

  @override
  String toString() {
    return 'CreateNewPassArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.HomeWrapper]
class HomeWrapper extends _i29.PageRouteInfo<void> {
  const HomeWrapper({List<_i29.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i11.ProfileSeting]
class ProfileSeting extends _i29.PageRouteInfo<void> {
  const ProfileSeting() : super(ProfileSeting.name, path: 'profileSeting');

  static const String name = 'ProfileSeting';
}

/// generated route for
/// [_i12.ProfileEdit]
class ProfileEdit extends _i29.PageRouteInfo<void> {
  const ProfileEdit() : super(ProfileEdit.name, path: 'profileEdit');

  static const String name = 'ProfileEdit';
}

/// generated route for
/// [_i13.NewPassword]
class NewPassword extends _i29.PageRouteInfo<void> {
  const NewPassword() : super(NewPassword.name, path: 'editProfilePassword');

  static const String name = 'NewPassword';
}

/// generated route for
/// [_i14.ClassPage]
class ClassRoute extends _i29.PageRouteInfo<ClassRouteArgs> {
  ClassRoute(
      {_i30.Key? key, required _i31.UserModel user, required String classType})
      : super(ClassRoute.name,
            path: 'class',
            args: ClassRouteArgs(key: key, user: user, classType: classType));

  static const String name = 'ClassRoute';
}

class ClassRouteArgs {
  const ClassRouteArgs({this.key, required this.user, required this.classType});

  final _i30.Key? key;

  final _i31.UserModel user;

  final String classType;

  @override
  String toString() {
    return 'ClassRouteArgs{key: $key, user: $user, classType: $classType}';
  }
}

/// generated route for
/// [_i15.NewsletterPage]
class NewsletterRoute extends _i29.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i16.NewsletterDetailPage]
class NewsletterDetailRoute
    extends _i29.PageRouteInfo<NewsletterDetailRouteArgs> {
  NewsletterDetailRoute(
      {_i30.Key? key,
      required String link,
      required String newsletterTitle,
      required String date,
      required String content})
      : super(NewsletterDetailRoute.name,
            path: 'newsletterDetail',
            args: NewsletterDetailRouteArgs(
                key: key,
                link: link,
                newsletterTitle: newsletterTitle,
                date: date,
                content: content));

  static const String name = 'NewsletterDetailRoute';
}

class NewsletterDetailRouteArgs {
  const NewsletterDetailRouteArgs(
      {this.key,
      required this.link,
      required this.newsletterTitle,
      required this.date,
      required this.content});

  final _i30.Key? key;

  final String link;

  final String newsletterTitle;

  final String date;

  final String content;

  @override
  String toString() {
    return 'NewsletterDetailRouteArgs{key: $key, link: $link, newsletterTitle: $newsletterTitle, date: $date, content: $content}';
  }
}

/// generated route for
/// [_i17.ClassDetailPage]
class ClassDetailRoute extends _i29.PageRouteInfo<ClassDetailRouteArgs> {
  ClassDetailRoute(
      {_i30.Key? key,
      required _i31.UserModel user,
      required _i32.Class classes,
      required bool fromSchedule})
      : super(ClassDetailRoute.name,
            path: 'classDetail',
            args: ClassDetailRouteArgs(
                key: key,
                user: user,
                classes: classes,
                fromSchedule: fromSchedule));

  static const String name = 'ClassDetailRoute';
}

class ClassDetailRouteArgs {
  const ClassDetailRouteArgs(
      {this.key,
      required this.user,
      required this.classes,
      required this.fromSchedule});

  final _i30.Key? key;

  final _i31.UserModel user;

  final _i32.Class classes;

  final bool fromSchedule;

  @override
  String toString() {
    return 'ClassDetailRouteArgs{key: $key, user: $user, classes: $classes, fromSchedule: $fromSchedule}';
  }
}

/// generated route for
/// [_i18.MembershipDetailPage]
class MembershipDetailRoute
    extends _i29.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute({_i30.Key? key, required _i33.Member member})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args: MembershipDetailRouteArgs(key: key, member: member));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs({this.key, required this.member});

  final _i30.Key? key;

  final _i33.Member member;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key, member: $member}';
  }
}

/// generated route for
/// [_i19.MembershipPaymentPage]
class MembershipPaymentRoute
    extends _i29.PageRouteInfo<MembershipPaymentRouteArgs> {
  MembershipPaymentRoute(
      {_i30.Key? key, required _i34.MembershipPaymentModel membershipPayment})
      : super(MembershipPaymentRoute.name,
            path: 'membershipPayment',
            args: MembershipPaymentRouteArgs(
                key: key, membershipPayment: membershipPayment));

  static const String name = 'MembershipPaymentRoute';
}

class MembershipPaymentRouteArgs {
  const MembershipPaymentRouteArgs({this.key, required this.membershipPayment});

  final _i30.Key? key;

  final _i34.MembershipPaymentModel membershipPayment;

  @override
  String toString() {
    return 'MembershipPaymentRouteArgs{key: $key, membershipPayment: $membershipPayment}';
  }
}

/// generated route for
/// [_i20.BookingDetailPage]
class BookingDetailRoute extends _i29.PageRouteInfo<BookingDetailRouteArgs> {
  BookingDetailRoute(
      {_i30.Key? key,
      required _i35.BookInfoModel bookInfo,
      required _i31.User user})
      : super(BookingDetailRoute.name,
            path: 'bookingDetail',
            args: BookingDetailRouteArgs(
                key: key, bookInfo: bookInfo, user: user));

  static const String name = 'BookingDetailRoute';
}

class BookingDetailRouteArgs {
  const BookingDetailRouteArgs(
      {this.key, required this.bookInfo, required this.user});

  final _i30.Key? key;

  final _i35.BookInfoModel bookInfo;

  final _i31.User user;

  @override
  String toString() {
    return 'BookingDetailRouteArgs{key: $key, bookInfo: $bookInfo, user: $user}';
  }
}

/// generated route for
/// [_i21.ErrorPage]
class ErrorRoute extends _i29.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute(
      {_i30.Key? key,
      required bool isHome,
      String message = "Unable to Fetch Data"})
      : super(ErrorRoute.name,
            path: 'error',
            args: ErrorRouteArgs(key: key, isHome: isHome, message: message));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs(
      {this.key, required this.isHome, this.message = "Unable to Fetch Data"});

  final _i30.Key? key;

  final bool isHome;

  final String message;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, isHome: $isHome, message: $message}';
  }
}

/// generated route for
/// [_i22.MembershipPage]
class MembershipRoute extends _i29.PageRouteInfo<void> {
  const MembershipRoute() : super(MembershipRoute.name, path: 'membership');

  static const String name = 'MembershipRoute';
}

/// generated route for
/// [_i23.NotificationPage]
class NotificationRoute extends _i29.PageRouteInfo<void> {
  const NotificationRoute()
      : super(NotificationRoute.name, path: 'notification');

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i24.HomeInner]
class HomeInner extends _i29.PageRouteInfo<void> {
  const HomeInner({List<_i29.PageRouteInfo>? children})
      : super(HomeInner.name, path: 'homeInner', initialChildren: children);

  static const String name = 'HomeInner';
}

/// generated route for
/// [_i25.SchedulePage]
class ScheduleRoute extends _i29.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedulePage');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i26.ProfilePage]
class ProfileRoute extends _i29.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i27.HomePage]
class HomeRoute extends _i29.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i28.VideoContentPage]
class VideoContentRoute extends _i29.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}
