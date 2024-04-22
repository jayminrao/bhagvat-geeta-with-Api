import 'package:bhagavat_gita/ModelClass.dart';
import 'package:bhagavat_gita/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BookMarkScreen.dart';

class detailscreen extends StatefulWidget {
  final List<Verse> verses;
  final String chapter_name_eg;
  final String chapter_name_hn;
  const detailscreen({super.key, required this.verses, required this.chapter_name_eg, required this.chapter_name_hn});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blueAccent.withAlpha(100),
        title: isSwitched==false ?
        Text(widget.chapter_name_eg.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
            :
        Text(widget.chapter_name_hn.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.back)),
        actions: [
          IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookMarkScreen(),));}, icon: Icon(Icons.menu))
        ],
      ),
      body: ListView.builder(
          itemCount: widget.verses.length,
          itemBuilder: (Context , index){
         return Padding(
           padding: const EdgeInsets.all(7.0),
           child: Column(
             children: [
               Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.blueAccent.withAlpha(100),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(
                       left: 8.0, right: 8.0, bottom: 8.0, top: 4),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           IconButton(
                               onPressed: () {
                                 bookMarkList.add(bookMark(slock: widget.verses[index].verse));
                               },
                               icon: Icon(
                                 Icons.bookmark_border,
                                 size: 16,
                               ))
                         ],
                       ),
                       isSwitched == false
                           ? Text(
                           "Verse ${widget.verses[index].verseId.toString()}",
                           style: TextStyle(fontSize: 12))
                           : Text(
                           "श्लोक ${widget.verses[index].verseId.toString()}",
                           style: TextStyle(fontSize: 12)),
                       Divider(
                         thickness: 1.5,
                       ),
                       Text(
                         widget.verses[index].verse,
                         style: TextStyle(
                             fontWeight: FontWeight.bold, fontSize: 16),
                       ),
                       SizedBox(
                         height: 12,
                       ),
                       isSwitched == false
                           ? Text(
                           "Commentary : ${widget.verses[index].commentaryEg}",
                           style: TextStyle(fontSize: 14))
                           : Text(
                           "भाष्य : ${widget.verses[index].commentaryHn}",
                           style: TextStyle(fontSize: 14)),

                     ],
                   ),
                 ),
               ),
             ],
           ),
         );
          }));
  }
}