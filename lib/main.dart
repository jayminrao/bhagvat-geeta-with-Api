import 'package:bhagavat_gita/DetailScreen.dart';
import 'package:bhagavat_gita/splashscreen.dart';
import 'package:flutter/material.dart';
import 'ModelClass.dart';
import 'api_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
bool isSwitched=false;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel> pm = [];
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    ApiRepo().loadJsonData().then((value) {
      pm = value;
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.blueAccent.withAlpha(100),
          title: isSwitched==false ?
          Text("Bhagvad Gita",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
              :
          Text("भगवद गीता",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          centerTitle: false,
          actions: [
            Row(
              children: [
                Text('En',style: TextStyle(color: Colors.black,fontSize: 25)),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched==false ? isSwitched=true : isSwitched=false;
                    });
                  },
                  activeColor: Colors.blueAccent.withAlpha(100),
                  activeTrackColor: Colors.blueAccent.withAlpha(100),
                  inactiveThumbColor: Colors.blueAccent.withAlpha(100),
                  inactiveTrackColor: Colors.blueAccent.withAlpha(100),
                ),
                Text('Hn',style: TextStyle(color: Colors.black,fontSize: 25),),
                SizedBox(width: 10,)
              ],
            )

          ],
        ),
        body: (isLoading == true)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pm.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailscreen(verses: pm[index].verses, chapter_name_eg: pm[index].chapterNameEg, chapter_name_hn: pm[index].chapterNameHn,),));
                          },
                          child: Container(
                            height: 150,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withAlpha(80),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 150,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              pm[index].image),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:9),
                                  child: Container(
                                    height: 140,
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: isSwitched==false ?
                                            Text("Chapter ${pm[index].chapterId.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
                                                :
                                            Text('अध्याय ${pm[index].chapterId.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: isSwitched==false ?
                                          Text(
                                              pm[index].chapterNameEg,
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                                              :
                                          Text(
                                              pm[index].chapterNameHn,
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: isSwitched==false ?
                                          Text("Total Verse : ${pm[index].totalVerse.toString()}",
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                                              :
                                          Text("कुल श्लोक : ${pm[index].totalVerse.toString()}",
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
