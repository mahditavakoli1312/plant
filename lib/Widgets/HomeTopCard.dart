import 'package:flutter/material.dart';


class HomeTopCard extends StatelessWidget {
  final text;
  final tex2;
  final priceTextButton;
  final mainHeight;
  final topCardImageUrl;
  HomeTopCard({this.text,this.priceTextButton,this.tex2,this.mainHeight,this.topCardImageUrl});
  @override
  Widget build(BuildContext context) {
     double wid = MediaQuery.of(context).size.width;
     double hie = mainHeight/5;

     return SizedBox(
       height: mainHeight*(139/599),
       child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: hie/5,left: wid/25,right: wid/25),
            child: Card(
              color: Color(0xFFCCDCCB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

              ),
              child: ListTile(
                title: Row(

                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                      )
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(top: hie/7,right: wid/80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF4B5E4A)),),
                            Text(tex2,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF94A793)),),
                            Padding(
                              padding: EdgeInsets.only(bottom: hie/10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: wid/6.5,
                                  height: hie/8,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF3C543D),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(child: Text(priceTextButton,style: TextStyle(color: Colors.white,fontSize: 12),)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: mainHeight/4.5,
                    child: Image.network(topCardImageUrl),
                  )
              ),
              Expanded(flex: 5,child: Container(),)
            ],
          )
        ],
    ),
     );
  }
}
