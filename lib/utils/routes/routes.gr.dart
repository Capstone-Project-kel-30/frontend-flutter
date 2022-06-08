// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../../views/authentication/forget_password_page.dart' as _i5;
import '../../views/authentication/sign_in_page.dart' as _i3;
import '../../views/authentication/sign_up_page.dart' as _i4;
import '../../views/authentication/widgets/verifikasi/verfikasi_signup.dart'
    as _i6;
import '../../views/authentication/widgets/verifikasi/verifikasi_forget_password.dart'
    as _i7;
import '../../views/class/class_page.dart' as _i9;
import '../../views/home/home_page.dart' as _i14;
import '../../views/membership/membership_page.dart' as _i10;
import '../../views/newsletter/newsletter_page.dart' as _i11;
import '../../views/on_boarding/landing_page.dart' as _i2;
import '../../views/on_boarding/on_boarding_page.dart' as _i1;
import '../../views/payment/payment_page.dart' as _i13;
import '../../views/profile/profile_page.dart' as _i16;
import '../../views/schedule/schedule_page.dart' as _i15;
import '../../views/video_content/video_content_page.dart' as _i12;
import '../../views/wrapper/home_wrapper.dart' as _i8;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    Landingpage.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Landingpage());
    },
    SignInRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignUpPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgetPasswordPage());
    },
    VerfikasiSignUp.name: (routeData) {
      final args = routeData.argsAs<VerfikasiSignUpArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.VerfikasiSignUp(key: args.key, username: args.username));
    },
    VerfikasiForgetPassword.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.VerfikasiForgetPassword());
    },
    HomeWrapper.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomeWrapper());
    },
    ClassRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ClassPage());
    },
    MembershipRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.MembershipPage());
    },
    NewsletterRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PaymentPage());
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ProfilePage());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig('/#redirect',
            path: '/', redirectTo: 'onBoarding', fullMatch: true),
        _i17.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i17.RouteConfig(Landingpage.name, path: 'LandingPage'),
        _i17.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i17.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i17.RouteConfig(ForgetPasswordRoute.name, path: 'forgetPassword'),
        _i17.RouteConfig(VerfikasiSignUp.name, path: 'verfikasiSignUp'),
        _i17.RouteConfig(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword'),
        _i17.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i17.RouteConfig(HomeRoute.name,
              path: 'home', parent: HomeWrapper.name),
          _i17.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i17.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i17.RouteConfig(ClassRoute.name, path: 'class'),
        _i17.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i17.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i17.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i17.RouteConfig(PaymentRoute.name, path: 'payment')
      ];
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i17.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.Landingpage]
class Landingpage extends _i17.PageRouteInfo<void> {
  const Landingpage() : super(Landingpage.name, path: 'LandingPage');

  static const String name = 'Landingpage';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i17.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.ForgetPasswordPage]
class ForgetPasswordRoute extends _i17.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: 'forgetPassword');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.VerfikasiSignUp]
class VerfikasiSignUp extends _i17.PageRouteInfo<VerfikasiSignUpArgs> {
  VerfikasiSignUp({_i18.Key? key, required String username})
      : super(VerfikasiSignUp.name,
            path: 'verfikasiSignUp',
            args: VerfikasiSignUpArgs(key: key, username: username));

  static const String name = 'VerfikasiSignUp';
}

class VerfikasiSignUpArgs {
  const VerfikasiSignUpArgs({this.key, required this.username});

  final _i18.Key? key;

  final String username;

  @override
  String toString() {
    return 'VerfikasiSignUpArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [_i7.VerfikasiForgetPassword]
class VerfikasiForgetPassword extends _i17.PageRouteInfo<void> {
  const VerfikasiForgetPassword()
      : super(VerfikasiForgetPassword.name, path: 'verfikasiForgetPassword');

  static const String name = 'VerfikasiForgetPassword';
}

/// generated route for
/// [_i8.HomeWrapper]
class HomeWrapper extends _i17.PageRouteInfo<void> {
  const HomeWrapper({List<_i17.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i9.ClassPage]
class ClassRoute extends _i17.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i10.MembershipPage]
class MembershipRoute extends _i17.PageRouteInfo<void> {
  const MembershipRoute() : super(MembershipRoute.name, path: 'membership');

  static const String name = 'MembershipRoute';
}

/// generated route for
/// [_i11.NewsletterPage]
class NewsletterRoute extends _i17.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i12.VideoContentPage]
class VideoContentRoute extends _i17.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i13.PaymentPage]
class PaymentRoute extends _i17.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i14.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i15.SchedulePage]
class ScheduleRoute extends _i17.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
