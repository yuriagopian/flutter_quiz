import 'package:flutter/material.dart';
import './components/questao.dart';
import './components/resposta.dart';

int primaryColor = 0xFFAED581;

main() => runApp(PerguntaApp());

//private class
class _PerguntaAppState extends State<PerguntaApp> {
  //private variable
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Gato', 'Cachorro', 'Cavalo', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrumento favorito?',
      'respostas': ['Violão', 'Bateria', 'Flauta', 'Guitarra'],
    },
  ];

//private method
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
/** dando errado
 * List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
   List<Widget> widgets =
   respostas.map((t) => Resposta(t, _responder)).toList();
 * 
 */

    var obj = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].values.elementAt(1)
        : null;

    List<String>? respostas =
        temPerguntaSelecionada ? obj as List<String> : null;

    List<Widget> widgets = temPerguntaSelecionada
        ? respostas!.map((texto) => Resposta(texto, _responder)).toList()
        : [];

    // for (String textoResp in repostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Color(primaryColor),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...widgets,
                  // Questao(perguntas[_perguntaSelecionada]),// antigo
                  // Resposta('teste', _responder)
                  // Possibilidades de passar uma funcao para o onpressed
                  // ElevatedButton(onPressed: _responder, child: Text('Resposta 3')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       print('Pergunta 2 respondida!!!');
                  //     },
                  //     child: Text('Resposta 2')),
                  // ElevatedButton(
                  //     onPressed: () => print('Pergunta 3 respondida!!!'),
                  //     child: Text('Resposta 3')),
                ],
              )
            : Center(
                child: Text(
                'Parabéns!',
                style: TextStyle(fontSize: 28),
              )),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() => _PerguntaAppState();
}
