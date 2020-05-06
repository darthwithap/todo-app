import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/filter_screen.dart';
import 'package:todo_app/screens/intray_screen.dart';
import 'package:todo_app/size_config.dart';
import 'menu_screen.dart';
 
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  TabController _tabController;

  final List <Widget> _tabs =[
    Tab(icon: Icon(Icons.crop_square)),
    Tab(icon: Icon(Icons.add)),
    Tab(icon: Icon(Icons.menu)),
    ];


    @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

@override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.verti*7.37),
                  child: AppBar(
                    elevation: 0,
                    title: TabBar(
                    tabs: _tabs,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.pink,
                ),
                  ),
            ),
           body: Stack(
            children: [
              TabBarView(children: [FilterScreen(), IntrayScreen(), MenuScreen()]),
            ],
          ),
        ),
    ),
    ),
    );
  }
}