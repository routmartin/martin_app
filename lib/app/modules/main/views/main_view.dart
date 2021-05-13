import 'package:flutter/material.dart';
import 'package:martin_app/app/modules/explore/views/explore_view.dart';
import 'package:martin_app/app/modules/topic/views/topic_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _pageIndex;
  List<Widget> _pageList;

  @override
  void initState() {
    _pageIndex = 2;
    super.initState();
    _pageList = [
      Container(),
      TopicView(),
      ExploreView(),
      Container(),
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            selectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _pageIndex,
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(label: 'Video', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Topic', icon: Icon(Icons.menu_book_outlined)),
              BottomNavigationBarItem(label: 'Explore', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: 'Video', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: 'Video', icon: Icon(Icons.home)),
            ],
          ),
        ),
        body: _pageList[_pageIndex],
      ),
    );
  }
}
