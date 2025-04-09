import 'package:flutter/material.dart';
import 'package:to_do_app_hive_v1/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key, 
    required this.controller, 
    required this.onSave, 
    required this.onCancel
  });


  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: const Color(0xFF9ACBD0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // 🔥 Esquinas redondeadas
      ),
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // get user imput
          TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.teal,  // 👉 Color del borde cuando NO tiene foco
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blueAccent, 
                  width: 2.5,
                ),
              ),
              hintText: "Add a new task",
            ),
            
          ),
          
          const SizedBox(height: 10), // ← Añade espacio vertical
          // buttons save & cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // save button
              Expanded(child: MyButton(text: "Save", onPressed: onSave)),
              const SizedBox(width: 20,),
              // cancel button
              Expanded(child: MyButton(text: "Cancel", onPressed: onCancel)),
            ],)
        ],),

      ),
    );
  }
}