import 'package:flutter/material.dart';
import 'package:preferencias_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
    
  final String _genero = "genero";
  final String _nombre = "nombre";
  final String _color = "color";
  final String _ultimaPagina ="ultimaPagina";

  SharedPreferences _prefs;
  static PreferenciasUsuario _preferenciasClase;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  PreferenciasUsuario._(){
    initPrefs();
  }

  static PreferenciasUsuario getPreferenciasUsuario(){
    print("EStamos en constructor");
    if(_preferenciasClase == null){
      print("creamos instancia");
      _preferenciasClase = new PreferenciasUsuario._();
    }
    print("Devolvemos instancia");
    return _preferenciasClase;
  }

  /*
  PreferenciasUsuario._internal(
   
  );*/

  get genero{
    return _prefs.getInt("genero")!=null ? _prefs.getInt("genero") : 1;
  }

  set genero(int valor){
    _prefs.setInt(_genero, valor);
  }

  get color{
    return _prefs.getBool(_color)!= null ? _prefs.getBool(_color) : false;
  }

  set color(bool valor){
    _prefs.setBool(_color, valor);
  }

  get nombre{
    return _prefs.getString(_nombre)!= null ? _prefs.getString(_nombre) : "Pedro";
  }

  set nombre(String valor){
    _prefs.setString(_nombre, valor);
  }

  
  get ultimaPagina{
    return _prefs.getString(_ultimaPagina)!= null ? _prefs.getString(_ultimaPagina) : HomePage.routeName;
  }

  set ultimaPagina(String valor){
    _prefs.setString(_ultimaPagina, valor);
  }
}