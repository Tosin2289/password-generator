import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textcontroller = TextEditingController();
  String generatePassword() {
    final random = Random();

    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String password = String.fromCharCodes(
        characters.codeUnits.map((c) => random.nextInt(c + 1)));
    if (password.length > 12) {
      password = password.substring(0, 12);
    }
    return password;
  }

  void copy() async {
    await FlutterClipboard.copy(_textcontroller.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.pink,
      content: Text(
        "✓Password Copied",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PasswordGenerator"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Random Password Generator",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink[900],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _textcontroller,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: copy,
                    child: const Icon(Icons.copy),
                  ),
                  suffixIconColor: Colors.pink,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[900],
                ),
                onPressed: () {
                  String password = generatePassword();
                  _textcontroller.text = password;
                },
                child: const Text("Generate Password"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
