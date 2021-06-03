import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/routes.dart';

void main() async{
  DBManager dbManager = DBManager();
  await dbManager.init();
  await dbManager.loginUser('wiszowaty', 'wiszowaty');
  bool isOrganiser = await dbManager.checkOrganiser();
  runApp(MyApp(isOrganiser));
}

class MyApp extends StatelessWidget {
  MyApp(this.isOrganiser);
  bool isOrganiser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: isOrganiser == false ? '/player': '/organiser',
      routes: routes,
    );
  }
}