
import 'package:flutter/material.dart';
import 'package:menu_drawer/menu/menu.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _text(String? message) {
    return Text(message ?? 'Sem texto');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar( title: _text('Menu Drawer'),),
      drawer: MenuDrawer(), // Chamando o menu drawer
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _text('Pagina Principal'),
          )
        ],
      ),
    );
  }
}