import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }

}
