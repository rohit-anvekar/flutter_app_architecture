import 'package:flutter_app_architecture/model/Chats.dart';

abstract class ApiInterface {
  Future<List<Chats>> getChats();
}
