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

  MQTTClientWrapper newclient = new MQTTClientWrapper();

  late MqttServerClient client;

  // bool _status = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: _modo ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Text(MyApp.title),
        // backgroundColor:_modo ? Colors.indigoAccent : Colors.white30,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     _status ? Icons.airplanemode_active : Icons.airplanemode_inactive,
          //     color: Theme.of(context).iconTheme.color,
          //   ),
          //   onPressed: () {
          //     newclient.conexao();
          //     if (client.connectionStatus!.state == MqttConnectionState.connected) {
          //       setState(() {
          //         _status = !_status;
          //       });
          //     }
          //     // if (client.connectionStatus!.state == MqttConnectionState.connected) {
          //     //   print('client connected');
          //     // } else {
          //     //   print('client disconnecting');
          //     // }
          //   },
          // ),
          // Icon(Icons.ac_unit),
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
                final isAuthenticated = await LocalAuthApi.authenticate();
                if (isAuthenticated) {
                  mqttRun();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Aberta!', textAlign: TextAlign.center),
                      content: Image.asset("assets/gif_door.gif"),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  void mqttRun() {
    MQTTClientWrapper newclient = new MQTTClientWrapper();
    newclient.prepareMqttClient();
  }
}