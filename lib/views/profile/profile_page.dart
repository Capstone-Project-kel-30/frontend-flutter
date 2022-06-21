import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:workout_zone/bloc/auth/auth_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Profile Under Development'),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignOutLoading) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Signing Out ...'),
                    ),
                  );
              }
              if (state is UnAuthenticated) {
                Restart.restartApp();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Sign Out Success'),
                    ),
                  );
              }
              if (state is AuthenticationError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
              }
            },
            child: TextButton(
              child: const Text('Log Out'),
              onPressed: () {
                context.read<AuthBloc>().add(SignOutRequest());
              },
            ),
          ),
        ],
      ),
    );
  }
}
