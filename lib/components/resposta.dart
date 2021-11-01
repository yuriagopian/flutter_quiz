import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelionado;

  Resposta(this.texto, this.quandoSelionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPressed: quandoSelionado,
        child: Text(texto),
      ),
    );
  }
}
