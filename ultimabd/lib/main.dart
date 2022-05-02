import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ultimabd/data.dart';

void main() {
  WidgetsFlutterBinding();
  Firebase.initializeApp().then(
    (value) {
      runApp(const Principal());
    },
  );
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase-Fluter',
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsuarios();
    getCalendario();
    getGrupos();
    getMensajes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
