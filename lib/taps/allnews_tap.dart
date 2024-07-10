import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/newscubit/news_cubit.dart';
import 'package:newsapp2/cubits/newscubit/news_state.dart';

import '../widgets/listview_card_h_item.dart';
import '../widgets/listview_card_v_item.dart';

class AllnewsTap extends StatelessWidget {
  const AllnewsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 12),
              child: Text('T O P  H E A D  L I N E S..', style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),),
            ),

            BlocBuilder<NewsCubit, NewsStates>(
              bloc: NewsCubit.get(context).gettoplinesnews(),
              builder: (context, state) {
                var cubit = NewsCubit.get(context);
                return SizedBox(
                  height: 140,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.artListtop.length,
                      itemBuilder: (context, index) =>
                          ListviewCardHItem(model: cubit.artListtop[index],)),
                );
              },
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 12),
              child: Text('A L L  N E W S..', style: TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),),
            ),

            BlocBuilder<NewsCubit,NewsStates>(
              bloc: NewsCubit.get(context).getallnews(),
              builder: (context, state) {
                var cubit=NewsCubit.get(context);
                if(state is NewsSuccssDataStates)
                  {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      itemCount: cubit.artListall.length,
                      itemBuilder: (context, index) =>
                          ListviewCardVItem(model: cubit.artListall[index],),);
                  }
                else{
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
