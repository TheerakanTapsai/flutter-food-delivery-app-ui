import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app_ui/pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'model/SelectedIndex.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => SelectedIndexModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
      home: HomePage(),
    )));
