// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../views/authentication/sign_in_page.dart' as _i2;
import '../../views/authentication/sign_up_page.dart' as _i3;
import '../../views/class/class_page.dart' as _i5;
import '../../views/home/home_page.dart' as _i12;
import '../../views/membership/membership_detail_page.dart' as _i10;
import '../../views/membership/membership_page.dart' as _i6;
import '../../views/membership/membership_payment_page.dart' as _i11;
import '../../views/newsletter/newsletter_page.dart' as _i7;
import '../../views/on_boarding/on_boarding_page.dart' as _i1;
import '../../views/payment/payment_page.dart' as _i9;
import '../../views/profile/profile_page.dart' as _i14;
import '../../views/schedule/schedule_page.dart' as _i13;
import '../../views/video_content/video_content_page.dart' as _i8;
import '../../views/wrapper/home_wrapper.dart' as _i4;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    SignInRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpPage());
    },
    HomeWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeWrapper());
    },
    ClassRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ClassPage());
    },
    MembershipRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipRouteArgs>(
          orElse: () => const MembershipRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.MembershipPage(key: args.key));
    },
    NewsletterRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.PaymentPage());
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>(
          orElse: () => const MembershipDetailRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.MembershipDetailPage(key: args.key));
    },
    MembershipPaymentRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.MembershipPaymentPage());
    },
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfilePage());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig('/#redirect',
            path: '/', redirectTo: 'onBoarding', fullMatch: true),
        _i15.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i15.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i15.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i15.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i15.RouteConfig(HomeRoute.name,
              path: 'home', parent: HomeWrapper.name),
          _i15.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i15.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i15.RouteConfig(ClassRoute.name, path: 'class'),
        _i15.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i15.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i15.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i15.RouteConfig(PaymentRoute.name, path: 'payment'),
        _i15.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i15.RouteConfig(MembershipPaymentRoute.name, path: 'membershipPayment')
      ];
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i15.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i15.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.HomeWrapper]
class HomeWrapper extends _i15.PageRouteInfo<void> {
  const HomeWrapper({List<_i15.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i5.ClassPage]
class ClassRoute extends _i15.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i6.MembershipPage]
class MembershipRoute extends _i15.PageRouteInfo<MembershipRouteArgs> {
  MembershipRoute({_i16.Key? key})
      : super(MembershipRoute.name,
            path: 'membership', args: MembershipRouteArgs(key: key));

  static const String name = 'MembershipRoute';
}

class MembershipRouteArgs {
  const MembershipRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'MembershipRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.NewsletterPage]
class NewsletterRoute extends _i15.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i8.VideoContentPage]
class VideoContentRoute extends _i15.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i9.PaymentPage]
class PaymentRoute extends _i15.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i10.MembershipDetailPage]
class MembershipDetailRoute
    extends _i15.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute({_i16.Key? key})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args: MembershipDetailRouteArgs(key: key));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MembershipPaymentPage]
class MembershipPaymentRoute extends _i15.PageRouteInfo<void> {
  const MembershipPaymentRoute()
      : super(MembershipPaymentRoute.name, path: 'membershipPayment');

  static const String name = 'MembershipPaymentRoute';
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.SchedulePage]
class ScheduleRoute extends _i15.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
