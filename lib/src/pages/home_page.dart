import 'package:flutter/material.dart';
import 'package:preferencias_app/src/pages/settings_page.dart';
import 'package:preferencias_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Preferencias de usuario"),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: "),
          Divider(),
          Text("Genero: "),
          Divider(),
          Text("Nombre usuario: "),
          Divider(),
        ],
      ),
    ); 
  }
}
