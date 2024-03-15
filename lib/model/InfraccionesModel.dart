import 'package:flutter/material.dart';

class InfraccionesModel extends ChangeNotifier {
  final Map<String, int> _infracciones = {};

  int numeroDeInfracciones(String placa) {
    return _infracciones[placa] ?? 0;
  }

  void agregarInfraccion(String placa) {
    if (_infracciones.containsKey(placa)) {
      _infracciones[placa] = _infracciones[placa]! + 1;
    } else {
      _infracciones[placa] = 1;
    }
    notifyListeners();
  }
}

