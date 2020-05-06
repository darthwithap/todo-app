import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/global.dart';
import 'package:todo_app/models/top_container.dart';

import '../size_config.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyColor,
      child: Stack(
        children: <Widget> [
          TopContainer(child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.hori*5.77, top: SizeConfig.verti*12.63),
                child: Text('Menu',
                style: TextStyle(fontFamily: 'Avenir', fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
  
        ],
      ),
    );
  }
}