import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  // Chave global para o card
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  // Renderizando a cor de plano de fundo
  _renderBackground() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
    );
  }

  _renderCard(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.fromLTRB(32.0, 45.0, 32.0, 62.0),
      color: Colors.white,
      child: FlipCard(
        key: _cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 3000,
        onFlipDone: (status) {
          print('status $status');
        },
        front: _renderFront(),
        back: _renderBack(),
      ),
    );
  }

  // Parte de trás do meu card
  _renderBack() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16.2)
      ),
    );
  }

  // Parte da frente do meu card
  _renderFront() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius:  BorderRadius.circular(16.2)
      ),
    );
  }

  _button() {
    return TextButton.icon(
        onPressed: () => Timer(Duration(milliseconds: 3), () => Navigator.pop(context)),
        icon: const Icon(Icons.arrow_back),
        label: const Text('Voltar para a tela principal')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Tela 2'),),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [
              Expanded(
                  child: _renderCard(context)
              ),
              _button()
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cardKey.currentState!.toggleCard(),
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
