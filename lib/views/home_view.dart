import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/navigtionbar_cubit/navigation_bar_cubit.dart';
import 'package:newsapp2/cubits/navigtionbar_cubit/navigation_bar_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
       var NavCubit=NavigationBarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'N E W S  A P P',),
            actions: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:NavCubit.currentindex,
            onTap: NavCubit.onTap,
            items:NavCubit.items,
          ),
          body: NavCubit.screens[NavCubit.currentindex],
        );
      },
    );
  }
}
