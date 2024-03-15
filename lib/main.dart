import 'package:flutter/material.dart';
import 'package:picoyplaca/model/InfraccionesModel.dart';
import 'package:picoyplaca/screen/Infracciones.Screen.dart';
import 'package:picoyplaca/screen/PicoyPlaca.Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InfraccionesModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pico y Placa',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/', // La ruta inicial es '/'
      routes: {
        '/': (context) => const PicoyPlaca(
            title: 'Movilidad en Linea'), // '/' corresponde a PicoyPlaca
        '/infracciones': (context) =>
            const InfraccionScreen(), // '/infracciones' corresponde a InfraccionScreen
      },
    );
  }
}
