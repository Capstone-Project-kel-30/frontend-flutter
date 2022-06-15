// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;

import '../../views/authentication/create_new_pass.dart' as _i8;
import '../../views/authentication/forget_password_page.dart' as _i5;
import '../../views/authentication/sign_in_page.dart' as _i3;
import '../../views/authentication/sign_up_page.dart' as _i4;
import '../../views/authentication/verfikasi_signup.dart' as _i6;
import '../../views/authentication/verifikasi_forget_password.dart' as _i7;
import '../../views/class/class_page.dart' as _i10;
import '../../views/home/home_page.dart' as _i17;
import '../../views/membership/membership_detail_page.dart' as _i15;
import '../../views/membership/membership_page.dart' as _i11;
import '../../views/membership/membership_payment_page.dart' as _i16;
import '../../views/newsletter/newsletter_page.dart' as _i12;
import '../../views/on_boarding/landing_page.dart' as _i2;
import '../../views/on_boarding/on_boarding_page.dart' as _i1;
import '../../views/payment/payment_page.dart' as _i14;
import '../../views/profile/profile_page.dart' as _i19;
import '../../views/schedule/schedule_page.dart' as _i18;
import '../../views/video_content/video_content_page.dart' as _i13;
import '../../views/wrapper/home_wrapper.dart' as _i9;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    Landingpage.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Landingpage());
    },
    SignInRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignUpPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgetPasswordPage());
    },
    VerfikasiSignUp.name: (routeData) {
      final args = routeData.argsAs<VerfikasiSignUpArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.VerfikasiSignUp(key: args.key, email: args.email));
    },
    VerfikasiForgetPassword.name: (routeData) {
      final args = routeData.argsAs<VerfikasiForgetPasswordArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerfikasiForgetPassword(key: args.key, email: args.email));
    },
    CreateNewPass.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CreateNewPass());
    },
    HomeWrapper.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeWrapper());
    },
    ClassRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ClassPage());
    },
    MembershipRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipRouteArgs>(
          orElse: () => const MembershipRouteArgs());
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.MembershipPage(key: args.key));
    },
    NewsletterRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.PaymentPage());
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.MembershipDetailPage(
              key: args.key, type: args.type, price: args.price));
    },
    MembershipPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipPaymentRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.MembershipPaymentPage(
              key: args.key, type: args.type, price: args.price));
    },
    HomeRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ProfilePage());
    }
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig('/#redirect',
            path: '/', redirectTo: 'onBoarding', fullMatch: true),
        _i20.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i20.RouteConfig(Landingpage.name, path: 'LandingPage'),
        _i20.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i20.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i20.RouteConfig(ForgetPasswordRoute.name, path: 'forgetPassword'),
        _i20.RouteConfig(VerfikasiSignUp.name, path: 'verfikasiSignUp'),
        _i20.RouteConfig(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword'),
        _i20.RouteConfig(CreateNewPass.name, path: 'createNewPassword'),
        _i20.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i20.RouteConfig(HomeRoute.name,
              path: 'home', parent: HomeWrapper.name),
          _i20.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i20.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i20.RouteConfig(ClassRoute.name, path: 'class'),
        _i20.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i20.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i20.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i20.RouteConfig(PaymentRoute.name, path: 'payment'),
        _i20.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i20.RouteConfig(MembershipPaymentRoute.name, path: 'membershipPayment')
      ];
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i20.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.Landingpage]
class Landingpage extends _i20.PageRouteInfo<void> {
  const Landingpage() : super(Landingpage.name, path: 'LandingPage');

  static const String name = 'Landingpage';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i20.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.ForgetPasswordPage]
class ForgetPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: 'forgetPassword');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.VerfikasiSignUp]
class VerfikasiSignUp extends _i20.PageRouteInfo<VerfikasiSignUpArgs> {
  VerfikasiSignUp({_i21.Key? key, required String email})
      : super(VerfikasiSignUp.name,
            path: 'verfikasiSignUp',
            args: VerfikasiSignUpArgs(key: key, email: email));

  static const String name = 'VerfikasiSignUp';
}

class VerfikasiSignUpArgs {
  const VerfikasiSignUpArgs({this.key, required this.email});

  final _i21.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerfikasiSignUpArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i7.VerfikasiForgetPassword]
class VerfikasiForgetPassword
    extends _i20.PageRouteInfo<VerfikasiForgetPasswordArgs> {
  VerfikasiForgetPassword({_i21.Key? key, required String email})
      : super(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword',
            args: VerfikasiForgetPasswordArgs(key: key, email: email));

  static const String name = 'VerfikasiForgetPassword';
}

class VerfikasiForgetPasswordArgs {
  const VerfikasiForgetPasswordArgs({this.key, required this.email});

  final _i21.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerfikasiForgetPasswordArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i8.CreateNewPass]
class CreateNewPass extends _i20.PageRouteInfo<void> {
  const CreateNewPass() : super(CreateNewPass.name, path: 'createNewPassword');

  static const String name = 'CreateNewPass';
}

/// generated route for
/// [_i9.HomeWrapper]
class HomeWrapper extends _i20.PageRouteInfo<void> {
  const HomeWrapper({List<_i20.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i10.ClassPage]
class ClassRoute extends _i20.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i11.MembershipPage]
class MembershipRoute extends _i20.PageRouteInfo<MembershipRouteArgs> {
  MembershipRoute({_i21.Key? key})
      : super(MembershipRoute.name,
            path: 'membership', args: MembershipRouteArgs(key: key));

  static const String name = 'MembershipRoute';
}

class MembershipRouteArgs {
  const MembershipRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'MembershipRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.NewsletterPage]
class NewsletterRoute extends _i20.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i13.VideoContentPage]
class VideoContentRoute extends _i20.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i14.PaymentPage]
class PaymentRoute extends _i20.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i15.MembershipDetailPage]
class MembershipDetailRoute
    extends _i20.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute(
      {_i21.Key? key, required String type, required String price})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args:
                MembershipDetailRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs(
      {this.key, required this.type, required this.price});

  final _i21.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i16.MembershipPaymentPage]
class MembershipPaymentRoute
    extends _i20.PageRouteInfo<MembershipPaymentRouteArgs> {
  MembershipPaymentRoute(
      {_i21.Key? key, required String type, required String price})
      : super(MembershipPaymentRoute.name,
            path: 'membershipPayment',
            args:
                MembershipPaymentRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipPaymentRoute';
}

class MembershipPaymentRouteArgs {
  const MembershipPaymentRouteArgs(
      {this.key, required this.type, required this.price});

  final _i21.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipPaymentRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i17.HomePage]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i18.SchedulePage]
class ScheduleRoute extends _i20.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i19.ProfilePage]
class ProfileRoute extends _i20.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
