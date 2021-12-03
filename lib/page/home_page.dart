import 'dart:async';

import 'package:alan_voice/alan_voice.dart';
import 'package:app_autenticador_fechadura/api/local_auth_api.dart';
import 'package:app_autenticador_fechadura/main.dart';
import 'package:app_autenticador_fechadura/mqtt/mqtt.dart';
import 'package:app_autenticador_fechadura/page/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}


class _HomePage extends State<HomePage> {

  // bool _voice = true;

  MQTTClientWrapper newclient = new MQTTClientWrapper();

  _HomePage() {
    AlanVoice.addButton("c343f8e8838a276f5f7caa19f62a69e72e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.onCommand.add((command) => _handleCommand(command.data));

    // AlanVoice.onCommand.add((command) {
    //   debugPrint("got new command ${command.toString()}");
    // });
  }

  void _handleCommand(Map<String, dynamic> command) {
    switch(command['command']) {
      case 'mqttRun':
        mqttRun(newclient);
        break;
      default:
        debugPrint('Unknown command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigPage()),
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Door'),
              subtitle: Text('Porta da Frente'),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/door.png')),
              trailing: Icon(Icons.touch_app_outlined, color: Theme.of(context).iconTheme.color),
              onTap: () async {
                mqttRun(newclient);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Garage'),
              subtitle: Text('Porta da garagem'),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/garagem.png')),
              trailing: Icon(Icons.touch_app_outlined, color: Theme.of(context).iconTheme.color),
              onTap: () async {
                final isAuthenticated = await LocalAuthApi.authenticate();
                if (isAuthenticated) {
                  // mqttRun(newclient);
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  void mqttRun(newclient) async {
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      newclient.prepareMqttClient();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Aberta!', textAlign: TextAlign.center),
          content: Image.asset("assets/gif_door.gif"),
        ),
      );
    }
  }


  // void voice() {
  //   setState(() {
  //     _voice = !_voice;
  //   });
  // }
}