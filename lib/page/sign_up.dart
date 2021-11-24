import 'package:app_autenticador_fechadura/services/sign_up_service.dart';
import 'package:flutter/material.dart';


class SingUpScreen extends StatefulWidget{
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreen createState() => _SingUpScreen();
}

class _SingUpScreen extends State<SingUpScreen>{

  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Color? highlightColor;
  final Color? foregroundColor;
  final AssetImage? logo;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  _SingUpScreen({
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
                padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 128.0,
                        width: 128.0,
                        child: new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: this.foregroundColor,
                          radius: 100.0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 35.0, bottom: 20.0),
                            child: new Column(
                              children: [
                                Icon(Icons.door_front, size: 40.0),
                                Text('Smart Door')
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
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Cadastro",
                          style: TextStyle(
                              color: this.foregroundColor,
                              fontSize: 32.0
                          ),
                        ),
                      )
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
                              Icons.assignment_ind_sharp,
                              color: this.foregroundColor,
                            ),
                          ),
                          new Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length < 10) {
                                  return "Digite um nome maior";
                                }
                                return null;
                              },
                              controller: _nameInputController,
                              autofocus: true,
                              style: TextStyle(color: this.foregroundColor),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nome Completo',
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
                      padding: const EdgeInsets.only(left: 00.0, right: 00.0),
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
                        onPressed: () {
                          _doSignUp();
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: this.foregroundColor),
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
  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService().signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
      Navigator.pop(context);
    } else {
      print("invalido");
    }
  }
}