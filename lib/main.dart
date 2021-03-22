import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoes/src/models/zapato_model.dart';
import 'package:flutter_shoes/src/pages/zapato_desc.dart';
import 'package:flutter_shoes/src/pages/zapato_page.dart';
import 'package:provider/provider.dart';
 
void main() {
  
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ZapatoModel(),)
      ],
      child: MyApp(),
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // solo permitir el portrait vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ZapatoPage(),
      // home: ZapatoDescPage(),
    );
  }
}