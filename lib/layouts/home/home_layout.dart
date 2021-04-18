import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/shared/cubit/cubit.dart';
import 'package:task_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  final String userName;

  HomeLayout({this.userName});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        int index = AppCubit.get(context).currentIndex;
        return Scaffold(
          appBar: AppBar(
            title: Text(userName ?? 'Username'),
          ),
          body: AppCubit.get(context).screenList[index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AppCubit.get(context).changeIndex(index);
            },
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
