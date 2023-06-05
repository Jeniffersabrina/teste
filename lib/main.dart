import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:teste/tela_inicial.dart';


// AQUI TENHO A MINHA CLASSE PRINCIPAL QUE SERÁ EXECUTADA AO RODAR O COMANDO FLUTTER RUN
Future<void> main() async {
  runApp(MaterialApp(
    title: 'Itens',
    theme: ThemeData(primarySwatch: Colors.green),
    // AQUI EU CHAMO A MINHA PRIMEIRA TELA PARA SER APRESENTADA COMO PRINCIPAL OU HOME
    home: PrimeiraTela(),
  ));
  
  // AQUI FAÇO A INICIALIZAÇÃO DO FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}