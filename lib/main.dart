import 'package:cadastrodeencomendaamw/cadastroEncomenda.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Controle de encomendas", style: TextStyle(
          color: Colors.grey[800],
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*------------------------------------------- LOGO AME SPORTS */
              Center(
                child: Container(
                  height: 120.0,
                  width: 200.0,
                  //color: Colors.deepOrange,
                  child: Center(
                      child: Image.asset("assets/images/logo-amwsports.png")
                  ),
                ),
              ),
              /*--------------------------------------- FIM LOGO AME SPORTS */
            ],
          ),
          /*----------------------------------- Texto Controle de encomendas */
          Container(
            height: 250.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Text("Controle de encomendas", style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),),
                SizedBox(height: 10.0,),
                Text(
                  "O que deseja fazer?",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /*------------------------ Fim Texto Controle de encomendas */
                SizedBox(height: 18.0,),

                /*----------------------------------------- Botão cadastrar */
                Container(

                  width: 195.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => CadastroEncomenda(),
                        ),);
                    },
                    child: Center(
                      child: Text("Cadastrar encomenda", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),
                    ),
                  ),
                ),

                /*------------------------------------- Fim Botão cadastrar */

                SizedBox(height: 10.0,),

                /*----------------------------------- Visualizar encomendas */

                Container(
                  width: 195.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Center(
                      child: Text("Visualizar encomendas", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),
                    ),
                  ),
                ),

                /*------------------------------- Fim Visualizar encomendas */

                SizedBox(height: 10.0,),

                /*---------------------------------------- Gerar relatórios */

                Container(
                  width: 195.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Center(
                      child: Text("Gerar relatórios", style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),
                    ),
                  ),
                ),

                /*------------------------------------ Fim Gerar relatórios */
              ],
            ),
          ),

          /*---------------------------------------------------- Botão Sair */
          SizedBox(height: 40.0,),
          Container(
            width: 100.0,
            height: 35.0,
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
      ),
    );
  }
}
