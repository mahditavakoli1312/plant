import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/Models/Plants_Model.dart';
import 'package:plant/pages/Product_screen.dart';

class SimilarItem extends StatelessWidget {
  final Plants plant;
  SimilarItem({required this.plant});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hie = MediaQuery.of(context).size.height;


    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            PageTransition(child: ProductScreen(plant: plant,isHero: false,), type: PageTransitionType.fade,inheritTheme: true,ctx: context)
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4*wid/277,vertical: 5*hie/599),
        child : Container(
            width:  65*hie/599 ,
            height:  65*hie/599,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFECEEEE)
            ),

                child: Center(
                  child: Image.network(plant.image),
                ),

          ),

      ),
    );
  }
}
