import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key});

  void _handleCardClick(BuildContext context, int index) {
    // Implemente o que você deseja fazer quando um card for clicado
    print('Card clicado: $index');
    // Por exemplo, você pode navegar para outra tela:
    // Navigator.pushNamed(context, '/detalhes', arguments: index);
  }

  @override
  Widget build(BuildContext context) {
    // Lista de caminhos para as imagens
    List<String> imagePaths = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de colunas
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _handleCardClick(context, index),
            child: Card(
              color: Color(0xFF03A9F4),
              child: SizedBox(
                width: 200.0, // Defina a largura desejada para o card
                height: 200.0, // Defina a altura desejada para o card
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
