import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/navigtionbar_cubit/navigation_bar_cubit.dart';
import 'package:newsapp2/cubits/newscubit/news_cubit.dart';
import 'package:newsapp2/views/home_view.dart';
import 'cubits/bloc_observer/bloc_observer.dart';
void main()
{
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create:(context) => NavigationBarCubit(),),
      BlocProvider(create: (context) => NewsCubit(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,


      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange

        ),
        appBarTheme: const AppBarTheme(

          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
          ),
          backgroundColor: Colors.white,

          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)


        )
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id:(context)=>const HomeView(),
      },
    ),
  );
  }
}
