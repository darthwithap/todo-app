import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class TopContainer extends StatelessWidget {
  final Widget child;
  TopContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return
    Container(
            height: SizeConfig.verti*25.66,
            width: SizeConfig.queryData.size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),),
              color: Colors.white,
            ),
           child: this.child,
          );
  }
}