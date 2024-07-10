import 'package:flutter/material.dart';
import 'package:newsapp2/models/news_model.dart';

class ListviewCardHItem extends StatelessWidget {
  const ListviewCardHItem({super.key, required this.model});
  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: SizedBox(
            height: 100,
            width: 125,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              elevation: 5,
              child:model.urlToImage !=null ? Image(image: NetworkImage(model.urlToImage!) ,fit: BoxFit.cover)
                  : const Image(image: AssetImage('assets/images/sport.jpeg'),fit: BoxFit.cover)
            ),
          ),
        ),
        SizedBox(
            width: 60,
            child: Text(model.title, maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,)),
      ],
    );
  }
}
