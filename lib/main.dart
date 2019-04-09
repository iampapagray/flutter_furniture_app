import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  TabController controller;

  int getColorHexFromStr(String colorStr){
    colorStr = "FF" + colorStr;
    colorStr =colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (var i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57){
        val += (hexDigit - 48) * (1 << (4 * (len -1 -i)));
      }else if (hexDigit >= 65 && hexDigit <= 70){
        val += (hexDigit - 55) * (1 << (4 * (len -1 -i)));
      }else if (hexDigit >= 97 && hexDigit <= 102){
        val += (hexDigit - 87) * (1 << (4 * (len -1 -i)));
      }else{
        throw new FormatException("An error occured converting a color");
      }
    }
    return val;
  }

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container( 
                height: 240.0,
                width: double.infinity,
                color: Color(getColorHexFromStr('#FDD148')),
              ),
              Positioned(
                bottom: 50.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Color(getColorHexFromStr('#FEE16D'))
                          .withOpacity(0.5)
                  ),
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 150.0,
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Color(getColorHexFromStr('#FEE16D'))
                          .withOpacity(0.5)
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 15.0),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/chris.jpg')
                          )
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width - 120.0),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Hello, Pino',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'What do your want to buy?',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 23.0,
                        fontWeight: FontWeight.w400
                      )
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, 
                            color: Color(getColorHexFromStr('#FEDF62')),
                            size: 30.0,
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quicksand'
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,)
                ],
              )
            ],
          ),
          SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              SizedBox(height: 10.0),
              Material(
                elevation: 1.0,
                child: Container(
                  height: 75.0,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 75.0,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/sofas.png')
                            )
                          ),
                        ),
                        Text(
                          'Sofa',
                          style: TextStyle(
                            fontFamily: 'Quicksand'
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75.0,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/wardrobe.png')
                            )
                          ),
                        ),
                        Text(
                          'Wardrobe',
                          style: TextStyle(
                            fontFamily: 'Quicksand'
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75.0,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/desks.png')
                            )
                          ),
                        ),
                        Text(
                          'Desk',
                          style: TextStyle(
                            fontFamily: 'Quicksand'
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75.0,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/dresser.png')
                            )
                          ),
                        ),
                        Text(
                          'Dresser',
                          style: TextStyle(
                            fontFamily: 'Quicksand'
                          )
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          itemCard('FinNavian', 'lorem ipsum jhuvvgcf fddk gen ghcghj hgjg hu gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk', 'assets/ottoman.jpg', false),
          itemCard('FinNavian', 'lorem ipsum jhuvvgcf fddk gen ghcghj hgjg hu gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk', 'assets/anotherchair.jpg', true),
          itemCard('FinNavian', 'lorem ipsum jhuvvgcf fddk gen ghcghj hgjg hu gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk gen ghcghj hgjg hu ftd  hghjgjkj atsf jhuvvgcf fddk', 'assets/chair.jpg', true),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.yellow,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.event_seat, color: Colors.yellow)),
            Tab(icon: Icon(Icons.timer, color: Colors.grey)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_outline, color:Colors.grey))
          ],
        ),
      ),
    );
  }

  Widget itemCard(String title, String desc, String imgPath, bool isFavorite){
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right:15.0, top: 15.0),
      child: Container(
        height:150.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0, right:15.0),
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover
                )
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Material(
                                elevation: isFavorite ? 0.0 : 2.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: isFavorite ? Colors.grey.withOpacity(0.2) : Colors.white
                                  ),
                                  child: Center(
                                    child: isFavorite ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red)
                                  ),
                                )
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              desc,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.grey,
                              )
                            ),
                          )
                        ],
                      ),
                      
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 40.0,
                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 5,
                          color: Color(getColorHexFromStr('#F9C335')),
                          child: Center(
                            child: Text(
                              '\$245.6',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            color: Color(getColorHexFromStr('#FEDD59')),
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            )
                          )
                        )
                      ],
                    )
                  )                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
