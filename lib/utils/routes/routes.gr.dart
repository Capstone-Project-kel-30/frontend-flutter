// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../../models/user_model.dart' as _i26;
import '../../views/authentication/create_new_pass.dart' as _i9;
import '../../views/authentication/forget_password_page.dart' as _i6;
import '../../views/authentication/sign_in_page.dart' as _i4;
import '../../views/authentication/sign_up_page.dart' as _i5;
import '../../views/authentication/verfikasi_signup.dart' as _i7;
import '../../views/authentication/verifikasi_forget_password.dart' as _i8;
import '../../views/class/booking_detail_page.dart' as _i15;
import '../../views/class/class_detail_page.dart' as _i12;
import '../../views/class/class_page.dart' as _i23;
import '../../views/error/error_page.dart' as _i16;
import '../../views/home/home_page.dart' as _i21;
import '../../views/initial/initial_page.dart' as _i1;
import '../../views/membership/membership_detail_page.dart' as _i13;
import '../../views/membership/membership_page.dart' as _i17;
import '../../views/membership/membership_payment_page.dart' as _i14;
import '../../views/newsletter/newsletter_page.dart' as _i11;
import '../../views/on_boarding/landing_page.dart' as _i3;
import '../../views/on_boarding/on_boarding_page.dart' as _i2;
import '../../views/profile/profile_page.dart' as _i20;
import '../../views/schedule/schedule_page.dart' as _i19;
import '../../views/video_content/video_content_page.dart' as _i22;
import '../../views/wrapper/home_inner.dart' as _i18;
import '../../views/wrapper/home_wrapper.dart' as _i10;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    OnBoardingRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    Landingpage.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Landingpage());
    },
    SignInRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignUpPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ForgetPasswordPage());
    },
    VerfikasiSignUp.name: (routeData) {
      final args = routeData.argsAs<VerfikasiSignUpArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerfikasiSignUp(
              key: args.key, email: args.email, otp: args.otp));
    },
    VerfikasiForgetPassword.name: (routeData) {
      final args = routeData.argsAs<VerfikasiForgetPasswordArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.VerfikasiForgetPassword(
              key: args.key, email: args.email, otp: args.otp));
    },
    CreateNewPass.name: (routeData) {
      final args = routeData.argsAs<CreateNewPassArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.CreateNewPass(key: args.key, email: args.email));
    },
    HomeWrapper.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeWrapper());
    },
    NewsletterRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.NewsletterPage());
    },
    ClassDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ClassDetailRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.ClassDetailPage(
              key: args.key, classType: args.classType, user: args.user));
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.MembershipDetailPage(
              key: args.key, type: args.type, price: args.price));
    },
    MembershipPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipPaymentRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.MembershipPaymentPage(
              key: args.key, type: args.type, price: args.price));
    },
    BookingDetailRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.BookingDetailPage());
    },
    ErrorRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ErrorPage());
    },
    MembershipRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.MembershipPage());
    },
    HomeInner.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.HomeInner());
    },
    ScheduleRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ProfilePage());
    },
    HomeRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.HomePage());
    },
    VideoContentRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.VideoContentPage());
    },
    ClassRoute.name: (routeData) {
      final args = routeData.argsAs<ClassRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.ClassPage(
              key: args.key, classType: args.classType, user: args.user));
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig('/#redirect',
            path: '/', redirectTo: 'initial', fullMatch: true),
        _i24.RouteConfig(InitialRoute.name, path: 'initial'),
        _i24.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i24.RouteConfig(Landingpage.name, path: 'LandingPage'),
        _i24.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i24.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i24.RouteConfig(ForgetPasswordRoute.name, path: 'forgetPassword'),
        _i24.RouteConfig(VerfikasiSignUp.name, path: 'verfikasiSignUp'),
        _i24.RouteConfig(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword'),
        _i24.RouteConfig(CreateNewPass.name, path: 'createNewPassword'),
        _i24.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i24.RouteConfig(HomeInner.name,
              path: 'homeInner',
              parent: HomeWrapper.name,
              children: [
                _i24.RouteConfig('#redirect',
                    path: '',
                    parent: HomeInner.name,
                    redirectTo: 'home',
                    fullMatch: true),
                _i24.RouteConfig(HomeRoute.name,
                    path: 'home', parent: HomeInner.name),
                _i24.RouteConfig(MembershipRoute.name,
                    path: 'membership', parent: HomeInner.name),
                _i24.RouteConfig(VideoContentRoute.name,
                    path: 'videoContent', parent: HomeInner.name),
                _i24.RouteConfig(ClassRoute.name,
                    path: 'class', parent: HomeInner.name)
              ]),
          _i24.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i24.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i24.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i24.RouteConfig(ClassDetailRoute.name, path: 'classDetail'),
        _i24.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i24.RouteConfig(MembershipPaymentRoute.name,
            path: 'membershipPayment'),
        _i24.RouteConfig(BookingDetailRoute.name, path: 'bookingDetail'),
        _i24.RouteConfig(ErrorRoute.name, path: 'error'),
        _i24.RouteConfig(MembershipRoute.name, path: 'membership')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i24.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: 'initial');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingRoute extends _i24.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i3.Landingpage]
class Landingpage extends _i24.PageRouteInfo<void> {
  const Landingpage() : super(Landingpage.name, path: 'LandingPage');

  static const String name = 'Landingpage';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i24.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i24.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.ForgetPasswordPage]
class ForgetPasswordRoute extends _i24.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: 'forgetPassword');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i7.VerfikasiSignUp]
class VerfikasiSignUp extends _i24.PageRouteInfo<VerfikasiSignUpArgs> {
  VerfikasiSignUp({_i25.Key? key, required String email, required String otp})
      : super(VerfikasiSignUp.name,
            path: 'verfikasiSignUp',
            args: VerfikasiSignUpArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiSignUp';
}

class VerfikasiSignUpArgs {
  const VerfikasiSignUpArgs({this.key, required this.email, required this.otp});

  final _i25.Key? key;

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
    extends _i24.PageRouteInfo<VerfikasiForgetPasswordArgs> {
  VerfikasiForgetPassword(
      {_i25.Key? key, required String email, required String otp})
      : super(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword',
            args:
                VerfikasiForgetPasswordArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiForgetPassword';
}

class VerfikasiForgetPasswordArgs {
  const VerfikasiForgetPasswordArgs(
      {this.key, required this.email, required this.otp});

  final _i25.Key? key;

  final String email;

  final String otp;

  @override
  String toString() {
    return 'VerfikasiForgetPasswordArgs{key: $key, email: $email, otp: $otp}';
  }
}

/// generated route for
/// [_i9.CreateNewPass]
class CreateNewPass extends _i24.PageRouteInfo<CreateNewPassArgs> {
  CreateNewPass({_i25.Key? key, required String email})
      : super(CreateNewPass.name,
            path: 'createNewPassword',
            args: CreateNewPassArgs(key: key, email: email));

  static const String name = 'CreateNewPass';
}

class CreateNewPassArgs {
  const CreateNewPassArgs({this.key, required this.email});

  final _i25.Key? key;

  final String email;

  @override
  String toString() {
    return 'CreateNewPassArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.HomeWrapper]
class HomeWrapper extends _i24.PageRouteInfo<void> {
  const HomeWrapper({List<_i24.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i11.NewsletterPage]
class NewsletterRoute extends _i24.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i12.ClassDetailPage]
class ClassDetailRoute extends _i24.PageRouteInfo<ClassDetailRouteArgs> {
  ClassDetailRoute(
      {_i25.Key? key, required String classType, required _i26.UserModel user})
      : super(ClassDetailRoute.name,
            path: 'classDetail',
            args: ClassDetailRouteArgs(
                key: key, classType: classType, user: user));

  static const String name = 'ClassDetailRoute';
}

class ClassDetailRouteArgs {
  const ClassDetailRouteArgs(
      {this.key, required this.classType, required this.user});

  final _i25.Key? key;

  final String classType;

  final _i26.UserModel user;

  @override
  String toString() {
    return 'ClassDetailRouteArgs{key: $key, classType: $classType, user: $user}';
  }
}

/// generated route for
/// [_i13.MembershipDetailPage]
class MembershipDetailRoute
    extends _i24.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute(
      {_i25.Key? key, required String type, required String price})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args:
                MembershipDetailRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs(
      {this.key, required this.type, required this.price});

  final _i25.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i14.MembershipPaymentPage]
class MembershipPaymentRoute
    extends _i24.PageRouteInfo<MembershipPaymentRouteArgs> {
  MembershipPaymentRoute(
      {_i25.Key? key, required String type, required String price})
      : super(MembershipPaymentRoute.name,
            path: 'membershipPayment',
            args:
                MembershipPaymentRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipPaymentRoute';
}

class MembershipPaymentRouteArgs {
  const MembershipPaymentRouteArgs(
      {this.key, required this.type, required this.price});

  final _i25.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipPaymentRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i15.BookingDetailPage]
class BookingDetailRoute extends _i24.PageRouteInfo<void> {
  const BookingDetailRoute()
      : super(BookingDetailRoute.name, path: 'bookingDetail');

  static const String name = 'BookingDetailRoute';
}

/// generated route for
/// [_i16.ErrorPage]
class ErrorRoute extends _i24.PageRouteInfo<void> {
  const ErrorRoute() : super(ErrorRoute.name, path: 'error');

  static const String name = 'ErrorRoute';
}

/// generated route for
/// [_i17.MembershipPage]
class MembershipRoute extends _i24.PageRouteInfo<void> {
  const MembershipRoute() : super(MembershipRoute.name, path: 'membership');

  static const String name = 'MembershipRoute';
}

/// generated route for
/// [_i18.HomeInner]
class HomeInner extends _i24.PageRouteInfo<void> {
  const HomeInner({List<_i24.PageRouteInfo>? children})
      : super(HomeInner.name, path: 'homeInner', initialChildren: children);

  static const String name = 'HomeInner';
}

/// generated route for
/// [_i19.SchedulePage]
class ScheduleRoute extends _i24.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i20.ProfilePage]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i21.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i22.VideoContentPage]
class VideoContentRoute extends _i24.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i23.ClassPage]
class ClassRoute extends _i24.PageRouteInfo<ClassRouteArgs> {
  ClassRoute(
      {_i25.Key? key, required String classType, required _i26.UserModel user})
      : super(ClassRoute.name,
            path: 'class',
            args: ClassRouteArgs(key: key, classType: classType, user: user));

  static const String name = 'ClassRoute';
}

class ClassRouteArgs {
  const ClassRouteArgs({this.key, required this.classType, required this.user});

  final _i25.Key? key;

  final String classType;

  final _i26.UserModel user;

  @override
  String toString() {
    return 'ClassRouteArgs{key: $key, classType: $classType, user: $user}';
  }
}
