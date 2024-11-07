import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/contact_view_model.dart';
import '../models/contact.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contactViewModel.contacts.length,
        itemBuilder: (context, index) {
          final contact = contactViewModel.contacts[index];
          return ListTile(
            title: Text(contact.nome),
            subtitle: Text(contact.numero),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showContactForm(context, contactViewModel, contact: contact),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => contactViewModel.deleteContact(contact.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showContactForm(context, contactViewModel),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showContactForm(BuildContext context, ContactViewModel contactViewModel, {Contact? contact}) {
    final nomeController = TextEditingController(text: contact?.nome);
    final numeroController = TextEditingController(text: contact?.numero);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(contact == null ? 'Adicionar Contato' : 'Editar Contato'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: numeroController,
                decoration: const InputDecoration(labelText: 'Número'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final newContact = Contact(
                  id: contact?.id ?? '',
                  nome: nomeController.text,
                  numero: numeroController.text,
                );
                if (contact == null) {
                  contactViewModel.addContact(newContact);
                } else {
                  contactViewModel.updateContact(newContact);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
