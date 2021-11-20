
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';
import 'package:menu_drawer/views/views.dart';

class MenuDrawer extends StatelessWidget {

  double _leftValues = 16.0;

  _text(String? message, {double fontSizeExample = 17.3}) {
    return Text(
        message ?? 'Sem dados',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: fontSizeExample
        ),
    );
  }

  // Criando um cabeçalho no menu
  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero, // Margens 0
        padding: EdgeInsets.zero, // Preenchimento 0
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.indigoAccent,
                Theme.of(context).primaryColor
              ],
            begin: Alignment.centerLeft, // Começo do gradiente e posição
            end: Alignment.bottomRight // Final do gradiente e posição
          )
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 12.5,
                left:  _leftValues,
                child: _text('test@gmail.com')
            ),
            Positioned(
                left: _leftValues,
                child: Icon(
                  Icons.person, size: 150,
                )
            ),
          ],
        )
    );
  }

  // Criando itens para menu com parametros opcionais obrigatórios
  Widget _createDrawerItem({ required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile( // Criando uma lista
      title: Row(
        children: [
          Icon(icon),
          Padding(
              padding: const EdgeInsets.only(
                  left: 8.0
              ),
            child: _text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  _sizedBox() {
    return SizedBox(
      height: 10.2,
    );
  }

  _divider() {
    return Divider();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context), // cabeçalho
          _sizedBox(),
          // Inserindo itens para o menu
          _createDrawerItem(
              icon: Icons.home,
              text: Constant.MENU_HOME,
              onTap: () => _closeField(context)
            // Quando clicar no botão ele ira sair
          ),
          _sizedBox(),
          _divider(),
          _createDrawerItem(
              icon: Icons.list,
              text: Constant.MENU_SCREEN_1,
              onTap: () {
                _closeField(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen1()));
              }
          ),
          _divider(),
          _createDrawerItem(
              icon: Icons.list,
              text: Constant.MENU_SCREEN_2,
              onTap: () {
                _closeField(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen2()));
              }
          ),
          _divider(),
          _createDrawerItem(
              icon: Icons.info_rounded,
              text: Constant.MENU_ABOUT,
              onTap: () {
                _closeField(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => About()));
              }
          ),
          _createDrawerItem(
              icon: Icons.exit_to_app,
              text: Constant.MENU_EXIT,
              onTap: () => _deviceOutputMode()
          ),
        ],
      ),
    );

  }
  _closeField(BuildContext context) => Navigator.of(context).pop();

  _deviceOutputMode() {
    // Modo de saída se for para android
    if(Platform.isAndroid) {
      SystemNavigator.pop();
    } else if(Platform.isIOS) { // Modo de saída se for para iOS
      exit(0);
    }
  }


}
