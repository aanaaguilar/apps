import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  int likes = 37;
  bool liked = false;
  bool mail = false;
  bool number = false;
  bool directions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('ITESO'),
      ),
      body: Column(
        children: [
          Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("San Pedro Tlaquepaque, Jal.", style: TextStyle(fontWeight: FontWeight.w300),),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        liked? likes--:likes++;
                        liked = !liked;
                        setState(() {});
                      },
                      icon: Icon(Icons.thumb_up, color: liked?Colors.indigo:Colors.grey[700]),
                    ),
                    Text('$likes'),
                  ],
                ),
              ],
            ),
          ),
          /*
          ListTile(
            title: Text("ITESO"),
            subtitle: Text("San Pedro Tlaquepaque, Jal."),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
          ),
          */
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        mail = !mail;
                        print("Correo.");
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Puedes contactarnos al correo dse@iteso.mx"),
                          ),
                        );
                        setState(() {});
                      }, 
                      icon: Icon(Icons.message, color: mail?Colors.indigo:Colors.black),
                    ),
                    Text("Correo"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        number = !number;
                        print("Llamada.");
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Puedes llamarnos al teléfono 33 3669 3434"),
                          ),
                        );
                        setState(() {});
                      }, 
                      icon: Icon(Icons.phone, color: number?Colors.indigo:Colors.black),
                    ),
                    Text("Llamada"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 48,
                      onPressed: () {
                        directions = !directions;
                        print("Ubicación.");
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Se encuentra ubicado en Periférico Sur 8585"),
                          ),
                        );
                        setState(() {});
                      }, 
                      icon: Icon(Icons.directions, color: directions?Colors.indigo:Colors.black),
                    ),
                    Text("Direcciones"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child:
              Text('''El ITESO Universidad Jesuita de Guadalajara, es una universidad
privada ubicada en la Zona de Guadalajara,
Jalisco, México, fundada en el año 1957. La institución forma parte
del Sistema Universitatio Jesuita que integra a ocho universidades
en México. Fundada en el año de 1857 por el ingeniero José Fernández
del Valle y Ancira, entre otros, la universidad ha tenido una larga
trayectoria. A continuación se presenta la historia de la institución
en periodo de décadas.'''),
          ),
        ],
      ),
    );
  } 
}
