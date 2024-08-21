// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'usuario_single.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({super.key});

  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  Widget build(BuildContext context) {
    Future<Widget> usuarios() async {
      String sUrl = "https://api.npoint.io/5cb393746e518d1d8880";

      try {
        final oRespuesta = await http.get(
          Uri.parse(sUrl),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          //body: { "param1": "valor1" },
        );

        dynamic oJsonDatos = jsonDecode(utf8.decode(oRespuesta.bodyBytes));
        List items = oJsonDatos["elementos"];
        List<Widget> awItems = [];

        for (var i = 0; i < items.length; i++) {
          var item = items[i];
          var estudios = item["estudios"] as List;

          awItems.add(UsuarioSingle(
              carrera: item["profesion"].toString(),
              colegio: estudios[0]["bachillerato"].toString(),
              img: item["urlImagen"].toString(),
              nombre: item["nombreCompleto"].toString(),
              edad:item["edad"].toString(),
              universidad:estudios[0]["universidad"].toString(),
              ));
               
        }



//hihi
        return Future.delayed(const Duration(seconds: 2), () => ListView(children: awItems));
    }catch (e) {
        print("ERROR AL ENVIAR/RECIBIR SOLICITUD:");
        print(e);
      }
      return Container(child: const Text("No hay datos!!"),);
  }


  return Scaffold(
            body: FutureBuilder<Widget>(
              future: usuarios(),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                 if (snapshot.hasData) {
              return snapshot.data ?? Container();
            }
            return const Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                Text("Cargando Informacion")
              ],
            );
                
              },
            ),
          ); 
        
      } 
}