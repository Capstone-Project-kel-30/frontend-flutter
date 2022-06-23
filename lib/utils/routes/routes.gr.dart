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

import '../../views/authentication/create_new_pass.dart' as _i9;
import '../../views/authentication/forget_password_page.dart' as _i6;
import '../../views/authentication/sign_in_page.dart' as _i4;
import '../../views/authentication/sign_up_page.dart' as _i5;
import '../../views/authentication/verfikasi_signup.dart' as _i7;
import '../../views/authentication/verifikasi_forget_password.dart' as _i8;
import '../../views/class/class_page.dart' as _i14;
import '../../views/home/home_page.dart' as _i24;
import '../../views/initial/initial_page.dart' as _i1;
import '../../views/membership/membership_detail_page.dart' as _i19;
import '../../views/membership/membership_page.dart' as _i18;
import '../../views/membership/membership_payment_page.dart' as _i20;
import '../../views/newsletter/newsletter_page.dart' as _i15;
import '../../views/on_boarding/landing_page.dart' as _i3;
import '../../views/on_boarding/on_boarding_page.dart' as _i2;
import '../../views/payment/payment_page.dart' as _i17;
import '../../views/profile/new_password.dart' as _i13;
import '../../views/profile/profile_edit.dart' as _i12;
import '../../views/profile/profile_page.dart' as _i23;
import '../../views/profile/profile_setting.dart' as _i11;
import '../../views/schedule/all_schedule_page.dart' as _i26;
import '../../views/schedule/offline_schedule_page.dart' as _i27;
import '../../views/schedule/online_schedule_page.dart' as _i28;
import '../../views/schedule/schedule_page.dart' as _i25;
import '../../views/video_content/video_content_page.dart' as _i16;
import '../../views/wrapper/home_inner.dart' as _i21;
import '../../views/wrapper/home_wrapper.dart' as _i10;
import '../../views/wrapper/scheduler_inner.dart' as _i22;

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
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ClassPage());
    },
    NewsletterRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.PaymentPage());
    },
    MembershipRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipRouteArgs>(
          orElse: () => const MembershipRouteArgs());
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.MembershipPage(key: args.key));
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.MembershipDetailPage(
              key: args.key, type: args.type, price: args.price));
    },
    MembershipPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipPaymentRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.MembershipPaymentPage(
              key: args.key, type: args.type, price: args.price));
    },
    HomeInner.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.HomeInner());
    },
    ScheduleInner.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.ScheduleInner());
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.ProfilePage(key: args.key, type: args.type));
    },
    HomeRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.SchedulePage());
    },
    AllScheduleRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.AllSchedulePage());
    },
    OfflineScheduleRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.OfflineSchedulePage());
    },
    OnlineScheduleRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.OnlineSchedulePage());
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
                    path: 'membership', parent: HomeInner.name)
              ]),
          _i29.RouteConfig(ScheduleInner.name,
              path: 'scheduleInner',
              parent: HomeWrapper.name,
              children: [
                _i29.RouteConfig('#redirect',
                    path: '',
                    parent: ScheduleInner.name,
                    redirectTo: 'schedulePage',
                    fullMatch: true),
                _i29.RouteConfig(ScheduleRoute.name,
                    path: 'schedulePage', parent: ScheduleInner.name),
                _i29.RouteConfig(AllScheduleRoute.name,
                    path: 'allSchedulePage', parent: ScheduleInner.name),
                _i29.RouteConfig(OfflineScheduleRoute.name,
                    path: 'offlineSchedulePage', parent: ScheduleInner.name),
                _i29.RouteConfig(OnlineScheduleRoute.name,
                    path: 'onlineSchedulePage', parent: ScheduleInner.name)
              ]),
          _i29.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i29.RouteConfig(ProfileSeting.name, path: 'profileSeting'),
        _i29.RouteConfig(ProfileEdit.name, path: 'profileEdit'),
        _i29.RouteConfig(NewPassword.name, path: 'editProfilePassword'),
        _i29.RouteConfig(ClassRoute.name, path: 'class'),
        _i29.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i29.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i29.RouteConfig(PaymentRoute.name, path: 'payment'),
        _i29.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i29.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i29.RouteConfig(MembershipPaymentRoute.name, path: 'membershipPayment')
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
class ClassRoute extends _i29.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i15.NewsletterPage]
class NewsletterRoute extends _i29.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i16.VideoContentPage]
class VideoContentRoute extends _i29.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i17.PaymentPage]
class PaymentRoute extends _i29.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i18.MembershipPage]
class MembershipRoute extends _i29.PageRouteInfo<MembershipRouteArgs> {
  MembershipRoute({_i30.Key? key})
      : super(MembershipRoute.name,
            path: 'membership', args: MembershipRouteArgs(key: key));

  static const String name = 'MembershipRoute';
}

class MembershipRouteArgs {
  const MembershipRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'MembershipRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.MembershipDetailPage]
class MembershipDetailRoute
    extends _i29.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute(
      {_i30.Key? key, required String type, required String price})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args:
                MembershipDetailRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs(
      {this.key, required this.type, required this.price});

  final _i30.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i20.MembershipPaymentPage]
class MembershipPaymentRoute
    extends _i29.PageRouteInfo<MembershipPaymentRouteArgs> {
  MembershipPaymentRoute(
      {_i30.Key? key, required String type, required String price})
      : super(MembershipPaymentRoute.name,
            path: 'membershipPayment',
            args:
                MembershipPaymentRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipPaymentRoute';
}

class MembershipPaymentRouteArgs {
  const MembershipPaymentRouteArgs(
      {this.key, required this.type, required this.price});

  final _i30.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipPaymentRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i21.HomeInner]
class HomeInner extends _i29.PageRouteInfo<void> {
  const HomeInner({List<_i29.PageRouteInfo>? children})
      : super(HomeInner.name, path: 'homeInner', initialChildren: children);

  static const String name = 'HomeInner';
}

/// generated route for
/// [_i22.ScheduleInner]
class ScheduleInner extends _i29.PageRouteInfo<void> {
  const ScheduleInner({List<_i29.PageRouteInfo>? children})
      : super(ScheduleInner.name,
            path: 'scheduleInner', initialChildren: children);

  static const String name = 'ScheduleInner';
}

/// generated route for
/// [_i23.ProfilePage]
class ProfileRoute extends _i29.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i30.Key? key, String? type})
      : super(ProfileRoute.name,
            path: 'profile', args: ProfileRouteArgs(key: key, type: type));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.type});

  final _i30.Key? key;

  final String? type;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i24.HomePage]
class HomeRoute extends _i29.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i25.SchedulePage]
class ScheduleRoute extends _i29.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedulePage');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i26.AllSchedulePage]
class AllScheduleRoute extends _i29.PageRouteInfo<void> {
  const AllScheduleRoute()
      : super(AllScheduleRoute.name, path: 'allSchedulePage');

  static const String name = 'AllScheduleRoute';
}

/// generated route for
/// [_i27.OfflineSchedulePage]
class OfflineScheduleRoute extends _i29.PageRouteInfo<void> {
  const OfflineScheduleRoute()
      : super(OfflineScheduleRoute.name, path: 'offlineSchedulePage');

  static const String name = 'OfflineScheduleRoute';
}

/// generated route for
/// [_i28.OnlineSchedulePage]
class OnlineScheduleRoute extends _i29.PageRouteInfo<void> {
  const OnlineScheduleRoute()
      : super(OnlineScheduleRoute.name, path: 'onlineSchedulePage');

  static const String name = 'OnlineScheduleRoute';
}
