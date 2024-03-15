import 'package:flutter/material.dart';
import 'package:picoyplaca/model/InfraccionesModel.dart';
import 'package:provider/provider.dart';

class InfraccionScreen extends StatefulWidget {
  const InfraccionScreen({super.key});

  @override
  State<InfraccionScreen> createState() => _InfraccionScreenState();
}

class _InfraccionScreenState extends State<InfraccionScreen> {
  String placa = "";
  int numeroInfracciones = 0;

  final Map<String, int> infracciones = {
    "ABC123": 2,
    "DEF456": 1,
    "GHI789": 0,
  };

  void consultarInfracciones() {
    numeroInfracciones = Provider.of<InfraccionesModel>(context, listen: false)
        .numeroDeInfracciones(placa);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Infracciones', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/imagenes/ciudad.jpg'),
            //   fit: BoxFit.cover,
            // ),//Opcion para poner una imagen de fongo
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: "Número de placa",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    placa = value;
                    numeroInfracciones = 0;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: consultarInfracciones,
                child: const Text("Consultar"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.blue), // background color
                  foregroundColor:
                      MaterialStateProperty.all(Colors.white), // text color
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Número de infracciones: $numeroInfracciones",
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
