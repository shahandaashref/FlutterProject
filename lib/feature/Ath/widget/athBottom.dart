import 'package:flutter/material.dart';

class Bottoms extends StatelessWidget {
 final Function()? onPressed;
 final String text;
  const Bottoms({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 107, 89),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                  width: 340,
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  )
                  ),
                );
  }
}