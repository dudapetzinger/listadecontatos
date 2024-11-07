import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Adicionar contato
  static Future<void> addContact(Contact contact) async {
    await _db.collection('contacts').add(contact.toMap());
  }

  // Atualizar contato
  static Future<void> updateContact(Contact contact) async {
    await _db.collection('contacts').doc(contact.id).update(contact.toMap());
  }

  // Excluir contato
  static Future<void> deleteContact(String id) async {
    await _db.collection('contacts').doc(id).delete();
  }

  // Carregar contatos
  static Future<List<Contact>> getContacts() async {
    final snapshot = await _db.collection('contacts').get();
    return snapshot.docs.map((doc) {
      return Contact.fromDocument(doc.data(), doc.id);
    }).toList();
  }
}
