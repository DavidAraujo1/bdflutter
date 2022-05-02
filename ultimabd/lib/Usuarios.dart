class Usuarios {
  final num id;
  final String nivel;
  final String usuario;
  final String correo;
  final String password;
  final String nombre;
  final String tipo;
  final String avatar;

  Usuarios(this.id, this.nivel, this.usuario, this.correo, this.password,
      this.nombre, this.tipo, this.avatar);
}

List<Usuarios> usuariosDatos = [];
