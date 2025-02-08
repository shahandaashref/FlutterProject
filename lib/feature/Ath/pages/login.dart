import 'package:appflutter/feature/Ath/widget/athBottom.dart';
import 'package:appflutter/feature/Ath/widget/logo.dart';
import 'package:appflutter/feature/Ath/widget/mediabottom.dart';
import 'package:appflutter/feature/Ath/widget/textfeild.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Form(
              key: formkey,
              child: Container(
                child: Column(
                    children: [
                    const Logo(),
                        
                    const SizedBox(height: 25,),
                    const Text("Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 15,),
                    const Text("Login using the following command line options:",
                    ),
                    const SizedBox(height: 20,),
                    Inputtext(label: "Email", hint: "Enter your email address", type: TextInputType.emailAddress,iconData:const Icon(null) ,controller: emailAddress,),
                    Inputtext(label: "PassWord", hint: "Enter password", type:TextInputType.visiblePassword,iconData: const Icon(Icons.remove_red_eye_sharp),obscure: true,controller: password,),
                    InkWell(
                      onTap: (){},
                      child: const Text("Forgot Password",
                                textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                      ),
                    ),
                    const SizedBox(height: 20,),
                
                    //====Sign in Button====//
                  Bottoms(text: "Login", onPressed: () async {
                    if(formkey.currentState!.validate()){
                    try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailAddress.text,
                  password: password.text,
                );
                Navigator.of(context).pushReplacementNamed("home");
                        
                        } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'No user found for that email.',
                    ).show();
                
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Wrong password provided for that user.',
                    ).show();
                }
                        }
                      }else{
                    AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Please Enter your email and try again.',
                    ).show();
                      }
                
                  }),
                        
                        const SizedBox(height: 15),
                        const Text(
                          "Or sign in using",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 8, 46, 52)),
                        ),
                        const SizedBox(height: 20),
                        
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Mediabottom (image: "images/facebook.png",),
                        SizedBox(width: 20),
                        Mediabottom (image: "images/gmail.png",),
                        SizedBox(width: 20),
                        Mediabottom (image: "images/twitter.png",),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed("register");
                              },
                              child: const Text("Sign Up now",style: TextStyle(color: Color.fromARGB(255, 5, 107, 89),),),
                            ),
                          ],
                        ),
                        
                  ],
                        
                ),
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}