import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PasswordTile extends StatelessWidget {
  final String title;
  final String passwordContent;
  final DateTime whenSet;
  const PasswordTile({super.key, required this.title, required this.passwordContent, required this.whenSet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top:15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          tileColor: Colors.blue[200],
          title: RichText(
            text: TextSpan(
              text: "$title \n",
              children: [
                TextSpan(
                  text: passwordContent,
                  style: const TextStyle(
                    fontSize: 14,
                  )
                )
              ]
            )
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "Edited ${DateFormat('EEE MMM d, yyyy h:mm a').format(whenSet)}",
              style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
            )
          ),
        ),
      )
    );
  }
}