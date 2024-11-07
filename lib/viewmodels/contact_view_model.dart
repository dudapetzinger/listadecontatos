import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact.dart';

class ContactViewModel extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Contact> contacts = [];

  Future<void> loadContacts() async {
    final snapshot = await _db.collection('contacts').get();
    contacts = snapshot.docs.map((doc) {
      return Contact.fromDocument(doc.data(), doc.id);
    }).toList();
    notifyListeners();
  }

  Future<void> addContact(Contact contact) async {
    await _db.collection('contacts').add(contact.toMap());
    await loadContacts();
  }

  Future<void> updateContact(Contact contact) async {
    await _db.collection('contacts').doc(contact.id).update(contact.toMap());
    await loadContacts();
  }

  Future<void> deleteContact(String id) async {
    await _db.collection('contacts').doc(id).delete();
    await loadContacts();
  }
}
