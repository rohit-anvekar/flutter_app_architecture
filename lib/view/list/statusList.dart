import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/view/list/ChatItems.dart';
import 'package:flutter_app_architecture/model/Chats.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app_architecture/viewmodel/MainViewModel.dart';
import 'package:flutter_app_architecture/data/local/db/table/ChatTable.dart';
import 'package:flutter_app_architecture/data/local/db/DatabaseHelper.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  @override
  Widget build(BuildContext context) {
    Future<List<Chats>> chats = DatabaseHelper.instance.getChatsFromDB();
    return FutureBuilder(
      future: DatabaseHelper.instance.getChatsFromDB(),
      builder: (_, AsyncSnapshot<List<Chats>> snapShot) {
        if (!snapShot.hasData)
          return new Container();
        if (snapShot.hasData) {
          var chats = snapShot.data;

          return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (_, int index) {
                var chat = chats[index];
                return ChatItems(chat);
              });
        } else if (snapShot.hasError) {
          return Center(
            child: Text('No Data Available'),
          );
        }
      },
    );
  }

}

