import 'package:dummy/item_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Blue Jar",
            style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.w900)),
        elevation: 8,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.redAccent,
        leading: IconButton(onPressed: () { },
            icon: Icon(Icons.keyboard_backspace_sharp)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: [

            Row(
              children: [
                Container(
                  width: 95,
                  color: Colors.grey.withOpacity(0.25),
                  child: RotatedBox(quarterTurns: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(width: 135),

                          RotatedBox(quarterTurns: 1,
                          child: IconButton(onPressed: (){ },
                              icon: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.redAccent
                                ),
                                child: Icon(Icons.favorite, size: 21, color: Colors.white),
                              ))),

                          SizedBox(
                            height: 200,
                            width: 400,
                            child: TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black38,
                              indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                  border: Border(top: BorderSide(color: Colors.redAccent,width: 3))
                            ),

                            tabs: [
                              Tab(text: "Most Favorite"),
                              Tab(text: "Most Sell"),
                              Tab(text: "Today's Top"),
                            ]),
                          )
                        ],
                      )),
                ),

                Expanded(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TabBarView(
                      children: List.generate(3, (index) => Builder(
                          builder: (context) {
                            return RotatedBox(
                              quarterTurns: 3,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(height: 30),
                                  itemBuilder: (ctx, index) {
                                    return ListIem(
                                      id: index,
                                      image: image[index],
                                      isPriceVisible: index != 1,
                                      onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (ctx) {
                                          return ItemDetailScreen(
                                            titleName: "Blue Jar",
                                            id: index,
                                            image: image[index],
                                          );
                                        })
                                      );
                                      },
                                    ); },
                                  padding: MediaQuery.of(context).padding.add(EdgeInsets.symmetric(horizontal: 50)
                                      .copyWith(bottom: 84, top: 16)),
                                  itemCount: image.length),
                            );
                          }
                      ),)
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(55))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                          backgroundColor: Colors.white24,
                          elevation: 0,
                          foregroundColor: Colors.white,
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Icon(Icons.shopping_cart,size: 18)),
                      SizedBox(width: 16),
                      Text("Cart",
                        style: TextStyle(color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)
                      ),
                      SizedBox(width: 16),
                      Text("2 Items",
                        style: TextStyle(color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)
                      ),
                      Spacer(),
                      Text("\$ 20.99",
                        style: TextStyle(color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final image = [
  "assets/images/pot.png",
  "assets/images/flower1.png",
  "assets/images/pot.png"
];

class ListIem extends StatelessWidget {
  const ListIem({super.key,
    required this.image,
    required this.isPriceVisible,
    required this.onTap, required this.id});

  final String image;
  final int id;
  final bool isPriceVisible;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          IntrinsicHeight(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 45),
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.cyan, Colors.black
                    ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 9, // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Container(width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(child: Stack(
                          children: [
                            Hero(
                              tag: "image_$id",
                              child: Image.asset(image,
                                width: 120,
                                height: 120,),
                            ),
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 0,vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Similar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  )),
                              Text("Flower Pot",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 19,
                                      color: Colors.white
                                  )),

                              SizedBox(height: 16),

                              if(isPriceVisible)
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Price",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            )),
                                        Text("89\$",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 19,
                                                color: Colors.white
                                            )),
                                      ],
                                    ),

                                    Spacer(),

                                    IconButton(onPressed: () {},
                                        icon: Icon(Icons.shopping_cart,
                                          color: Colors.white,))
                                  ],
                                )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


