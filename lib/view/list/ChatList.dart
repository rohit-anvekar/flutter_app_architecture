import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/view/list/ChatItems.dart';
import 'package:flutter_app_architecture/model/Chats.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app_architecture/viewmodel/MainViewModel.dart';
import 'package:flutter_app_architecture/data/local/db/table/ChatTable.dart';
import 'package:flutter_app_architecture/data/local/db/DatabaseHelper.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Chats>>(
          future: model.chats,
          builder: (_, AsyncSnapshot<List<Chats>> snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                {
                  return Center(child: const CircularProgressIndicator());
                }
              case ConnectionState.done:
                {
                  if (snapShot.hasData) {
                    var chats = snapShot.data;

                    //Save to database
                    DatabaseHelper.instance.saveChats(chats);

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
                }
            }
          },
        );
      },
    );
  }

}

