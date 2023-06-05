import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//AQUI CRIEI OUTRA VARIAVEL DO TIPO STRING VAZIA PARA PODER PEGAR A INFORMAÇÃO DO BANCO DE DADOS
String? dados_tb = '';

// A VARIAVEL DADOS ESTA RECEBENDO UMA CHAMADA DO FIREBASE ONDE ME DA O ACESSO A COLEÇÃO TESTE
//POIS ASSIM ATRAVES DELA CONSIGO ACESSAR O DOCUMENTO QUE TEM A INFORMAÇÃO DO ITEM
final dados = FirebaseFirestore.instance.collection('teste');

// ESTA FUNÇÃO BUSCA O ITEM DENTRO DO DOCUMENTO QUE ESTA NA COLEÇÃO TESTE 
//PASSANDO O NOME DO MEU DOCUMENTO QUE NOMEEI COMO 1 E COLOCO DENTRO DA MINHA VARIAVEL 
// DADOS_TB QUE ERA UMA STRING VAZIA MAS AGORA TEM O DADO DO MEU BANCO DE DADOS*/ 
buscaItem() async {
  await dados.doc('1').get().then((snapshot) async {
    dados_tb = snapshot.data()!['Item'];
  });
}

// AQUI TENHO A MINHA CLASSE SEGUNDA TELA QUE CRIEI PARA TER ACESSO AO SETSTATE 
// O SETSTATE É UTILIZADO PARA EU CONSEGUIR ATUALIZAR A MINHA PAGINA SEM TER QUE CONSTRUILA DENOVO*/
class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  _SegundaTelaState createState() =>_SegundaTelaState();
}

// DESTA FORMA NA MINHA CLASSE PRINCIPAL EU EXTENDO A MINHA CLASE PARA ASSIM UTILIZAR O SETSTATE
class _SegundaTelaState extends State<SegundaTela>{
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item adicionado'),
      ),
      
      // AQUI DA MESMA FORMA QUE NA PRIMEIRA TELA EU COLOQUEI MEUS COMPONENTES DENTRO DE UMA COLUNA 
      // PARA DEIXA-LOS MAIS ORGANIZADO */
      body: Column(
        // COMO EU SEI QUE TENHO QUE EXIBIR UM TEXTO E DOIS BOTOES CRIEI UMA COLUNA E DESTA COLUNA 
        // SEI QUE EU TEREI NO MINIMO 3 COMPONENTES DENTRO DELA POR ISSO UTILIZO O CHILDREN*/
        children: [

// -------------------------------- TEXTO QUE APRESENTA O ITEM -----------------------------------

          // MAIS UMA VEZ UTILIZO O PADDING PARA ESTILIZAR O MEU COMPONENTE DE TEXTO
          Padding(
            // DANDO A ELE ALGUMAS MARGENS POIS QUURO QUE ELE FIQUE MAIS A ESQUERDA ENTÃO DEI A ELE
            padding: const EdgeInsets.fromLTRB(0, 5, 200, 0),
            // AQUI TENHO O MEU TEXTO QUE INFORMARÁ O MEU ITEM DO BANCO DE DADOS 
            // SENDO ASSIM COLOCO UM TEXTO DO MEU ITEM E JUNTO COLOCO A MINHA VARIAVEL DADOS_TB
            // QUE TEM O DADO DO MEU BANCO DE DADOS E ASSIM DESTA FORMA ELE APRESENTA JUNTO NO TEXTO*/
            child: Text('Item: ${dados_tb.toString()}',

            // AQUI EU ESTILIZO A COR DO TEXTO E O TAMANHO DELE
            style: const TextStyle(fontSize: 20, color: Colors.black)
            ),
          ),
// ----------------------------------- FIM DO TEXTO QUE APRESENTA MEU ITEM -----------------------

          // COMO QUERO DEIXAR MEUS BOTÕES ALINHADOS LADO A LADO UTILIZO O ROW PARA ISTO
          Row(
            children: [

// --------------------------------- BOTAO BUSCAR ITEM ---------------------------------------------

              // O PADDING É PARA ESTILZAR O MEU BOTÃO NO CASO A MARGEM DELE
            Padding(
              // O PADDING QUE UTILIZA O .ALL ELE FAZ COM QUE EU NAO PRECISE COLOCAR 
              // O TAMANHO PARA CADA DIREÇÃO (ESQUERDA,ENCIMA ,DIREITA,BAIXO) COMO É FEITO NO .fromLTRB
              padding: const EdgeInsets.all(8.0),
              
              // AQUI TENHO O BOTÃO QUE IRA BUSCAR O ITEM DO BANCO DE DADOS
                 child: ElevatedButton(
                  // UM TEXTO INFORMANDO A FUNCIONALIDADE DO BOTÃO
                     child: const Text('Buscar Item'),
                     // E DENTRO DO ONPRESSED TENHO A AÇÃO DO MEU BOTÃO QUE NO CASO 
                     // É A FUNÇÃO DE BUSCAR A INFORMAÇÃO DO BANCO DE DADOS
                        onPressed: () {
                          // UTILIZO AQUI DENTRO O SETSTATE QUE É 
                          // UMA FORMA DE FORÇAR A PAGINA ATUALIZAR SEM PRECISAR SAIR DELA E VOLTAR
                            setState(() {
                              //AQUI TENHO A MINHA FUNÇÃO DE BUSCAR O ITEM NO BANCO DE DADOS
                                buscaItem();
                            });
                        },
                       ),
          ),

// --------------------------------- FIM DO BOTÃO DE BUSCA ITEM ------------------------------------


// --------------------------------- BOTÃO RETORNAR PAGINA ANTERIOR --------------------------------

          Padding(
            // UTILIZO O MESMO TIPO DE MARGEM UTILIZANDO O PADDING 
            padding: const EdgeInsets.all(8),

            //O MEU BOTÃO DE RETORNAR
            child: ElevatedButton(
              //O TEXTO QUE ELE IRÁ INFORMAR A SUA FUNÇÃO
              child: const Text('Retornar'),
              // E NO ONPRESSED É ONDE OCORRE A AÇÃO DO MEU BOTÃO
                onPressed: () {
                  // QUE NESTE CASO UTILIZO O NAVIGATOR PARA VOLTAR A TELA ANTERIOR
                  Navigator.pop(context);
                },
            ),
          )

// ----------------------------------- FIM DO BOTÃO RETORNAR --------------------------------------

          ],)
        ],
      ),
    );
  }
}