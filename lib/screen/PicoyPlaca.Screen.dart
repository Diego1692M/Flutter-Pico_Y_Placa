import 'package:flutter/material.dart';
import 'package:picoyplaca/model/InfraccionesModel.dart';
import 'package:provider/provider.dart';

class PicoyPlaca extends StatefulWidget {
  const PicoyPlaca({super.key, required String title});

  @override
  State<PicoyPlaca> createState() => _PicoyPlacaState();
}

class _PicoyPlacaState extends State<PicoyPlaca> {
  String placa = "";
  String diaPicoPlaca = "";

  void consultarPicoPlaca() {
    if (placa.length != 6) {
      setState(() {
        diaPicoPlaca = "Placa inválida. Debe tener 6 caracteres.";
      });
      return;
    }

    int ultimoDigito = int.parse(placa[5]);
    switch (ultimoDigito) {
      case 0:
      case 1:
        diaPicoPlaca = "Tienes el dia Lunes";
        break;
      case 2:
      case 3:
        diaPicoPlaca = "Tienes el dia Martes";
        break;
      case 4:
      case 5:
        diaPicoPlaca = "Tienes el dia Miércoles";
        break;
      case 6:
      case 7:
        diaPicoPlaca = "Tienes el dia Jueves";
        break;
      case 8:
      case 9:
        diaPicoPlaca = "Tienes el dia Viernes";
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movilidad en Linea',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pico y Placa',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                  diaPicoPlaca = "";
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: consultarPicoPlaca,
              child: const Text("Consultar"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), // background color
                foregroundColor:
                    MaterialStateProperty.all(Colors.white), // text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<InfraccionesModel>(context, listen: false)
                    .agregarInfraccion(placa);
              },
              child: const Text("Agregar infracción"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), // background color
                foregroundColor:
                    MaterialStateProperty.all(Colors.white), // text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/infracciones');
              },
              child: const Text("Ver infracciones"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), // background color
                foregroundColor:
                    MaterialStateProperty.all(Colors.white), // text color
              ),
            ),
            const SizedBox(height: 20),
            Text(
              diaPicoPlaca,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
