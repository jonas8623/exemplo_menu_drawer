import 'dart:async';

import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {


  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  _text(String? message) {
    return Text(message ?? 'Sem dados');
  }

  _buttonScrren1() {
    return TextButton.icon(
      // Navigator.pop(context) assim que clicar irá fechar a navegação
        onPressed: () => Timer(Duration(milliseconds: 2), () => Navigator.pop(context)),
        icon: Icon(Icons.arrow_back),
        label: _text('Voltar para tela principal')
    );
  }

  Widget _image() {
    return Image.network('https://s2.glbimg.com/ZujuutjDJcUQHbMNep_ORKAfcYY=/0x0:1000x563/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2019/W/0/druexwT5Kqr3gJywnl6Q/bubbles.jpg');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( title: _text('Screen 1'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _text('Está na tela 1'),),
          _image(),
          _buttonScrren1()
        ],
      ),
    );
  }
}
