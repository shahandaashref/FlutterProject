import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verifyemail extends StatefulWidget {
  const Verifyemail({super.key});

  @override
  State<Verifyemail> createState() => _VerifyemailState();
}

class _VerifyemailState extends State<Verifyemail> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                FirebaseAuth.instance.currentUser!.emailVerified?
                Container(
                  child: const Text("Verification is successful",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                ):
                Column(
                  children: [
                  const Text('Please go to your email address \nto verify your account',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                  MaterialButton(
                  textColor: Colors.white,
                  color: const Color.fromARGB(255, 5, 107, 89),
                  onPressed:() {FirebaseAuth.instance.currentUser!.sendEmailVerification();},
                  child:const Text('Verification')
                  ),
                  ],
                )
              
              ],
            ),
            
            
          ),
        ),]
      ),
    );
  }
}