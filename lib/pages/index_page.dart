import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> mBottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
//      backgroundColor: Colors.red
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('分类'),
//        backgroundColor: Colors.yellow
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text('购物车'),
//        backgroundColor: Colors.blue
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('个人中心'),
//        backgroundColor: Colors.green
    ),
  ];

  final List mTabBoies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int mCurrentIndex = 0;
  var mCurrentPage;

  @override
  void initState() {
    mCurrentPage = mTabBoies[mCurrentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: mCurrentIndex,
        items: mBottomTabs,
        onTap: (index) {
          setState(() {
              mCurrentIndex = index;
              mCurrentPage = mTabBoies[mCurrentIndex];
          });
        },
      ),
      body: mCurrentPage,
    );
  }
}
