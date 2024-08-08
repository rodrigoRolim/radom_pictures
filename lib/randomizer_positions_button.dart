import 'dart:math';

import 'package:flutter/material.dart';

class RandomPositionsGeneratorButton extends StatefulWidget {
  final ValueChanged<Map<String, String>> onEmitPosition;
  const RandomPositionsGeneratorButton({super.key, required this.onEmitPosition});

  @override
  State<RandomPositionsGeneratorButton> createState() => RandomPositionsGeneratorButtonState();
}

class RandomPositionsGeneratorButtonState extends State<RandomPositionsGeneratorButton> {
  static List<Map<String, String>> imagePositions = [
    {'name': 'Cow girl', 'image': '10-Cow-Girl.jpeg'},
    {'name': 'Cadeira quente', 'image': '11-Cadeira-quente.jpeg'},
    {'name': 'No topo', 'image': '12-No-topo.jpeg'},
    {'name': 'Caminho para o céu', 'image': '13-Caminho-para-o-ceu.jpeg'},
    {'name': 'Vaqueira invertida', 'image': '14-Vaqueira-invertida.jpeg'},
    {'name': 'Posição do varão', 'image': '15-posicao-do-varao.jpeg'},
    {'name': 'O preguiçoso', 'image': '16-O-preguicoso.jpeg'},
    {'name': 'David copperfield', 'image': '17-David-Copperfield.jpeg'},
    {'name': 'O trono', 'image': '18-O-trono.jpeg'},
    {'name': 'Fechar o negócio', 'image': '19-Fechar-o-negocio.jpeg'},
    {'name': 'Bicicleta', 'image': '1-Bicicleta.jpeg'},
    {'name': 'Pretzel', 'image': '20-Pretzel.jpeg'},
    {'name': 'A estante', 'image': '21-A-estante.jpeg'},
    {'name': 'O G', 'image': '22-o-G.jpeg'},
    {'name': 'Cão', 'image': '23-Cao.jpeg'},
    {'name': 'Manteiga', 'image': '24-Manteiga.jpeg'},
    {'name': 'A bailarina', 'image': '25-A-bailarina.jpeg'},
    {'name': 'O chef', 'image': '26-o-chef.jpeg'},
    {'name': 'H2O', 'image': '27-H20.jpeg'},
    {'name': 'Carrinho de mão', 'image': '28-Carrinho-de-mao.jpeg'},
    {'name': 'Carrinho de mão sentado', 'image': '29-Carrinho-de-mao-sentado.jpeg'},
    {'name': 'Cara a cara', 'image': '2-Cara-a-cara.jpeg'},
    {'name': 'O dragão', 'image': '30-o-dragao.jpeg'},
    {'name': 'Serviço de quarto', 'image': '31-Servico-de-quarto.jpeg'},
    {'name': 'Surfista', 'image': '32-Surfista.jpeg'},
    {'name': 'Solução rápida', 'image': '33-Solucao-rapida.jpeg'},
    {'name': 'Mountain Climber', 'image': '34-Mountain-Climber.jpeg'},
    {'name': 'Missionário viciado', 'image': '35-Missionario-viciado.jpeg'},
    {'name': 'Missionário', 'image': '36-Missionario.jpeg'},
    {'name': 'Conchinha', 'image': '37-Conchinha.jpeg'},
    {'name': 'Spork', 'image': '38-Spork.jpeg'},
    {'name': 'Presente embrulhado', 'image': '39-Presente-embrulhado.jpeg'},
    {'name': 'O pluge', 'image': '3-O-plugue.jpeg'},
    {'name': 'Conchinha cara a cara', 'image': '40-Conchinha-cara-a-cara.jpeg'},
    {'name': 'O X', 'image': '41-o-X.jpeg'},
    {'name': 'Anjinho na neve', 'image': '42-anjinho-na-neve.jpeg'},
    {'name': 'Fusão', 'image': '43-Fusao.jpeg'},
    {'name': 'A aranha', 'image': '44-A-aranha.jpeg'},
    {'name': 'Mariposa', 'image': '45-Mariposa.jpeg'},
    {'name': '69', 'image': '46-69.jpeg'},
    {'name': 'Libélula', 'image': '47-Libelula.jpeg'},
    {'name': 'O elevador', 'image': '48-O-elevador.jpeg'},
    {'name': 'Torpedo suiço', 'image': '49-Torpedo-Suico.jpeg'},
    {'name': 'O cachorro', 'image': '4-O-cachorro.jpeg'},
    {'name': 'O estandarte', 'image': '50-O-estandarte.jpeg'},
    {'name': 'Pequena colher', 'image': '5-Pequena-colher.jpeg'},
    {'name': '69 em ponte', 'image': '6-69-em-ponte.jpeg'},
    {'name': 'O gato', 'image': '7-O-gato.jpeg'},
    {'name': 'A cascata', 'image': '8-A-cascata.jpeg'},
    {'name': 'Uma subida', 'image': '9-Uma-subida.jpeg'}
  ];
  final Set<int> _drawnPositions = {};
  final int numbersOfPositions = imagePositions.length;
  int _randomPosition = 0;

  void _generatorRandomPosition() {
    final random = Random();

    if (_drawnPositions.length == numbersOfPositions) {
      _drawnPositions.clear();
    }

    do {
      _randomPosition = random.nextInt(numbersOfPositions);
    } while(_drawnPositions.contains(_randomPosition));

    setState(() {
      _drawnPositions.add(_randomPosition);
      widget.onEmitPosition(imagePositions[_randomPosition]);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      child: ElevatedButton(
        onPressed: _generatorRandomPosition,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 248, 0, 95).withOpacity(0.8)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
          textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(fontSize: 24)),
          elevation: WidgetStateProperty.all<double>(1.0)
        ),
        child: const Text('Sortear posição')
      )
    );
  }
}
