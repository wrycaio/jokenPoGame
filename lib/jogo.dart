import 'package:flutter/material.dart';
import 'dart:math';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var imagemApp = AssetImage("assets/padrao.png");

  var message1 = "Escolha uma opção abaixo: ";

  selecteOption(String userChoose) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var appChoose = options[number];

    //Image exhibition of algorithm choose
    switch (appChoose) {
      case "pedra":
        setState(() {
          this.imagemApp = AssetImage("assets/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          this.imagemApp = AssetImage("assets/tesoura.png");
        });
        break;
      case "papel":
        setState(() {
          this.imagemApp = AssetImage("assets/papel.png");
        });
        break;
    }
    // Winner Validation

    if ((userChoose == "pedra" && appChoose == "tesoura") ||
        (userChoose == "tesoura" && appChoose == "papel") ||
        (userChoose == "papel" && appChoose == "pedra")) {
      setState(() {
        this.message1 = "Parabéns!!! Você ganhou :)";
      });
    } else if ((appChoose == "pedra" && userChoose == "tesoura") ||
        (appChoose == "tesoura" && userChoose == "papel") ||
        (appChoose == "papel" && userChoose == "pedra")) {
      setState(() {
        this.message1 = "Você perdeu :(";
      });
    } else {
      setState(() {
        this.message1 = "Empatamos :)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(196, 133, 123, 0.5),
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 16),
            child: Text("Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Image(
            image: imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this.message1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => selecteOption("pedra"),
                  child: Image.asset(
                    "assets/pedra.png",
                    height: 95,
                  )),
              GestureDetector(
                  onTap: () => selecteOption("papel"),
                  child: Image.asset(
                    "assets/papel.png",
                    height: 95,
                  )),
              GestureDetector(
                onTap: () => selecteOption("tesoura"),
                child: Image.asset(
                  "assets/tesoura.png",
                  height: 95,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
