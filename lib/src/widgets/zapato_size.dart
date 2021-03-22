
import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/models/zapato_model.dart';
import 'package:flutter_shoes/src/pages/zapato_desc.dart';
import 'package:flutter_shoes/src/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  ZapatoSizePreview({ 
    this.fullScreen = false
   });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage() ));
        }
      },
      child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (this.fullScreen) ? 5 : 30.0,
        vertical: (this.fullScreen) ? 5 : 0
      ),
      child: Container(
        width: double.infinity,
        height: (this.fullScreen) ? 410: 430,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: 
            (!this.fullScreen) 
              ? BorderRadius.circular(50.0)
              : BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))
        ),
        child: Column(
          children: [
            // zapato con su sombra
            _ZapatoConSombra(),

            // tallas
            if (!this.fullScreen)
              _ZapatoTallas()
          ],
        ),
      ),
    ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            _TallaZapatoCaja(7),
            SizedBox(width: 4.0,),
            _TallaZapatoCaja(7.5),
            SizedBox(width: 4.0,),
            _TallaZapatoCaja(8),
            SizedBox(width: 4.0,),
            _TallaZapatoCaja(8.5),
            SizedBox(width: 4.0,),
            _TallaZapatoCaja(9),
            SizedBox(width: 4.0,),
            _TallaZapatoCaja(9.5),
            SizedBox(width: 4.0,),
          ],
        ),
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
 
  final double numero;
  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {

    // provider
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (this.numero == zapatoModel.talla) ? Colors.white : Color(0xfff1a23a),
            fontSize: 15.0,
            fontWeight: FontWeight.bold
          ),
        ),
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          color: (this.numero == zapatoModel.talla) ? Color(0xfff1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            // TODO: sucio
            if(this.numero == zapatoModel.talla) 
              BoxShadow(
              color: Color(0xffF1a23A),
              blurRadius: 10,
              offset: Offset(0, 5)
            )
            
            
          ]
        ),
      ),
    );
  }
}


class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // provider
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Stack(
          children: [

            Positioned(
              bottom: 20.0,
              right: 0.0,
              child: _ZapatoSombra()
            ),



            Image(image: AssetImage(zapatoModel.assetImage))
          ],
        ),
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)
          ]
        ),
      ),
    );
  }
}