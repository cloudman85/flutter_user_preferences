import 'package:flutter/material.dart';
import 'package:preferencias_app/src/pages/settings_page.dart';
import 'package:preferencias_app/src/share_prefs/preferecias_usuario.dart';
import 'package:preferencias_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final PreferenciasUsuario prefs = PreferenciasUsuario.getPreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Preferencias de usuario"),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.color}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    ); 
  }
}
