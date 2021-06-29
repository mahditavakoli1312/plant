import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/Models/Plants_Model.dart';
import 'package:plant/pages/Product_screen.dart';

class PopularItemCard extends StatelessWidget {
  final Plants plant;
  final String index;
  PopularItemCard({required this.plant,required this.index});


  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hie = MediaQuery.of(context).size.height;

    double widCard = wid*(113/277);
    double hieCard = hie*(163/599);
    return GestureDetector(
      onTap: (){

        Navigator.push(context,
            PageTransition(child: ProductScreen(index: index,plant: plant,isHero: true,), type: PageTransitionType.fade,inheritTheme: true,ctx: context)
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: wid*(11/277)),
        child: Container(
          height: hieCard,
          width: widCard,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),

          ),
          child: Stack(
            children: [
             Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: wid*(104/277),
                          height: hie*(112/599),
                          child: Hero(
                            tag: "popular"+index,
                              child: Image.network(plant.image))
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: hie*(5/599),left: wid*(7/277)),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: hie*(12.5/599),
                          child: Text(plant.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: hie*(1/599),left: wid*(7/277)),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: hie*(12.5/599),
                          child: Text("item: "+plant.item,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: wid*(5/277),right: wid*(7/277),bottom: hie*(5/599)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(plant.website,style: TextStyle(fontSize: 8,color: Colors.grey),),
                          Text("\$ "+ plant.price,style:TextStyle(fontSize: 12,color: Color(0xFF6E964E),fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}
