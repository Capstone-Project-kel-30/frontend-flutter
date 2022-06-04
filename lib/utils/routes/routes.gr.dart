// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../views/authentication/sign_in_page.dart' as _i2;
import '../../views/authentication/sign_up_page.dart' as _i3;
import '../../views/class/class_page.dart' as _i5;
import '../../views/home/home_page.dart' as _i10;
import '../../views/membership/membership_page.dart' as _i6;
import '../../views/newsletter/newsletter_page.dart' as _i7;
import '../../views/on_boarding/on_boarding_page.dart' as _i1;
import '../../views/payment/payment_page.dart' as _i9;
import '../../views/profile/profile_page.dart' as _i12;
import '../../views/schedule/schedule_page.dart' as _i11;
import '../../views/video_content/video_content_page.dart' as _i8;
import '../../views/wrapper/home_wrapper.dart' as _i4;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    SignInRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpPage());
    },
    HomeWrapper.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeWrapper());
    },
    ClassRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ClassPage());
    },
    MembershipRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MembershipPage());
    },
    NewsletterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.PaymentPage());
    },
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ProfilePage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig('/#redirect',
            path: '/', redirectTo: 'onBoarding', fullMatch: true),
        _i13.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i13.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i13.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i13.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i13.RouteConfig(HomeRoute.name,
              path: 'home', parent: HomeWrapper.name),
          _i13.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i13.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i13.RouteConfig(ClassRoute.name, path: 'class'),
        _i13.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i13.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i13.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i13.RouteConfig(PaymentRoute.name, path: 'payment')
      ];
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i13.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.HomeWrapper]
class HomeWrapper extends _i13.PageRouteInfo<void> {
  const HomeWrapper({List<_i13.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i5.ClassPage]
class ClassRoute extends _i13.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i6.MembershipPage]
class MembershipRoute extends _i13.PageRouteInfo<void> {
  const MembershipRoute() : super(MembershipRoute.name, path: 'membership');

  static const String name = 'MembershipRoute';
}

/// generated route for
/// [_i7.NewsletterPage]
class NewsletterRoute extends _i13.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i8.VideoContentPage]
class VideoContentRoute extends _i13.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i9.PaymentPage]
class PaymentRoute extends _i13.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.SchedulePage]
class ScheduleRoute extends _i13.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
