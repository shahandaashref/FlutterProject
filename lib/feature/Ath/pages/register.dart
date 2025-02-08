import 'package:appflutter/feature/Ath/widget/athBottom.dart';
import 'package:appflutter/feature/Ath/widget/logo.dart';
import 'package:appflutter/feature/Ath/widget/textfeild.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
      TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const Logo(),
          const SizedBox(height: 25,),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                "Register using the following command line options:",
              ),
              const SizedBox(height: 20,),
              const Inputtext(label: "UserName", hint: "Enter Username", type: TextInputType.text, iconData:Icon(null) ,),
              Inputtext(label: "Email", hint: "Enter your Email", type: TextInputType.emailAddress, iconData:const Icon(null) ,controller: emailAddress,),
              Inputtext(label: "Password", hint: "Enter password", type: TextInputType.visiblePassword, iconData:const Icon(Icons.remove_red_eye_sharp) ,obscure: true,controller: password,),
             // Inputtext(label: "Confirm password", hint: "Enter Confirm password", type: TextInputType.visiblePassword, iconData:Icon(Icons.remove_red_eye_sharp) ,obscure: true,),
              const SizedBox(height: 20,),
        
        
              Bottoms(text: "Register", onPressed: ()async{
        //         try {
        //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //     email: emailAddress.text,
        //     password: password.text,
        //   );
        //   Navigator.of(context).pushReplacementNamed("home");
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'weak-password') {
        //     print('The password provided is too weak.');
        //     AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.error,
        //       animType: AnimType.rightSlide,
        //       title: 'Error',
        //       desc: 'The password provided is too weak.',
        //       ).show();
        //   } else if (e.code == 'email-already-in-use') {
        //     print('The account already exists for that email.');
        //     AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.error,
        //       animType: AnimType.rightSlide,
        //       title: 'Error',
        //       desc: 'The account already exists for that email.',
        //       ).show();
        //   }
        // } catch (e) {
        //   print(e);
        // }
        //       }
  }),
        
        
              const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("if you have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/login");
                        },
                        child: const Text("Login",style: TextStyle(color: Color.fromARGB(255, 5, 107, 89),),),
                      ),
                    ],
                  ),
        ],
            ),
            ),
      ),
    );
  }
}