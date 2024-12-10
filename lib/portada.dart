import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipail_2/aulavirtual.dart';
import 'package:ipail_2/page404.dart';
import 'package:url_launcher/url_launcher.dart';
import 'menu.dart';

class Portada extends StatelessWidget {

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir la URL: $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        title: Row(
          children: [
            Text('Portada',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.normal
              
            ),
            ),
            SizedBox(width: 150),



            ElevatedButton(onPressed: (){
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => const AulaVirtual()),
    );

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
          
            ), 
            child: Text("Aula virtual",
            style: TextStyle(
              fontSize: 20
            ),),
            ),
          ],
        ),
        
        actions: [
          IconButton(
            onPressed: () {
              _launchUrl('https://www.facebook.com/Institutopolitecnicoaltagraciaiglesias.delora');
            },
            icon: Icon(Icons.facebook),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              _launchUrl('https://www.instagram.com/p.altagraciaiglesiasdelora/');
            },
            icon: FaIcon(FontAwesomeIcons.instagram),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              _launchUrl('https://www.youtube.com/');
            },
            icon: FaIcon(FontAwesomeIcons.youtube),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
      
      drawer: Menu(),  // Usamos el menú en todas las páginas
      body: Stack(
        children: [
          // Contenido base (carrusel)
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CarouselSlider(
                items: [
                  _buildImage("https://images.pexels.com/photos/53621/calculator-calculation-insurance-finance-53621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  _buildImage("https://images.pexels.com/photos/5722156/pexels-photo-5722156.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  _buildImage("https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  _buildImage("https://images.pexels.com/photos/4058217/pexels-photo-4058217.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enlargeFactor: 0.3,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
          ),
          // Capa semitransparente azul encima de todo
          Positioned.fill(
            child: Container(
              color: Colors.blue.withOpacity(0.3), // Ajusta la opacidad a tu gusto
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Instituto Politécnico Altagracia Iglesias de Lora",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 5,
                      color: Colors.black,
                    )
                  ]
                  
                ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){
              _launchUrl('https://www.facebook.com/Institutopolitecnicoaltagraciaiglesias.delora/');


              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,                                
              ),
              child: Text("Novedades",
              style: TextStyle(
                fontSize: 20,
                
              ),
              ),
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}

    
  

