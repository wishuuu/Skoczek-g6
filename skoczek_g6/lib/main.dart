import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/routes.dart';

bool isOrganiser;
void main() async{
  DBManager dbManager = DBManager();
  await dbManager.init();
  await dbManager.loginUser('wiszowaty', 'wiszowaty');
  isOrganiser = await dbManager.checkOrganiser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

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