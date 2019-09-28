import 'package:flutter/material.dart';
import 'package:preferencias_app/src/pages/home_page.dart';
import 'package:preferencias_app/src/pages/settings_page.dart';
import 'package:preferencias_app/src/share_prefs/preferecias_usuario.dart';

void main() async{
  PreferenciasUsuario prefs = PreferenciasUsuario.getPreferenciasUsuario();
  await prefs.initPrefs();
  print("ahora vamos a entrar a mi app: valores : ${prefs.color}  ${prefs.genero} ${prefs.nombre}");
  runApp( MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferenciasUsuario prefs = PreferenciasUsuario.getPreferenciasUsuario();
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
