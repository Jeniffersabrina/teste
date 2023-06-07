import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:teste/tela_inicial.dart';

Future<void> main() async {
  runApp(MaterialApp(
    title: 'Itens',
    theme: ThemeData(primarySwatch: Colors.green),
    home: PrimeiraTela(),
  ));
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}