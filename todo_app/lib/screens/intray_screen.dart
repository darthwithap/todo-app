import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/classes/task.dart';
import 'package:todo_app/global.dart';
import 'package:todo_app/models/intray_item.dart';
import 'package:todo_app/models/top_container.dart';

import '../size_config.dart';

class IntrayScreen extends StatefulWidget {
  @override
  _IntrayScreenState createState() => _IntrayScreenState();
}

class _IntrayScreenState extends State<IntrayScreen> {

  List<Task> _taskList = [];
  
  @override
  Widget build(BuildContext context) {
    _taskList = [];
    getList();
    return Container(
      color: greyColor,
      child: Stack(
        children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Container(
          //       width: SizeConfig.hori*93,
          //       child: _buildList(context, _taskList)
          //       ),
          //   ],
          //   mainAxisAlignment: MainAxisAlignment.center,
          // ),
          _buildList(context, _taskList),
          TopContainer(child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.hori*5.77, top: SizeConfig.verti*12.63),
                child: Text('Intray',
                style: TextStyle(fontFamily: 'Avenir', fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: SizeConfig.verti*10.5263,
              width: SizeConfig.hori*22.2222,
              margin: EdgeInsets.only(top: SizeConfig.verti*20.3947, left: SizeConfig.hori*38.88889),
              child: FloatingActionButton(onPressed: null,
              child: Icon(Icons.add, size: 60,),
              backgroundColor: pinkColor,
              ),
            ),
        ],
      )
    );
  }

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Task item = _taskList[oldIndex];
            _taskList.remove(item);
            _taskList.insert(newIndex, item);
      });
    }

  Widget _buildList(BuildContext context, List<Task> _taskList) {
    return Theme(
    data: ThemeData(
      canvasColor: Colors.transparent,
      cardColor: greyColor
    ),
    child: ReorderableListView(
      padding: EdgeInsets.only(top: SizeConfig.verti*34.21),
      children:
      _taskList.map((Task item) => _buildListItem(context, item)).toList(),
      onReorder: _onReorder
      ), 
    );
  }

  Widget _buildListItem(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.index.toString()),
      title: IntrayItem(index: item.index,),
    );
  }

  void getList() {
    for (int i=0; i<10; i++) _taskList.add(Task(i));
  }
}