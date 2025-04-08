import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF9ACBD0),
      content: Container(
        height: 120,
        child: Column(children: [
          // get user imput
          TextField(
            decoration: InputDecoration(
              labelText: 'Escribe algo...',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.teal,  // 👉 Color del borde cuando NO tiene foco
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,  // 👉 Color del borde cuando tiene foco
                  width: 2.5,
                ),
              ),
            ),
          )

          // buttons save & cancel
        ],),

      ),
    );
  }
}