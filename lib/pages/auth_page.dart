import 'package:applealogin/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 207, 221, 240),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/footer.png', fit: BoxFit.cover),
              ],
            ),
            Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Image.asset('assets/images/logo_lea.png',
                      fit: BoxFit.contain),
                  AuthForm(),
                ],
              )),
            ),
          ],
        ));
  }
}
