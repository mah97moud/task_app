import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/modules/google_login/cubit/cubit.dart';
import 'package:task_app/modules/google_login/cubit/states.dart';

class GoogleLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => GoogleLoginCubit(),
        child: BlocConsumer<GoogleLoginCubit, GoogleLoginStates>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Google Login',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        GoogleLoginCubit.get(context).signInWithGoogle(
                          context: context,
                        );
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
