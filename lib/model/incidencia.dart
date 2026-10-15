class Incidencia {
  static const List<String> prioridadesValidas = [
    'Baja',
    'Media',
    'Alta',
  ];

  String id;
  String titulo;
  String descripcion;
  String cliente;
  String categoria;
  String estado;
  String fecha;
  String prioridad;

  Incidencia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.cliente,
    required this.categoria,
    required this.estado,
    required this.fecha,
    String prioridad = 'Media',
  }) : prioridad = prioridadesValidas.contains(prioridad)
            ? prioridad
            : 'Media';

  factory Incidencia.desdeJson(Map<String, dynamic> m) {
    final prioridadJson = m['prioridad']?.toString() ?? 'Media';

    return Incidencia(
      id: m['id']?.toString() ?? '',
      titulo: m['titulo']?.toString() ?? '',
      descripcion: m['descripcion']?.toString() ?? '',
      cliente: m['cliente']?.toString() ?? '',
      categoria: m['categoria']?.toString() ?? 'Software',
      estado: m['estado']?.toString() ?? 'Pendiente',
      fecha: m['fecha']?.toString() ?? '',
      prioridad: prioridadJson,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'cliente': cliente,
      'categoria': categoria,
      'estado': estado,
      'fecha': fecha,
      'prioridad': prioridad,
    };
  }

  void cambiarPrioridad(String nuevaPrioridad) {
    if (!prioridadesValidas.contains(nuevaPrioridad)) {
      throw ArgumentError.value(
        nuevaPrioridad,
        'nuevaPrioridad',
        'La prioridad debe ser Baja, Media o Alta.',
      );
    }

    prioridad = nuevaPrioridad;
  }
}