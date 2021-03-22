

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/helpers/helpers.dart';
import 'package:flutter_shoes/src/models/zapato_model.dart';
import 'package:flutter_shoes/src/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class ZapatoDescPage extends StatelessWidget {

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 80.0,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60.0,),
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),

          // scroll bar, barra lateral
          Expanded(
            child: RawScrollbar(
              thumbColor: Color(0xffFFc675),
              thickness: 7.0,
              isAlwaysShown: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ZapatoDescripcion(
                      titulo: 'Nike Air Max 720',
                      descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),

                    _MontoBuyNow(),

                    _ColoresYMas(),

                    _BotonesLikeCartSttings()

                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

class _BotonesLikeCartSttings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(icono: Icon(Icons.star, color: Colors.red, size: 25,),),
          _BotonSombreado(icono: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,),),
          _BotonSombreado(icono: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,),),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icono;

  const _BotonSombreado({ this.icono});



  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icono,
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow( color: Colors.black12,spreadRadius: -5, blurRadius: 20.0, offset: Offset(0, 10))
        ]
      ),
    );
  }
}

class _ColoresYMas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Positioned(left: 90, child: _BotonColor(Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                  Positioned(left: 60, child: _BotonColor(Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                  Positioned(left: 30, child: _BotonColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                  _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
                ],
              ),
            ),
          ),

          // Spacer(),

          BotonNaranja(texto: 'More related items', alto: 30.0, ancho: 170.0, color: Color(0xffFFc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;
  const _BotonColor(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlImage;

        },
        child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Row(
          children: [
            Text('\$180.0', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold ),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy Now', ancho: 120.0, alto: 40.0,)
            )
          ],
        ),
      ),
    );
  }
}