// import 'package:app_autenticador_fechadura/page/devs.dart';
import 'package:app_autenticador_fechadura/page/login.dart';
import 'package:app_autenticador_fechadura/provider/change_theme_button_widget.dart';
import 'package:app_autenticador_fechadura/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_tile_switch/list_tile_switch.dart';


class ConfigPage extends StatefulWidget {
  @override
  _ConfigPage createState() => _ConfigPage();
}


class _ConfigPage extends State<ConfigPage> {

  HomePage newHome = new HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração'),
        actions: <Widget>[
          // ChangeThemeButtonWidget(),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'ESQUEMA DE CORES',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 20),
              ChangeThemeButtonWidget(),
              // Divider(),
              // const Text(
              //   'OPÇÕES',
              //   style: const TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 22,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // ListTileSwitch(
              //   value: newHome.voice,
              //   leading: const Icon(
              //     Icons.keyboard_voice,
              //     color: Color(0xFF43237D),
              //   ),
              //   onChanged: (value) {
              //   },
              //   switchActiveColor: Color(0xFF43237D),
              //   switchInactiveColor: Colors.grey,
              //   switchScale: 0.9,
              //   switchType: SwitchType.cupertino,
              //   title: const Text('Authentication in Voice'),
              // ),
              Divider(),
              ListTile(
                title: Text('Sair'),
                trailing: Icon(Icons.exit_to_app, color: Theme.of(context).iconTheme.color),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false
                  );
                },
              ),
              // new Container(
              //   padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 5.0, bottom: 5.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: <Widget>[
              //       TextButton(
              //         child: Text(
              //           'Créditos',
              //           // style: TextStyle(color: Colors.white),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => Devs()),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
