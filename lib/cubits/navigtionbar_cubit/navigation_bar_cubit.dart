import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/navigtionbar_cubit/navigation_bar_state.dart';
import 'package:newsapp2/taps/allnews_tap.dart';
import 'package:newsapp2/taps/business_tap.dart';
import 'package:newsapp2/taps/science_tap.dart';
import 'package:newsapp2/taps/setting_tap.dart';
import 'package:newsapp2/taps/sporst_tap.dart';

class NavigationBarCubit extends Cubit<NavigationBarState>
{
  NavigationBarCubit():super(NavigationBarIntialState());
  static NavigationBarCubit get(context)=>BlocProvider.of(context);

  int currentindex=0;

  List<BottomNavigationBarItem>items= [
    const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'AllNews'),
  const BottomNavigationBarItem(icon:Icon(Icons.business),label: 'Business'),
    const BottomNavigationBarItem(icon:Icon(Icons.science),label:'Sciences' ),
  const BottomNavigationBarItem(icon:Icon(Icons.sports),label:'Sports' ),
  const BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')
  ];

  List<Widget>screens=[
    const AllnewsTap(),
    const BusinessTap(),
    const ScienceTap(),
    const SporstTap(),
    const SettingTap()
  ];


  onTap(index)
  {
    currentindex=index;
    emit(NavigationBarchangeState());
  }

}