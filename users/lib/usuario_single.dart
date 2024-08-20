import 'package:flutter/material.dart';

class UsuarioSingle extends StatelessWidget {
  final String img;
  final String nombre;
  final String carrera;
  final String promedio;

  const UsuarioSingle(
      {required this.carrera,
      required this.promedio,
      required this.img,
      required this.nombre,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 150, 156, 167)))),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Image(
              image: AssetImage(img),
              height: 60,
              width: 60,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(nombre), Text(carrera), Text(promedio)],
          )
        ]));
  }
}
