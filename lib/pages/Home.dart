import 'dart:convert' ;
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:plant/BLoc/ShopingBloc.dart';
import 'package:plant/Models/Plants_Model.dart';
import 'package:plant/Services/GetProducts_service.dart';
import 'package:plant/Widgets/HomeTopCard.dart';
import 'package:plant/Widgets/PopularItemCar.dart';
import 'package:plant/Widgets/SearchBox.dart';
import 'package:plant/Widgets/SmallCardBottomHome.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  // List<Plants> _popular=[];
  // late Future<List<Plants>> _popular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     // GetProducts();
    // _popular = GetProducts();
     // print("lengh "+_popular.length.toString());
  }


  @override
  Widget build(BuildContext context) {
    // print("lengh of _popular :"+ _popular.toString());
    double wid = MediaQuery
        .of(context)
        .size
        .width;
    double hie = MediaQuery
        .of(context)
        .size
        .height;
    double minwh = min(wid, hie);
    return  WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF4F6F8),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: hie / 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: wid / 27,
                          height: wid / 27,
                          decoration: BoxDecoration(
                              color: Color(0xFF4EA015),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(
                            left: wid / 40, top: wid / 160),
                          child: Text("Plant Shop", style: TextStyle(color: Colors
                              .black, fontWeight: FontWeight.bold, fontSize: 16),)
                          ,),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.notifications_none)),
                        Positioned(
                          right: 14,
                          top: 13,
                          child: Container(
                              width: minwh / 35,
                              height: minwh / 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFF4EA015),
                                  shape: BoxShape.circle
                              ),
                              // Display the number of plants in the cart; not displayed in the correct position is for testing only.
                              child: Center(
                                child: BlocBuilder<ShopingBloc, ShopingState>(
                                    builder: (context, state) =>
                                    state is LoadingState
                                        ? CupertinoActivityIndicator()
                                        :
                                    state is SuccessState ? Text(
                                      state.plants.length.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 8),) :
                                    state is FailState ? Text(
                                      '0',  style: TextStyle(color: Colors.white,fontSize: 8),) :
                                    Text('', style: TextStyle(color: Colors.white,fontSize: 8),)
                                ),
                              )
                          ),
                        )
                      ],
                    )

                  ],
                ),),
              SearchBox(hie: hie, wid: wid),
              HomeTopCard(
                priceTextButton: "\$ 10",
                text: "Hose plants for Fresh air & places",
                tex2: "Starts from",
                mainHeight: hie,
                topCardImageUrl: "https://www.pngkey.com/png/full/410-4105552_philodendron-imperial-green-small-philodendron.png",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: wid / 14, vertical: hie * (12 / 599)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: wid / 27,
                          height: wid / 27,
                          decoration: BoxDecoration(
                              color: Color(0xFF4EA015),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(
                            left: wid / 40, top: wid / 150),
                          child: Text(
                            "Popular Item", style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),),),

                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "See All", style: TextStyle(color: Color(0xFF9EBA8E)),),
                    )

                  ],
                ),
              ),
              SizedBox(
                height: hie * (161 / 599),
                width: wid,
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: FutureBuilder<List<Plants>>(
                    future: Plants.getProducts(),
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.done &&
                          snap.hasData) {
                        // print("\n\n\n"+snap.data.toString()+"\n\n\n");
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snap.data!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // itemBuilder: (context,index)=>PopularItemCard(plant:snap.data![index],)
                            itemBuilder: (context, index) =>
                                PopularItemCard(plant: snap.data![index],
                                  index: index.toString(),)

                        );
                      }
                      else
                        return Center(child: CupertinoActivityIndicator(),);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: wid / 14, vertical: hie * (12 / 599)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: wid / 27,
                          height: wid / 27,
                          decoration: BoxDecoration(
                              color: Color(0xFF4EA015),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(
                            left: wid / 40, top: wid / 150),
                          child: Text(
                            "Similer Item", style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),),),

                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "See All", style: TextStyle(color: Color(0xFF9EBA8E)),),
                    )

                  ],
                ),
              ),
              SizedBox(
                height: hie * (85 / 599),
                width: wid,
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: FutureBuilder<List<Plants>>(
                    future: Plants.getProducts(),
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.done &&
                          snap.hasData) {
                        // print("\n\n\n"+snap.data.toString()+"\n\n\n");
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),

                            itemCount: snap.data!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // itemBuilder: (context,index)=>PopularItemCard(plant:snap.data![index],)
                            itemBuilder: (context, index) =>
                                SmallCardHome(plant: snap.data![index])

                        );
                      }
                      else
                        return Center(child: CupertinoActivityIndicator(),);
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => exit(0),
          //SystemNavigator.pop(),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

}

