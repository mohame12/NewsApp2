import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/newscubit/news_cubit.dart';
import 'package:newsapp2/cubits/newscubit/news_state.dart';

import '../widgets/listview_card_v_item.dart';

class BusinessTap extends StatelessWidget {
  const BusinessTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      bloc: NewsCubit.get(context).getbusnews(),
      builder: (context, state) {
        var cubit=NewsCubit.get(context);
        if(state is NewsSuccssDataStates)
          {
            return Padding(
              padding: const EdgeInsetsDirectional.only(top:10 ,start:10 ,end: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.artListbus.length,
                  itemBuilder:(context,index)=> ListviewCardVItem(model:cubit.artListbus[index])),
            );
          }
        else
          {
            return const Center(child: CircularProgressIndicator(color: Colors.orange,));
          }

      },
    );
  }
}
