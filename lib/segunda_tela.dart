import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String? dados_tb = '';

final dados = FirebaseFirestore.instance.collection('teste');

buscaItem() async {
  await dados.doc('1').get().then((snapshot) async {
    dados_tb = snapshot.data()!['Item'];
  });
}
class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  _SegundaTelaState createState() =>_SegundaTelaState();
}
class _SegundaTelaState extends State<SegundaTela>{
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item adicionado'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 200, 0),
            child: Text('Item: ${dados_tb.toString()}',
            style: const TextStyle(fontSize: 20, color: Colors.black)
            ),
          ),
          Row(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                     child: const Text('Buscar Item'),
                        onPressed: () {
                            setState(() {
                                buscaItem();
                            });
                        },
                       ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: const Text('Retornar'),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
          )
          ],)
        ],
      ),
    );
  }
}