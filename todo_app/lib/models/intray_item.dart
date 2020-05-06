import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/global.dart';
import 'package:todo_app/size_config.dart';

class IntrayItem extends StatelessWidget {
  final String keyValue;
  final int index;
  IntrayItem({this.keyValue, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: SizeConfig.verti*2.5),
      height: SizeConfig.verti*15.78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: pinkColor,
      ),
      child: Text(index.toString(), style: intrayItemStyle,),
    );
  }
}