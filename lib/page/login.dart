import 'dart:convert';

import 'package:app_autenticador_fechadura/mqtt/mqtt.dart';
import 'package:app_autenticador_fechadura/page/home_page.dart';
import 'package:app_autenticador_fechadura/page/sign_up.dart';
import 'package:app_autenticador_fechadura/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class LoginScreen extends StatefulWidget{
  _LoginScreen createState() => _LoginScreen();
}


class _LoginScreen extends State<LoginScreen>{

  MQTTClientWrapper newclient = new MQTTClientWrapper();

  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Color? highlightColor;
  final Color? foregroundColor;
  final AssetImage? logo;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  _LoginScreen({
    this.backgroundColor1 = const Color(0xFF444152),
    this.backgroundColor2 = const Color(0xFF6f6c7d),
    this.highlightColor = const Color(0xfff65aa3),
    this.foregroundColor = Colors.white,
    this.logo = const AssetImage("assets/full-bloom.png"),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
              end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
              colors: [this.backgroundColor1!, this.backgroundColor2!], // whitish to gray
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 80.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 160.0,
                        width: 160.0,
                        child: new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: this.foregroundColor,
                          radius: 100.0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: new Column(
                                children: [
                                  Icon(Icons.door_front, size: 80.0),
                                  Text(
                                    'Smart Door',
                                    style: TextStyle(
                                        color: this.foregroundColor,
                                        fontSize: 24.0
                                    )
                                  )
                                ]
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: this.foregroundColor!,
                            width: 1.0,
                          ),
                          shape: BoxShape.rectangle,
                          //image: DecorationImage(image: this.logo)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: this.foregroundColor!, width: 0.5, style: BorderStyle.solid),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0),
                            child: Icon(
                              Icons.alternate_email_sharp,
                              color: this.foregroundColor,
                            ),
                          ),
                          new Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length < 5) {
                                  return "Esse e-mail parece curto demais";
                                } else if (!value.contains("@")) {
                                  return "Esse e-mail está meio estranho, não?";
                                }
                                return null;
                              },
                              controller: _mailInputController,
                              autofocus: true,
                              style: TextStyle(color: this.foregroundColor),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: this.foregroundColor),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(right: 40.0),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: this.foregroundColor!, width: 0.5, style: BorderStyle.solid),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 0.0, right: 00.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0),
                            child: Icon(
                              Icons.vpn_key_sharp,
                              color: this.foregroundColor,
                            ),
                          ),
                          new Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "A senha deve ter pelo menos 6 caracteres";
                                }
                                return null;
                              },
                              controller: _passwordInputController,
                              style: TextStyle(color: this.foregroundColor),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '********',
                                hintStyle: TextStyle(color: this.foregroundColor),
                                suffixIcon: IconButton(
                                  icon: isPasswordVisible
                                      ? Icon(Icons.visibility_off_sharp, color: this.foregroundColor)
                                      : Icon(Icons.visibility_sharp, color: this.foregroundColor),
                                  onPressed: () =>
                                      setState(() => isPasswordVisible = !isPasswordVisible),
                                ),
                              ),
                              obscureText: isPasswordVisible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          primary: this.highlightColor,
                        ),
                        onPressed: () => _doLogin(),
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: this.foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 120.0),
                alignment: Alignment.bottomCenter,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          primary: Colors.transparent,
                        ),
                        onPressed: () => {},
                        child: Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(color: this.foregroundColor!.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          primary: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SingUpScreen()),
                          );
                        },
                        child: Text(
                          "Não tem uma conta? Crie uma!",
                          style: TextStyle(color: this.foregroundColor!.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState!.validate()) {
      var resp = await LoginService().login(
          _mailInputController.text,
          _passwordInputController.text
      );

      var jsonData = resp;
      var status = json.decode(jsonData);

      try {
        if (status['error']['message'] == 'INVALID_EMAIL') {
          print('Não registrado');
        } else if (status['error']['message'] == 'EMAIL_NOT_FOUND') {
          print('E-mail incorreto');
        } else if (status['error']['message'] == 'INVALID_PASSWORD') {
          print('Senha incorreta');
        }
      } catch (error) {
        print('Logado');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false
        );
      }
    } else {
      print("invalido");
    }
  }
}