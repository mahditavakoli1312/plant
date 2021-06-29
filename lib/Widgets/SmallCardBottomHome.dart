import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/Models/Plants_Model.dart';
import 'package:plant/pages/Product_screen.dart';

class SmallCardHome extends StatelessWidget {

  final Plants plant;
  SmallCardHome({
    required this.plant
  });

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
        padding: EdgeInsets.only(left: wid*(6/277)),
        child: Container(
          width: wid*(125/277),
          height: hie*(92/599),

          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: wid*(125/277),
                height: hie*(70/599),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: wid*(4/277)),
                      child: Container(
                        width: wid*(53/277),
                        height:hie*(66/599),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomRight:  Radius.circular(90),topLeft:  Radius.circular(17),bottomLeft:  Radius.circular(18)),
                          color: Color(0xFFACC0B7)
                        ),
                      ),
                    ),
                    SizedBox(
                      width: wid*(10/277),
                    ),
                     Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: wid*(51/277),
                            // child: FittedBox(
                            //   fit: BoxFit.contain,
                                child: Text(plant.name,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF384E39),fontSize: 11),)),
                          // ),
                          SizedBox(
                            height: hie*(1/599),
                          ),
                          Text("item:"+plant.item,style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF384E39),fontSize: 10),),
                          SizedBox(
                            height: hie*(5/599),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: wid*(29/277),
                              height: hie*(14/599),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                  color: Color(0xFF384E39)
                              ),
                              child: Center(child: Text(plant.price.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 8),)),
                            ),
                          )
                        ],
                      ),

                    ],
                ),
              ),


                      Container(
                        padding: EdgeInsets.only(bottom: hie*(20/599)),
                        width: wid*(60/277),
                        height:hie*(92/599),
                        child: Image.network(plant.image),
                      ),



            ],
          ),
        ),
      ),
    );
  }
}
