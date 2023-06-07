import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste/segunda_tela.dart';

final itemClear = TextEditingController();

void limparCampo() {
  itemClear.clear();
}
class PrimeiraTela extends StatelessWidget{

  late String item = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
      ),
      body: Column(
        children: [
          Center(
            child: TextField(
              controller: itemClear,
              style: const TextStyle(color: Colors.black, fontSize:20),
              decoration: const InputDecoration(
                labelText: "Informe um Item",
                labelStyle: TextStyle(color: Colors.black),
                ),
              onChanged: (text) {
                item = text;
              },
            ),
          ),
          Row(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 2, 3, 4),
              child: ElevatedButton(
                child: const Text('Adicionar Item'),
                onPressed: () {
                  FirebaseFirestore.instance.collection('teste').doc('1').set({"Item":item});
                  limparCampo();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: ElevatedButton(
                child: const Text('Ver Item'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SegundaTela()),
                  );
                },
              ), 
            )
          ])
        ],
      )
    );
  }
}