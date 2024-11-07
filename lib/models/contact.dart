class Contact {
  String id;
  String nome;
  String numero;

  Contact({required this.id, required this.nome, required this.numero});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'numero': numero,
    };
  }

  factory Contact.fromDocument(Map<String, dynamic> data, String id) {
    return Contact(
      id: id,
      nome: data['nome'],
      numero: data['numero'],
    );
  }
}
