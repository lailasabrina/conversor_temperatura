import 'package:flutter/material.dart';


void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Conversor de Temperatura",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.purple[300],
        accentColor: Colors.purple,
        canvasColor: Colors.white,
        fontFamily: 'Hind',
      ),
      home: HomePage(),
    );
  }
}

TextEditingController celsiusController = TextEditingController();
TextEditingController fahrenheintController = TextEditingController();


 void limpar(){
    celsiusController.text = "";
    fahrenheintController.text = "";
      //SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Temperatura"),
        centerTitle: true,
         actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: limpar, 
        ),
      ],
        ),
        body: Conversor(),
    );
  }
}

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  void calcular(){
    double _celsius = double.tryParse(celsiusController.text);
    if (_celsius == null) {
      celsiusController.text = "Digite o grau em Celsius";
    } else {
      var fahrenheit = (9/5) * _celsius + 32;
      celsiusController.text = fahrenheit.toStringAsFixed(1) + "°F";
    }
  }

  void calcular2(){
    double _fahrenheit = double.tryParse(fahrenheintController.text);
    if (_fahrenheit == null) {
        fahrenheintController.text = "Digite o grau em Fahrenheit";
    } else {
      var celsius = (_fahrenheit-32)*(5/9);
        fahrenheintController.text = celsius.toStringAsFixed(1) + "°C";
    }
  }




  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Fahrenheit!",
            style: new TextStyle(
              fontSize: 35.0,
              color: Colors.purple[300],
              fontWeight: FontWeight.w300,
              fontFamily: "Hind"
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: celsiusController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Graus celsius"),
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.purple,
              fontWeight: FontWeight.w200,
              fontFamily: "Hind"
            ),
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () {
                  calcular();
                },
                color: Colors.purple[300],
                child: new Text(
                  "Calcular",
                  style: new TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Hind"
                  ),               
                ),
              ),
            ],
            ),
            Container(height: 30),
            Text(
            "Celsius!",
            style: new TextStyle(
              fontSize: 35.0,
              color: Colors.purple[300],
              fontWeight: FontWeight.w300,
              fontFamily: "Hind"
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: fahrenheintController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Graus fahrenheit"),
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.purple[300],
              fontWeight: FontWeight.w200,
              fontFamily: "Hind"
            ),
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () {
                  calcular2();
                },
                color: Colors.purple[300],
                child: new Text(
                  "Calcular",
                  style: new TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Hind"
                  ),                
                )
              ),
             
            ],
            
            ),
        ],
      ),
    );
  }
}

