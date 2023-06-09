import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),);
  }
}

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Map resnew={};

  getData() async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$api_key';
    Response res=await get(Uri.parse(url));
    Map response=jsonDecode(res.body);
    var des=response['weather'][0]['description'];
     print(des);

    print(response);
    setState(() {
      resnew=response;
    });
    var m=resnew.length;
print("length:$m");
  }

  String api_key='7cd22a23a40299544524a1b6b3098ceb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: (){
      getData();
    }),
      body:ListView.builder(shrinkWrap: true,
    itemCount: resnew.length,
    itemBuilder: (context,index){
        return ListTile(
        title: Center(child: Text(resnew['weather'][0]['description'])),
  //  subtitle: Text(resnew['weather'][index]['icon']),

        );
    })






    );
  }
}
