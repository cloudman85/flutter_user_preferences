import 'package:flutter/material.dart';
import 'package:preferencias_app/src/share_prefs/preferecias_usuario.dart';
import 'package:preferencias_app/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName  = 'settings';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario ;
  int _genero;
  String _nombre;

  TextEditingController _textController;

  PreferenciasUsuario prefs = PreferenciasUsuario.getPreferenciasUsuario();

  @override
  void initState() { 
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.color;
    _nombre = prefs.nombre;
    prefs.ultimaPagina = SettingsPage.routeName;
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text("Settings", style: TextStyle( fontSize: 45.0, fontWeight: FontWeight.bold),),
            padding: EdgeInsets.all(5.0),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text("Color secundario"),
            onChanged: (valor){
              setState(() {
                _colorSecundario = valor;
                prefs.color = valor;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (valor){
                prefs.nombre = valor;
              },
              controller: _textController,
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {
      
    });
  }

}
