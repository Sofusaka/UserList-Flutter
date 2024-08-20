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
      String sUrl = "https://api.npoint.io/bffbb3b6b3ad5e711dd2";

      try {
        final oRespuesta = await http.get(
          Uri.parse(sUrl),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          //body: { "param1": "valor1" },
        );

        dynamic oJsonDatos = jsonDecode(utf8.decode(oRespuesta.bodyBytes));
        List items = oJsonDatos["items"];
        List<Widget> awItems = [];

        for (var i = 0; i < items.length; i++) {
          var item = items[i];
          awItems.add(UsuarioSingle(
              carrera: item["carrera"].toString(),
              promedio: item["promedio"].toString(),
              img: item["imagen"].toString(),
              nombre: item["nombre"].toString()));
        }

        return Future.delayed(const Duration(seconds: 2), () => ListView(children: awItems));
    }catch (e) {
        print("ERROR AL ENVIAR/RECIBIR SOLICITUD:");
        print(e);
      }
      return Container(child: const Text("No hay datos!!"),);
  }


  return MaterialApp(
          home: Scaffold(
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
          ),
        );
      } 
}