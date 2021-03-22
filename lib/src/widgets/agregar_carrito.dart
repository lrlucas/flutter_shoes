import 'package:flutter/material.dart';
import 'package:flutter_shoes/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  const AgregarCarritoBoton({ this.monto});


  @override
  Widget build(BuildContext context) {
    return SafeArea(  
      bottom: true,
      top: false,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(100.0)
          ),
          child: Row(
            children: [
              SizedBox(width: 30.0,),
              Text(
                '\$$monto',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              BotonNaranja(texto: 'Add to cart',),
              SizedBox(width: 20.0,)
            ],
          ),
        ),
      ),
    );
  }
}