import 'package:flutter/material.dart';
import 'package:rand_password/dialogue_box.dart';
import 'package:rand_password/models/passwords.dart';
import 'package:rand_password/password_tile.dart';
import 'dart:math';

void main(){
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _controller = TextEditingController();
  final intController = TextEditingController();

String generatePassword(){
  String upper = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  String lower = 'qwertyuiopasdfghklzxcvbnm';
  String numbers = '1234567890';
  String symbols = '!@#\$%^&*()<>,./';

  String password = '';

  int passLength = int.parse(intController.text);

  String seed = upper + lower + numbers + symbols;

  List<String> list = seed.split('').toList();

  Random rand = Random();

  for (int i = 0; i < passLength; i++) {
    int index = rand.nextInt(list.length);
    password += list[index];
  }

  return password;
}

  void _saveNewPassword(){
    setState(() {
      samplePasswords.add(
        PasswordTileContent(
          id: samplePasswords.length,
          website: _controller.text,
          passwordContent: generatePassword(),
          whenSet: DateTime.now(),
        ),
      );
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void _addNewPassword(){
    showDialog(
      context: context,
      builder: (context){
        return DialogueBox(
          intController: intController,
          controller: _controller,
          onSave: _saveNewPassword,
          onCancel:() => Navigator.of(context).pop()
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Password Generator"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: samplePasswords.length,
        itemBuilder: ((context, index) {
          return PasswordTile(
            title: samplePasswords[index].website,
            passwordContent: samplePasswords[index].passwordContent,
            whenSet: samplePasswords[index].whenSet
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewPassword,
        child: const Icon(Icons.add),
      ),
    );
  }
}