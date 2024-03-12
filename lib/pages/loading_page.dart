import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text('Carregando...',
                  style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
        ));
  }
}
