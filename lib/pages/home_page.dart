import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/config/httpHeaders.dart';

class HomePage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showTexts = "欢迎您来到美好人间";

  Future getHttp(String typeStr) async {
    try {
      Response response;
      var data = {'name': typeStr};
      Dio dio = Dio();
      dio.options.headers = HttpHeaders;
      response = await dio.get(
          "https://time.geekbang.org/serv/v1/column/topList",
      queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  void _choiceAction() {
    print("开始选择你喜欢的类型....");
//    if (typeController.text.toString() == '') {
//      showDialog(context: context,
//          builder: (context) => AlertDialog(title: Text("美女类型不能为空"),)
//      );
//    }
//    else{
      getHttp(typeController.text.toString()).then((val){
        setState(() {
          print(val);
          showTexts = val['data'].toString();
        });
      });
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("美好人间"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '美女类型',
                    helperText: '请输入你喜欢的类型'),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: () {
                  _choiceAction();
                },
                child: Text('选择完毕'),
              ),
              Text(
                showTexts,
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
