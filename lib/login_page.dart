import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String hasilEmail = '';
  String hasilPassword = '';

  fungsiLogin() {
    hasilEmail = emailCtrl.text;
    print(hasilEmail);

    hasilPassword = passwordCtrl.text;
    print(hasilPassword);

    setState(() {
      hasilEmail = emailCtrl.text;
      hasilPassword = passwordCtrl.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "masukkan email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: "masukkan password",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                fungsiLogin();
              },
              child: Text("login"),
            ),
            Text("inii hasil =$hasilEmail"),
          ],
        ),
      ),
    );
  }
}
