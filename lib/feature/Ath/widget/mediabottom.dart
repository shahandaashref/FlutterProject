import 'package:flutter/material.dart';

class Mediabottom extends StatelessWidget {
  final String image;
  const Mediabottom({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(image,width: 40,),
                        iconSize: 40,
                        
                      ),
                    );
  }
}