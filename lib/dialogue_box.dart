import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController intController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogueBox({super.key, required this.controller, required this.onSave, required this.onCancel, required this.intController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.grey,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Website of new password"
              ),
            ),
            const SizedBox(height: 9),
            TextField(
              controller: intController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New password length"
              ),
            ),
            const SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.green,
                  onPressed: onSave,
                  child: const Text("Save"),
                ),
                MaterialButton(
                  color: Colors.red,
                  onPressed: onCancel,
                  child: const Text("Cancel"),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}