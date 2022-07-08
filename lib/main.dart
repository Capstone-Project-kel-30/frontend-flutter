import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/bloc.dart';
import 'services/locals/user_info_service.dart';
import 'services/remotes/auth_service.dart';
import 'services/remotes/class_service.dart';
import 'services/remotes/membership_service.dart';
import 'services/remotes/newsletter_service.dart';
import 'services/remotes/user_service.dart';
import 'utils/routes/routes.gr.dart';
import 'utils/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _sharedPreferences;
  final AppRouter _appRouter = AppRouter();
  late UserInfoService _userInfoService;
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();
  final MembershipService _membershipService = MembershipService();
  final ClassService _classService = ClassService();
  final NewsletterService _newsletterService = NewsletterService();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _userInfoService = UserInfoService(sharedPreferences: _sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userInfoService: _userInfoService,
            authService: _authService,
          ),
        ),
        BlocProvider(
          create: (_) => UserBloc(
            userInfoService: _userInfoService,
            userService: _userService,
          ),
        ),
        BlocProvider(create: (_) => AllClassBloc(_classService)),
        BlocProvider(create: (_) => OfflineClassBloc(_classService)),
        BlocProvider(create: (_) => OnlineClassBloc(_classService)),
        BlocProvider(
          create: (_) => MembershipBloc(_membershipService),
        ),
        BlocProvider(
          create: (_) => MembershipPaymentBloc(
            _membershipService,
            _userInfoService,
          ),
        ),
        BlocProvider(create: (_) => NewsletterBloc(_newsletterService)),
        BlocProvider(
          create: (_) => BookingBloc(
            _membershipService,
            _userInfoService,
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
