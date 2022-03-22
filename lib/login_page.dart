import 'package:flutter/material.dart';
import 'contact.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          children: [
            _image(),
            _username(),
            _password(),
            _loginButton(context),
            _forgot(),
          ],
        ),
      ),
    );
  }


  Widget _image() {
    return Container(
        child: Column(children: [
        Image.asset('images/1.png'),
    ],
    ),
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          username = value;
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 200,
          vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (username == "riskyaulia" && password == "rirismanis"){
            text = "Login Success";
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context){
                  return Contact();
                }));
          } else {
            text = "Login Failed";
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _forgot() {
    return Container(
      child: Column(children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text("Forgot Password?"),
        ),
      ],
      ),
    );
  }
}
