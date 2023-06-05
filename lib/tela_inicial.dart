import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste/segunda_tela.dart';

final itemClear = TextEditingController();

// FUNÇÃO QUE LIMPA O CAMPO DIGITADO NO TEXTFIELD
void limparCampo() {
  itemClear.clear();
}

class PrimeiraTela extends StatelessWidget{

  //MINHA VARIAVEL QUE ARMAZENARÁ O TEXTO DIGITADO
  late String item = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar item'),
      ),
      // AQUI É O CORPO DA MINHA PRIMEIRA TELA 
      // E PARA MONTAR A TELA DECIDI COLOCAR TODOS OS COMPONENTES NELA DENTRO DE UM COLUNA
      body: Column(
        //O CHILDREN SIGINIFICA QUE DENTRO DESTA COLUNA HAVERA VARIOS COMPONENTES DENTRO DELA
        children: [
          // O COMPONENTE CENTER ESTA CENTRALIZANDO OS COMPONENTES QUE SÃO FILHOS DELE
          // NESTE CASO O TEXTFIELD
          Center(
            // O TEXTFIELD É UM COMPONENTE QUE PROPORCIONA EU INCLUIR UM TEXTO NELE
            // ENTÃO POSSO ESCREVER DENTRO DELE O ITEM QUE EU ESTAREI ADICIONANDO*/
            child: TextField(
              // A PROPRIEDADE CONTROLER É UMA PROPRIEDADE QUE TERÁ UMA VARIAVEL DO TIPO 
              // TEXTEDITCONTROLER QUE PERMITIRA EU CONTROLAR O CAMPO PARA EDITAR O TEXTO*/
              controller: itemClear,
              // O STYLE É UMA FORMA DE EU CONSEGUIR DEIXAR O TEXTO COM O TAMANHO DA FONTE QUE EU QUERO
              //DA COR QUE EU QUERO E TAMBEM DO ESTILO DA FONTE */
              style: const TextStyle(color: Colors.black, fontSize:30),
              //DECORATION OBTEM O INPUTDECORATION QUE NADA MAIS É O TEXTO APRESENTADO NO TEXTFIELD 
              //INFORMANDO QUE ALI DEVE SER INFORMADO UM ITEM*/
              decoration: const InputDecoration(
                labelText: "Informe um Item",
                labelStyle: TextStyle(color: Colors.black),
                ),
                // ONCHANGED É A PROPRIEDADE QUE FARA O TEXTO QUE FOI DIGITADO 
                // SEJA ARMAZENADO NA VARIAVEL ITEM QUE ERA UMA STRING VAZIA 
                // E AGORA TEM O TEXTO QUE FOI DIGITADO*/
              onChanged: (text) {
                item = text;
              },
            ),
          ),

// AQUI TENHO O MEU BOTÃO QUE FARÁ A AÇÃO DE ADICIONAR O ITEM NO BANCO DE DADOS

          // SEGUINDO, TENHO OS DOIS BOTÕES ENTAO DECIDI COLOCA-LOS LADO A LADO 
          // UTILIZANDO UM ROW QUE SIGNIFICA QUE DEIXAREI ELES LADO A LADO */
          Row(
            // AQUI DA MESMA FORMA TENHO UM CHILDREN PORQUE SEI QUE HAVERÁ MAIS QUE UM COMPONENTE AQUI
            children: [
              //O PADDING É UTILIZADO PARA EU ESTILIZAR O COMPONENTE SE EU QUERO ELE MAIS A ESQUERDA 
              //OU A DIREITA, MAIS PARA BAIXO, MAIS PARA O ALTO */
            Padding(
              // A PROPRIEDADE PADDING É QUE VAI RECEBER ESTAS INFORMAÇÕES SOBRE ELE FICAR NA POSIÇÃO QUE QUERO
              // ATRAVES DO FROMLTBR QUE PEGA O PIXEL DE DISTANCIA QUE EU QUERO PRIMEIRO 
              // A ESQUERDA,  ENCIMA, DIREITA OU PARA BAIXO
              padding: const EdgeInsets.fromLTRB(1, 2, 3, 4),
              // AQUI TENHO O FILHO DENTRO DO PADDING QUE RECEBE MEU BOTÃO DE ADICIONAR ITEM
              child: ElevatedButton(
                // DENTRO DO MEU BOTÃO DEVO COLOCAR UM TEXTO PARA INFORMAR O USUARIO QUE ATRAVÉS DELE IRA 
                // ADICIONAR O ITEM NO BANCO DE DADOS
                child: const Text('Adicionar Item'),
                // DENTRO DA PROPRIEDADE ONPRESSED É ONDE EU FAÇO A INSERÇÃO DO ITEM NO BANCO DE DADOS
                onPressed: () {
                  //AQUI ESTOU CHAMANDO A FUNÇÃO DO FIREBASE PARA ADICIONAR O ITEM DENTRO DA COLEÇÃO 
                  //QUE NOMEEI COMO TESTE E DENTRO DO TESTE TENHO A COLEÇÃO 1 E DENTRO DA COLEÇÃO TENHO O 
                  //MEU ITEM QUE FOI ADICIONADO */
                  FirebaseFirestore.instance.collection('teste').doc('1').set({"Item":item});
                  // AQUI TENHO A FUNÇÃO QUE VAI LIMPAR O CAMPO DO TEXTO DIGITADO
                  limparCampo();
                },
              ),
            ),

// AQUI TENHO O MEU SEGUNDO BOTÃO PARA IR PARA A SEGUNDA TELA

            //O PADDING É UTILIZADO PARA EU ESTILIZAR O COMPONENTE SE EU QUERO ELE MAIS A ESQUERDA 
            //OU A DIREITA, MAIS PARA BAIXO, MAIS PARA O ALTO */
            Padding(
              // A PROPRIEDADE PADDING É QUE VAI RECEBER ESTAS INFORMAÇÕES SOBRE ELE FICAR NA POSIÇÃO QUE QUERO
              // ATRAVES DO FROMLTBR QUE PEGA O PIXEL DE DISTANCIA QUE EU QUERO PRIMEIRO 
              // A ESQUERDA,  ENCIMA, DIREITA OU PARA BAIXO
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
              // AQUI TENHO O FILHO DENTRO DO PADDING QUE RECEBE MEU BOTÃO QUE FARÁ EU IR PARA OUTRA TELA
              child: ElevatedButton(
                // AQUI TENHO UM TEXTO INFORMANDO NO MEU BOTÃO 
                child: const Text('Ver Item'),
                // E DENTRO DO ONPRESSED É ONDE EU FAÇO A AÇÃO DO BOTÃO
                onPressed: () {
                  //NESTE CASO ESTOU UTILIZANDO O NAVIGATOR PARA ME DIRECIONAR PARA A SEGUNDA TELA*/
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