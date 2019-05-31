import 'package:flutter/material.dart';
import 'viewmodel/MainViewModel.dart';
import 'view/screen/SplashScreen.dart';
import 'view/screen/HomeScreen.dart';
import 'remote/service/ApiService.dart';


final MainViewModel mainPageVM = MainViewModel(apiInterface: ApiService());


void main() => runApp(MainApplication(mainViewModel: mainPageVM));

class MainApplication  extends StatelessWidget {

  final MainViewModel mainViewModel;

  MainApplication({@required this.mainViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen' : (BuildContext content) => HomeScreen(mainViewModel: mainViewModel)
      }
      ,debugShowCheckedModeBanner: false
    );
  }
}

