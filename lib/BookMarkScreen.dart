import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ModelClass.dart';
import 'ModelClass.dart';
import 'ModelClass.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blueAccent.withAlpha(100),
        title: Text('Bookmarked'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: ListView.builder(
            itemCount: bookMarkList.length,
            itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(height: 8,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Colors.blueAccent.withAlpha(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0, top: 8),
                      child: Column(
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                    bookMarkList.remove(bookMark(slock: bookMarkList[index].slock!));
                    }, icon: Icon(Icons.close,size: 14,))
                            ],
                          ),
                          Text(bookMarkList[index].slock!)
                        ],
                      ),
                    ),
                  ),


                ],),
              );
            },),
        ),
      ),
    );
  }
}