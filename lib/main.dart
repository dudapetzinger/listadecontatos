import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:listadecontatos/firebase_options.dart';
import 'package:provider/provider.dart';
import 'views/contact_list_screen.dart';
import 'viewmodels/contact_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()..loadContacts()),
      ],
      child: MaterialApp(
        title: 'Lista de Contatos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactListScreen(),
      ),
    );
  }
}
