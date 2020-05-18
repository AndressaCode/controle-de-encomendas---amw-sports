import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroEncomenda extends StatefulWidget {
  @override
  _CadastroEncomendaState createState() => _CadastroEncomendaState();
}

class _CadastroEncomendaState extends State<CadastroEncomenda> {

  var selectedCliente;
  var selectedProduto;

  //List<String> _clientes = <String>[
    //'001',
    //'002',
    //'003'
  //];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Cadastro de encomendas", style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 80.0,
                width: 80.0,
                //color: Colors.deepOrange,
                child: Center(
                    child: Image.asset("assets/images/logo-amwsports.png")
                ),
              ),
            ),

            /* ----------------------------------------- CONTAINER PRINCIPAL */

            Container(
              height: 410.0,
              width: 390.0,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),

                  /* ----------------------------------------------- Cliente */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.0,
                        height: 20.0,
                        //color: Colors.grey,
                        child: Text("Cliente", style: TextStyle(
                          color: Colors.grey[800],
                        ),),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          width: 80.0,
                          color: Colors.white,
                          /*child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Fonte de venda',
                            ),
                          ),*/
                          child: StreamBuilder<QuerySnapshot>(
                              stream: Firestore.instance.collection("catalogo-clientes").snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Text("Loading......");
                                else {
                                  List<DropdownMenuItem> clientela = [];
                                  for (int i = 0; i < snapshot.data.documents.length; i++) {
                                    DocumentSnapshot snap = snapshot.data.documents[i];
                                    clientela.add(
                                      DropdownMenuItem(
                                        child: Text(
                                          snap.documentID,
                                          style: TextStyle(color: Colors.deepOrange),
                                        ),
                                        value: "${snap.documentID}",
                                      ),
                                    );
                                  }
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10.0,),
                                      DropdownButton(
                                        items: clientela,
                                        onChanged: (clientes){
                                          final snackBar = SnackBar(
                                            content: Text(
                                              'Cliente selecionado $clientes',
                                              style: TextStyle(color: Colors.deepOrange),
                                            ),
                                          );
                                          Scaffold.of(context).showSnackBar(snackBar);
                                          setState(() {
                                            selectedCliente = clientes;
                                          });
                                        },
                                        value: selectedCliente,
                                        isExpanded: false,
                                        hint: Text(
                                            "Clientes"
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  /* ------------------------------------------- Fim Cliente */

                  /* ------------------------------------------------ Produto*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.0,
                        height: 20.0,
                        //color: Colors.grey,
                        child: Text("Produto", style: TextStyle(
                          color: Colors.grey[800],
                        ),),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição do produto',
                            ),
                          ),
                          /*StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance.collection("produtos").snapshots(),
                            builder: (context, snapshot){
                              if(!snapshot.hasData)
                                return Text("Carregando");
                              else{
                                List<DropdownMenuItem> prod = [];
                                for(int i=0; i<snapshot.data.documents.length; i++){
                                  DocumentSnapshot snapProduto = snapshot.data.documents[i];
                                  prod.add(
                                    DropdownMenuItem(
                                      child: Text(
                                        snapProduto.documentID,
                                        style: TextStyle(
                                          color: Colors.deepOrange
                                        ),
                                      ),
                                      value: "{$snapProduto.docID}",
                                    ),
                                  );
                                }
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10.0,),
                                    DropdownButton(
                                      items: prod,
                                      onChanged: (catalogoProduto){
                                        final snackProduto = SnackBar(
                                          content: Text(
                                            'Produto selecionado $catalogoProduto',
                                            style: TextStyle(
                                              color: Colors.deepOrange
                                            ),
                                          ),
                                        );
                                        Scaffold.of(context).showSnackBar(snackProduto);
                                        setState(() {
                                          selectedProduto = catalogoProduto;
                                        });
                                    },
                                      value: selectedProduto,
                                      isExpanded: false,
                                      hint: Text('Produtos'),
                                    ),
                                  ],
                                );
                              }
                            }
                          )*/
                        ),
                      ),
                    ],
                  ),

                  /* -------------------------------------------- Fim Produto*/

                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.0,
                        height: 20.0,
                        //color: Colors.grey,
                        child: Text("Já enviou?", style: TextStyle(
                          color: Colors.grey[800],
                        ),),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Informe se o produto foi enviado',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.0,
                        height: 20.0,
                        //color: Colors.grey,
                        child: Text("Quantidade", style: TextStyle(
                          color: Colors.grey[800],
                        ),),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantidade de produtos',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.0,
                        height: 20.0,
                        //color: Colors.grey,
                        child: Text("Observação", style: TextStyle(
                          color: Colors.grey[800],
                        ),),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Observações gerais',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* ------------------------ Container botoes Salvar ou cancelar */
                  SizedBox(height: 20.0,),
                  Container(
                      height: 70.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        //color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35.0,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.save, color: Colors.white,),
                              ),
                              /*child: FlatButton.icon(
                                onPressed: () {},
                                label: Text("Salvar", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),),
                                icon: Icon(Icons.save, color: Colors.white,),
                              ),*/
                            ),
                            SizedBox(width: 28.0,),
                            Container(
                              height: 35.0,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.white,),
                              ),
                              /*child: FlatButton.icon(
                                onPressed: () {},
                                label: Text("Cancelar", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),),
                                icon: Icon(Icons.delete, color: Colors.white,),
                              ),*/
                            ),
                          ],
                        ),
                      )
                  ),
                  /* -------------------- Fim Container botoes Salvar ou cancelar */
                ],
              ),
            ),
            /* ------------------------------------- Fim Container principal*/

            /* -------------------------------------------- Container botoes*/
            SizedBox(height: 10.0,),
            Container(
              height: 80.0,
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35.0,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: FlatButton.icon(
                      onPressed: () {},
                      label: Text("Voltar", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                    ),
                  ),
                  SizedBox(width: 8.0,),
                  Container(
                    height: 35.0,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: FlatButton.icon(
                      onPressed: () {},
                      label: Text("Sair", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),
                      icon: Icon(Icons.exit_to_app, color: Colors.white,),
                    ),
                  ),
                ],
              )
            ),
            /* ---------------------------------------- Fim Container botoes*/
          ],
        ),
      ),
    );
  }
}
