import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/BLoc/ShopingBloc.dart';
import 'package:plant/Models/Plants_Model.dart';
import 'package:plant/Widgets/SimilarItem.dart';
import 'package:plant/Widgets/SmallCardBottomHome.dart';

import 'Home.dart';

class ProductScreen extends StatefulWidget {
  final index;
  final bool isHero;
  final Plants plant;
  ProductScreen({ this.index,required this.plant,required this.isHero});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hie = MediaQuery.of(context).size.height;
    double minwh = min(wid, hie);

    return Scaffold(
      backgroundColor: Color(0xFF2D4636),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 274*hie/599,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: hie/200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context,
                              PageTransition(child: MainHome(), type: PageTransitionType.fade,inheritTheme: true,ctx: context)
                          );
                        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              width: wid/27,
                              height: wid/27,
                              decoration: BoxDecoration(
                                  color: Color(0xFF4EA015),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: wid/40,top: wid/160),
                              child: Text("Product Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                              ,),
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined,color: Colors.white,))

                      ],
                    ),
                    SizedBox(
                      height: hie/200,
                    ),
                    Container(
                      height: 199*hie/599,
                      width: wid,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 150*hie/599,
                              width: 150*hie/599,
                              child: widget.isHero? Hero(
                                  tag: "popular"+widget.index,
                                  child: Image.network(widget.plant.image)):
                              Image.network(widget.plant.image),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 20*minwh/599,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    BlocProvider.of<ShopingBloc>(context).add(AddTOCart(plant: widget.plant));
                                  },
                                  child: Container(
                                    width: 30*minwh/599,
                                    height: 30*minwh/599,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF89C976),
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Center(child: Icon(Icons.add,color: Colors.white,size: 14,)),
                                  ),
                                ),
                                SizedBox(
                                  width: 50*minwh/599,
                                  height: 30*minwh/599,
                                  child: Center(
                                    child: BlocBuilder<ShopingBloc,ShopingState>(
                                      builder: (context,state)=> state is LoadingState
                                          ? CupertinoActivityIndicator()
                                          :
                                      state is SuccessState ? Text(
                                        howManyIHave(widget.plant, state.plants).toString(),
                                        style: TextStyle(color: Colors.white,fontSize: 14),) :
                                      state is FailState ? Text(
                                        '0',  style: TextStyle(color: Colors.white,fontSize: 14),) :
                                      Text('', style: TextStyle(color: Colors.white,fontSize: 14),),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    BlocProvider.of<ShopingBloc>(context).add(DelFromCart(plant: widget.plant));

                                  },
                                  child: Container(
                                    width: 30*minwh/599,
                                    height: 30*minwh/599,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF89C976),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Center(child: Icon(Icons.remove,color: Colors.white,size: 14,)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  height: 325*hie/599,
                  width: 242*wid/277,
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
                  ),

                  child: Padding(
                    padding: EdgeInsets.only(left: 10*wid/277,top: 20*hie/599 ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          // height: 20*hie/599
                          // ),
                          SizedBox(
                            height: 52*hie/599,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10*wid/277),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Center(
                                   child:  Container(
                                     height: 55*hie/599,
                                     child:Stack(
                                       alignment: AlignmentDirectional.center,
                                       children: [
                                         Positioned(
                                           child: Container(
                                             height: 40*hie/599,
                                             width: 40*hie/599,
                                             decoration: BoxDecoration(
                                               color: Color(0xFF2D4636),
                                               borderRadius: BorderRadius.circular(10),
                                             ),
                                           ),
                                           bottom: 0.0,
                                         ),
                                         Center(
                                           child: Container(
                                             height: 55*hie/599,
                                             width: 55*hie/599,
                                             child: Center(child: Image.network(widget.plant.image)),),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.plant.name,style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                      ),
                                      ),
                                      Text(
                                        "item: "+widget.plant.item,style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                      ),
                                      ),
                                      Text(widget.plant.website,style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300
                                      ),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        widget.plant.price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Color(0xFF569F62),size: 16,),
                                          Text(widget.plant.rate.toString(),style: TextStyle(
                                            fontWeight: FontWeight.w400
                                          ),)
                                        ],
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30*hie/599,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10*wid/277),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  width: wid/27,
                                  height: wid/27,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF4EA015),
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: wid/40,top: wid/150),
                                  child: Text("Description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20*hie/599,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10*wid/277,right: 10*wid/277),
                          child: Text(
                            widget.plant.description,
                            style: TextStyle(color: Colors.black54),
                          ),),
                          Padding(
                            padding: EdgeInsets.only(left: 10*wid/277,top:  15*hie/599),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  width: wid/27,
                                  height: wid/27,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF4EA015),
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: wid/40,top: wid/150),
                                  child: Text("Similar Plants",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),

                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10*wid/277,top: 10*hie/599),
                             child: SizedBox(
                              height: 75*hie/599,
                              child: FutureBuilder<List<Plants>>(
                                future: Plants.getSimilarProducts(widget.plant),
                                builder: (context,snap){
                                  if(snap.connectionState == ConnectionState.done && snap.hasData ){
                                    // print("\n\n\n"+snap.data.toString()+"\n\n\n");
                                    return ListView.builder(
                                      physics:BouncingScrollPhysics() ,
                                        itemCount: snap.data!.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        // itemBuilder: (context,index)=>PopularItemCard(plant:snap.data![index],)
                                        itemBuilder: (context,index)=>SimilarItem(plant:snap.data![index],)

                                    );
                                  }
                                  else return Center(child: CupertinoActivityIndicator(),);
                                },
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                alignment: Alignment.bottomRight,
              )
            ],
          )
      ),
    );
  }
  int howManyIHave(Plants tarP,List<Plants> l){
    int count=0;
    for(Plants z in l){
      if(isEqualPlant(tarP, z))
      count++;
    }
    return count;
  }
  bool isEqualPlant(Plants p1,Plants p2){
    // must be better
    return (p1.name.compareTo(p2.name)==0)&&(p1.description.compareTo(p2.description)==0);
  }
}
