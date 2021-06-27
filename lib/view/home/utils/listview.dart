// import 'package:daily_pad/model/pad.dart';
// import 'package:daily_pad/view/home/utils/item.dart';
// import 'package:flutter/material.dart';

// class ItemList extends StatefulWidget {
//   final List<DailyPad> list;
//   const ItemList({Key? key,required this.list}) : super(key: key);

//   @override
//   _ItemListState createState() => _ItemListState();
// }

// class _ItemListState extends State<ItemList> {
 
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.only(top: 5.0, left: 14.0, right: 8.0),
//         itemCount: widget.list.length,
//         itemBuilder: (context, index) {
//           return Item(dailyPad: widget.list[index]);
//         });
//   }
// }
