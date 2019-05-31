import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_architecture/model/Chats.dart';
import 'package:flutter_app_architecture/data/remote/ApiInterface.dart';

class MainViewModel extends Model {
  final ApiInterface apiInterface;

  MainViewModel({@required this.apiInterface});

  Future<List<Chats>> _chats;
  Future<List<Chats>> get chats => _chats;

  set chats(Future<List<Chats>> chatList) {
    _chats = chatList;
    notifyListeners();
  }

  Future<bool> setChats() async {
    chats = apiInterface.getChats();
    return chats != null;
  }
}
