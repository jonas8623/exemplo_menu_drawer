import 'dart:async';

import 'package:flutter/material.dart';

class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  _text(String? message) {
    return Text(
        message ?? 'Sme dados',
        style: TextStyle(
          fontWeight: FontWeight.w400
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar( title: _text('About'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _text('Está na tela sobre')
          ),
          TextButton.icon(
              onPressed: () => Timer(Duration(milliseconds: 4), () => Navigator.pop(context)),
              icon: const Icon(Icons.arrow_back),
              label: _text('Voltar para a tela principal')
          )
        ],
      ),
    );
  }
}
