import 'package:app_autenticador_fechadura/page/home_page.dart';
import 'package:app_autenticador_fechadura/page/sign_up.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget{
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{

  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Color? highlightColor;
  final Color? foregroundColor;
  final AssetImage? logo;
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
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.alternate_email_sharp,
                        color: this.foregroundColor,
                      ),
                    ),
                    new Expanded(
                      child: TextField(
                        style: TextStyle(color: this.foregroundColor),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: this.foregroundColor),
                        ),
                      ),
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
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.vpn_key_sharp,
                        color: this.foregroundColor,
                      ),
                    ),
                    new Expanded(
                      child: TextField(
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
                        onPressed: () => this.validateLogin(context),
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
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                alignment: Alignment.center,
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
              new Expanded(
                child: Divider(),
              ),
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

  void validateLogin(BuildContext context) {
    // if () {
    //
    // }
    debugPrint('context: $context');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}