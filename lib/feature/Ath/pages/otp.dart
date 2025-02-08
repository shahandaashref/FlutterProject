import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController pinController = TextEditingController();
  final Color primaryColor = const Color.fromARGB(255, 5, 107, 89);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Text top --- //
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: primaryColor),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Verification",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("images/vrifcation.jpg", height: 250),
            const SizedBox(height: 20),
            Text(
              "Enter the verification code sent to \n your email:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                height: 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: pinController,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the OTP";
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: primaryColor.withOpacity(0.2),
                      selectedFillColor: primaryColor.withOpacity(0.1),
                      inactiveFillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      print("Resending OTP...");
                    },
                    child: Text(
                      "Resend code",
                      style: TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Bottoms(
              text: "Verify",
              onPressed: () {
                if (pinController.text.length == 6) {
                  print("OTP entered: ${pinController.text}");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a valid OTP"),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class Bottoms extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Bottoms({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 5, 107, 89),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}