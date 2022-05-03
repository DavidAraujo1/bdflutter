import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ultimabd/Calendario.dart';
import 'package:ultimabd/Grupos.dart';
import 'package:ultimabd/Mensajes.dart';
import 'package:ultimabd/Usuarios.dart';
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
      debugShowCheckedModeBanner: false,
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
      appBar: AppBar(
        title: const Text("Mostrando datos Firebase"),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [mostrarDatos()],
        )),
      ),
    );
  }

  Widget mostrarDatos() {
    return FutureBuilder(
        future: getUsuarios(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: List.generate(usuariosDatos.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 110,
                              child: Text(
                                  "Nombre: ${usuariosDatos[index].nombre}")),
                          SizedBox(
                              width: 60,
                              child: Text(
                                  "Avatar: ${usuariosDatos[index].avatar}")),
                          SizedBox(
                              width: 175,
                              child: Text(
                                  "Correo: ${usuariosDatos[index].correo}")),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child:
                                  Text("Tipo: ${usuariosDatos[index].tipo}")),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 75,
                              child: Text(gruposDatos[index].nombre)),
                          SizedBox(
                              width: 50, child: Text(gruposDatos[index].tipo)),
                          SizedBox(
                              width: 150,
                              child: Text(
                                  gruposDatos[index].publico ? "Si" : "No")),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 350,
                              child: Text(
                                  "Mensaje: ${mensajesDatos[index].mensaje}"))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 50,
                              child: Text("De: ${mensajesDatos[index].iduDe}")),
                          SizedBox(
                              width: 150,
                              child:
                                  Text("Para: ${mensajesDatos[index].idPara}")),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 175,
                              child: Text(
                                  "Fecha Inicial: ${calendarioDatos[index].fechaIni}")),
                          SizedBox(
                              width: 175,
                              child: Text(
                                  "Fecha Recibido: ${calendarioDatos[index].fechaFin}")),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text(
                                  "Hora: ${calendarioDatos[index].horaIni}")),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
