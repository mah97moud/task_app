import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/shared/cubit/cubit.dart';
import 'package:task_app/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Center(
          child: Text('Welcome To Search App'),
        );
      },
      listener: (context, state) {},
    );
  }
}

//
