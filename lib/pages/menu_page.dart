import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key});

  void _handleCardClick(BuildContext context, int index) {
    print('Card clicado: $index');

    if (index == 0) {
      print('Card clicado: $index');
    } else if (index == 1) {
    } else if (index == 2) {
    } else if (index == 3) {
    } else if (index == 4) {
    } else if (index == 5) {}
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
      backgroundColor: Color.fromARGB(255, 207, 221, 240),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: kIsWeb ? 6 : 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _handleCardClick(context, index),
              child: Card(
                color: Color(0xFF03A9F4),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
