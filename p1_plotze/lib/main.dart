// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:p1_plotze/view/about_us.dart';
import 'package:p1_plotze/view/email_sent.dart';
import 'package:p1_plotze/view/login.dart';
import 'package:p1_plotze/view/lista_de_compras.dart';
import 'package:p1_plotze/view/pwd_forgot.dart';
import 'package:p1_plotze/view/signup.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      //
      // Rotas de navegação
      //
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'shoppingList': (context) => ShoppingList(),
        'cadastro': (context) => Cadastro(),
        'recuperacao_senha': (context) => PasswordRecover(),
        'email_enviado': (context) => EmailSent(),
        'sobre': (context) => AboutUs(),
      },
    );
  }
}
