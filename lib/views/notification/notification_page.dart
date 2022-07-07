import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/bloc/bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    context.read<MembershipPaymentBloc>().add(GetMembershipPaymentInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
