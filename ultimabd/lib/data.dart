import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ultimabd/Calendario.dart';
import 'package:ultimabd/Grupos.dart';
import 'package:ultimabd/Mensajes.dart';
import 'package:ultimabd/Usuarios.dart';

Future<dynamic> getUsuarios() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("usuarios");
  QuerySnapshot usuarios = await collectionReference.get();
  usuariosDatos = [];
  if (usuarios.docs.isNotEmpty) {
    for (var item in usuarios.docs) {
      usuariosDatos.add(Usuarios(
          item["idu"],
          item["nivel"],
          item["nombre"],
          item["correo"],
          item["password"],
          item["nombre"],
          item["tipo"],
          item["avatar"]));
    }
  }
  return usuariosDatos;
}

Future<dynamic> getGrupos() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("grupos");
  QuerySnapshot grupos = await collectionReference.get();
  gruposDatos = [];
  if (grupos.docs.isNotEmpty) {
    for (var item in grupos.docs) {
      gruposDatos.add(Grupos(item["idg"], item["nombre"], item["idusuario"],
          item["tipo"], item["publico"]));
    }
  }
  return gruposDatos;
}

Future<dynamic> getCalendario() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("calendario");
  QuerySnapshot calendario = await collectionReference.get();
  calendarioDatos = [];
  if (calendario.docs.isNotEmpty) {
    for (var item in calendario.docs) {
      calendarioDatos.add(Calendario(
          item["ide"],
          item["idusuario"],
          item["nombre"],
          item["fecha_ini"],
          item["fecha_fin"],
          item["hora_ini"],
          item["hora_fin"],
          item["detalles"],
          item["tipo"],
          item["img_ini"],
          item["img_fin"]));
    }
  }
  return calendarioDatos;
}

Future<dynamic> getMensajes() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("mensajes");
  QuerySnapshot mensajes = await collectionReference.get();
  mensajesDatos = [];
  if (mensajes.docs.isNotEmpty) {
    for (var item in mensajes.docs) {
      mensajesDatos.add(Mensajes(
          item["idm"],
          item["idu_de"],
          item["idu_para"],
          item["titulo"],
          item["mensaje"],
          item["idgrupo"],
          item["fecha"],
          item["hora"],
          item["tags"]));
    }
  }
  return mensajesDatos;
}
