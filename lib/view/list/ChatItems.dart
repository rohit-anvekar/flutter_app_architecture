import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app_architecture/model/Chats.dart';
import 'package:flutter_app_architecture/view/screen/ChatWindow.dart';

class ChatItems extends StatelessWidget {
  final Chats chats;

  ChatItems(@required this.chats);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        chats.title,
        style: TextStyle(color: Colors.green),
      ),
      subtitle: Text(chats.director),
      leading: CircleAvatar(
        backgroundColor: Colors.greenAccent,
        radius: 20,
        child: Text(
          chats.title.substring(0, 1),
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
      ),
      contentPadding: EdgeInsets.only(left: 10.0),
      trailing: Icon(FontAwesomeIcons.angleRight),
      onLongPress: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(chats.title)));
      },
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                ChatWindow(userName: chats.title)));
      },
    );
  }
}
