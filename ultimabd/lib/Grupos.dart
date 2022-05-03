class Grupos {
  final int id;
  final String nombre;
  final int idUsuario;
  final String tipo;
  final bool publico;

  Grupos(this.id, this.nombre, this.idUsuario, this.tipo, this.publico);
}

List<Grupos> gruposDatos = [];
