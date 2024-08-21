import 'package:flutter/material.dart';
import 'package:lista_usuarios/perfil_usuario.dart';

class UsuarioSingle extends StatelessWidget {
  final String img;
  final String nombre;
  final String carrera;
  final String colegio;
  final String edad;
  final String universidad;
  
  const UsuarioSingle(
      {required this.carrera,
      required this.colegio,
      required this.img,
      required this.nombre,
      super.key, required this.edad, required this.universidad});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 150, 156, 167)))),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [

Image(
              image: NetworkImage(img),
              height: 60,
              width: 60,
            ),
             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ElevatedButton(child: const Text('Ver perfil'), onPressed: (){

              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilUsuario(img:img,
                      nombre:nombre,
                      carrera:carrera,
                      colegio:colegio,
                      edad:edad,
                      universidad:universidad,)));
          })],)
            ],)
            
            
            
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(nombre), Text(carrera), Text(universidad)],
          ),
         
          
        ])
        
        
        
        
        );
  }
}
