// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;

import '../../views/authentication/create_new_pass.dart' as _i9;
import '../../views/authentication/forget_password_page.dart' as _i6;
import '../../views/authentication/sign_in_page.dart' as _i4;
import '../../views/authentication/sign_up_page.dart' as _i5;
import '../../views/authentication/verfikasi_signup.dart' as _i7;
import '../../views/authentication/verifikasi_forget_password.dart' as _i8;
import '../../views/class/class_page.dart' as _i17;
import '../../views/home/home_page.dart' as _i27;
import '../../views/initial/initial_page.dart' as _i1;
import '../../views/membership/membership_detail_page.dart' as _i22;
import '../../views/membership/membership_page.dart' as _i21;
import '../../views/membership/membership_payment_page.dart' as _i23;
import '../../views/newsletter/newsletter_page.dart' as _i18;
import '../../views/on_boarding/landing_page.dart' as _i3;
import '../../views/on_boarding/on_boarding_page.dart' as _i2;
import '../../views/payment/payment_page.dart' as _i20;
import '../../views/profile/new_password.dart' as _i13;
import '../../views/profile/profile_edit.dart' as _i12;
import '../../views/profile/profile_page.dart' as _i26;
import '../../views/profile/profile_setting.dart' as _i11;
import '../../views/schedule/all_schedule_page.dart' as _i14;
import '../../views/schedule/offline_schedule_page.dart' as _i15;
import '../../views/schedule/online_schedule_page.dart' as _i16;
import '../../views/schedule/schedule_page.dart' as _i25;
import '../../views/video_content/video_content_page.dart' as _i19;
import '../../views/wrapper/home_inner.dart' as _i24;
import '../../views/wrapper/home_wrapper.dart' as _i10;

class AppRouter extends _i28.RootStackRouter {
  AppRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    OnBoardingRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    Landingpage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Landingpage());
    },
    SignInRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignUpPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ForgetPasswordPage());
    },
    VerfikasiSignUp.name: (routeData) {
      final args = routeData.argsAs<VerfikasiSignUpArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerfikasiSignUp(
              key: args.key, email: args.email, otp: args.otp));
    },
    VerfikasiForgetPassword.name: (routeData) {
      final args = routeData.argsAs<VerfikasiForgetPasswordArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.VerfikasiForgetPassword(
              key: args.key, email: args.email, otp: args.otp));
    },
    CreateNewPass.name: (routeData) {
      final args = routeData.argsAs<CreateNewPassArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.CreateNewPass(key: args.key, email: args.email));
    },
    HomeWrapper.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeWrapper());
    },
    ProfileSeting.name: (routeData) {
      final args = routeData.argsAs<ProfileSetingArgs>(
          orElse: () => const ProfileSetingArgs());
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ProfileSeting(
              key: args.key,
              name: args.name,
              email: args.email,
              phone: args.phone));
    },
    ProfileEdit.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ProfileEdit());
    },
    NewPassword.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.NewPassword());
    },
    AllScheduleRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.AllSchedulePage());
    },
    OfflineScheduleRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.OfflineSchedulePage());
    },
    OnlineScheduleRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.OnlineSchedulePage());
    },
    ClassRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ClassPage());
    },
    NewsletterRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.NewsletterPage());
    },
    VideoContentRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.VideoContentPage());
    },
    PaymentRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.PaymentPage());
    },
    MembershipRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipRouteArgs>(
          orElse: () => const MembershipRouteArgs());
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: _i21.MembershipPage(key: args.key));
    },
    MembershipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipDetailRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.MembershipDetailPage(
              key: args.key, type: args.type, price: args.price));
    },
    MembershipPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipPaymentRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.MembershipPaymentPage(
              key: args.key, type: args.type, price: args.price));
    },
    HomeInner.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.HomeInner());
    },
    ScheduleRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.SchedulePage());
    },
    ProfileRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.ProfilePage());
    },
    HomeRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.HomePage());
    }
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig('/#redirect',
            path: '/', redirectTo: 'initial', fullMatch: true),
        _i28.RouteConfig(InitialRoute.name, path: 'initial'),
        _i28.RouteConfig(OnBoardingRoute.name, path: 'onBoarding'),
        _i28.RouteConfig(Landingpage.name, path: 'LandingPage'),
        _i28.RouteConfig(SignInRoute.name, path: 'signIn'),
        _i28.RouteConfig(SignUpRoute.name, path: 'signUp'),
        _i28.RouteConfig(ForgetPasswordRoute.name, path: 'forgetPassword'),
        _i28.RouteConfig(VerfikasiSignUp.name, path: 'verfikasiSignUp'),
        _i28.RouteConfig(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword'),
        _i28.RouteConfig(CreateNewPass.name, path: 'createNewPassword'),
        _i28.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i28.RouteConfig(HomeInner.name,
              path: 'homeInner',
              parent: HomeWrapper.name,
              children: [
                _i28.RouteConfig('#redirect',
                    path: '',
                    parent: HomeInner.name,
                    redirectTo: 'home',
                    fullMatch: true),
                _i28.RouteConfig(HomeRoute.name,
                    path: 'home', parent: HomeInner.name),
                _i28.RouteConfig(MembershipRoute.name,
                    path: 'membership', parent: HomeInner.name)
              ]),
          _i28.RouteConfig(ScheduleRoute.name,
              path: 'schedule', parent: HomeWrapper.name),
          _i28.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeWrapper.name)
        ]),
        _i28.RouteConfig(ProfileSeting.name, path: 'profileSeting'),
        _i28.RouteConfig(ProfileEdit.name, path: 'profileEdit'),
        _i28.RouteConfig(NewPassword.name, path: 'editProfilePassword'),
        _i28.RouteConfig(AllScheduleRoute.name, path: 'allSchedulePage'),
        _i28.RouteConfig(OfflineScheduleRoute.name,
            path: 'offlineSchedulePage'),
        _i28.RouteConfig(OnlineScheduleRoute.name, path: 'onlineSchedulePage'),
        _i28.RouteConfig(ClassRoute.name, path: 'class'),
        _i28.RouteConfig(NewsletterRoute.name, path: 'newsletter'),
        _i28.RouteConfig(VideoContentRoute.name, path: 'videoContent'),
        _i28.RouteConfig(PaymentRoute.name, path: 'payment'),
        _i28.RouteConfig(MembershipRoute.name, path: 'membership'),
        _i28.RouteConfig(MembershipDetailRoute.name, path: 'membershipDetail'),
        _i28.RouteConfig(MembershipPaymentRoute.name, path: 'membershipPayment')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i28.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: 'initial');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingRoute extends _i28.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onBoarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i3.Landingpage]
class Landingpage extends _i28.PageRouteInfo<void> {
  const Landingpage() : super(Landingpage.name, path: 'LandingPage');

  static const String name = 'Landingpage';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i28.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i28.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.ForgetPasswordPage]
class ForgetPasswordRoute extends _i28.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: 'forgetPassword');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i7.VerfikasiSignUp]
class VerfikasiSignUp extends _i28.PageRouteInfo<VerfikasiSignUpArgs> {
  VerfikasiSignUp({_i29.Key? key, required String email, required String otp})
      : super(VerfikasiSignUp.name,
            path: 'verfikasiSignUp',
            args: VerfikasiSignUpArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiSignUp';
}

class VerfikasiSignUpArgs {
  const VerfikasiSignUpArgs({this.key, required this.email, required this.otp});

  final _i29.Key? key;

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
    extends _i28.PageRouteInfo<VerfikasiForgetPasswordArgs> {
  VerfikasiForgetPassword(
      {_i29.Key? key, required String email, required String otp})
      : super(VerfikasiForgetPassword.name,
            path: 'verfikasiForgetPassword',
            args:
                VerfikasiForgetPasswordArgs(key: key, email: email, otp: otp));

  static const String name = 'VerfikasiForgetPassword';
}

class VerfikasiForgetPasswordArgs {
  const VerfikasiForgetPasswordArgs(
      {this.key, required this.email, required this.otp});

  final _i29.Key? key;

  final String email;

  final String otp;

  @override
  String toString() {
    return 'VerfikasiForgetPasswordArgs{key: $key, email: $email, otp: $otp}';
  }
}

/// generated route for
/// [_i9.CreateNewPass]
class CreateNewPass extends _i28.PageRouteInfo<CreateNewPassArgs> {
  CreateNewPass({_i29.Key? key, required String email})
      : super(CreateNewPass.name,
            path: 'createNewPassword',
            args: CreateNewPassArgs(key: key, email: email));

  static const String name = 'CreateNewPass';
}

class CreateNewPassArgs {
  const CreateNewPassArgs({this.key, required this.email});

  final _i29.Key? key;

  final String email;

  @override
  String toString() {
    return 'CreateNewPassArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.HomeWrapper]
class HomeWrapper extends _i28.PageRouteInfo<void> {
  const HomeWrapper({List<_i28.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i11.ProfileSeting]
class ProfileSeting extends _i28.PageRouteInfo<ProfileSetingArgs> {
  ProfileSeting({_i29.Key? key, String? name, String? email, String? phone})
      : super(ProfileSeting.name,
            path: 'profileSeting',
            args: ProfileSetingArgs(
                key: key, name: name, email: email, phone: phone));

  static const String name = 'ProfileSeting';
}

class ProfileSetingArgs {
  const ProfileSetingArgs({this.key, this.name, this.email, this.phone});

  final _i29.Key? key;

  final String? name;

  final String? email;

  final String? phone;

  @override
  String toString() {
    return 'ProfileSetingArgs{key: $key, name: $name, email: $email, phone: $phone}';
  }
}

/// generated route for
/// [_i12.ProfileEdit]
class ProfileEdit extends _i28.PageRouteInfo<void> {
  const ProfileEdit() : super(ProfileEdit.name, path: 'profileEdit');

  static const String name = 'ProfileEdit';
}

/// generated route for
/// [_i13.NewPassword]
class NewPassword extends _i28.PageRouteInfo<void> {
  const NewPassword() : super(NewPassword.name, path: 'editProfilePassword');

  static const String name = 'NewPassword';
}

/// generated route for
/// [_i14.AllSchedulePage]
class AllScheduleRoute extends _i28.PageRouteInfo<void> {
  const AllScheduleRoute()
      : super(AllScheduleRoute.name, path: 'allSchedulePage');

  static const String name = 'AllScheduleRoute';
}

/// generated route for
/// [_i15.OfflineSchedulePage]
class OfflineScheduleRoute extends _i28.PageRouteInfo<void> {
  const OfflineScheduleRoute()
      : super(OfflineScheduleRoute.name, path: 'offlineSchedulePage');

  static const String name = 'OfflineScheduleRoute';
}

/// generated route for
/// [_i16.OnlineSchedulePage]
class OnlineScheduleRoute extends _i28.PageRouteInfo<void> {
  const OnlineScheduleRoute()
      : super(OnlineScheduleRoute.name, path: 'onlineSchedulePage');

  static const String name = 'OnlineScheduleRoute';
}

/// generated route for
/// [_i17.ClassPage]
class ClassRoute extends _i28.PageRouteInfo<void> {
  const ClassRoute() : super(ClassRoute.name, path: 'class');

  static const String name = 'ClassRoute';
}

/// generated route for
/// [_i18.NewsletterPage]
class NewsletterRoute extends _i28.PageRouteInfo<void> {
  const NewsletterRoute() : super(NewsletterRoute.name, path: 'newsletter');

  static const String name = 'NewsletterRoute';
}

/// generated route for
/// [_i19.VideoContentPage]
class VideoContentRoute extends _i28.PageRouteInfo<void> {
  const VideoContentRoute()
      : super(VideoContentRoute.name, path: 'videoContent');

  static const String name = 'VideoContentRoute';
}

/// generated route for
/// [_i20.PaymentPage]
class PaymentRoute extends _i28.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: 'payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i21.MembershipPage]
class MembershipRoute extends _i28.PageRouteInfo<MembershipRouteArgs> {
  MembershipRoute({_i29.Key? key})
      : super(MembershipRoute.name,
            path: 'membership', args: MembershipRouteArgs(key: key));

  static const String name = 'MembershipRoute';
}

class MembershipRouteArgs {
  const MembershipRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'MembershipRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i22.MembershipDetailPage]
class MembershipDetailRoute
    extends _i28.PageRouteInfo<MembershipDetailRouteArgs> {
  MembershipDetailRoute(
      {_i29.Key? key, required String type, required String price})
      : super(MembershipDetailRoute.name,
            path: 'membershipDetail',
            args:
                MembershipDetailRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipDetailRoute';
}

class MembershipDetailRouteArgs {
  const MembershipDetailRouteArgs(
      {this.key, required this.type, required this.price});

  final _i29.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipDetailRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i23.MembershipPaymentPage]
class MembershipPaymentRoute
    extends _i28.PageRouteInfo<MembershipPaymentRouteArgs> {
  MembershipPaymentRoute(
      {_i29.Key? key, required String type, required String price})
      : super(MembershipPaymentRoute.name,
            path: 'membershipPayment',
            args:
                MembershipPaymentRouteArgs(key: key, type: type, price: price));

  static const String name = 'MembershipPaymentRoute';
}

class MembershipPaymentRouteArgs {
  const MembershipPaymentRouteArgs(
      {this.key, required this.type, required this.price});

  final _i29.Key? key;

  final String type;

  final String price;

  @override
  String toString() {
    return 'MembershipPaymentRouteArgs{key: $key, type: $type, price: $price}';
  }
}

/// generated route for
/// [_i24.HomeInner]
class HomeInner extends _i28.PageRouteInfo<void> {
  const HomeInner({List<_i28.PageRouteInfo>? children})
      : super(HomeInner.name, path: 'homeInner', initialChildren: children);

  static const String name = 'HomeInner';
}

/// generated route for
/// [_i25.SchedulePage]
class ScheduleRoute extends _i28.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: 'schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i26.ProfilePage]
class ProfileRoute extends _i28.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i27.HomePage]
class HomeRoute extends _i28.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}
