import 'package:flutter/material.dart';
import 'package:newsapp2/models/news_model.dart';

class ListviewCardVItem extends StatelessWidget {
  const ListviewCardVItem({super.key, required this.model});
  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 8),
      child: SizedBox(
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image(image:model.urlToImage!=null ? NetworkImage(model.urlToImage!) :const AssetImage('assets/images/sport.jpeg'),fit:BoxFit.cover,),
            ),
            Text(model.title,maxLines: 1,style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
            const SizedBox(height: 5,),
            Text(model.description??'Null',maxLines: 1,overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
