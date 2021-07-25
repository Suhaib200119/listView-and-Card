import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cars.dart';

void main() {
  runApp(MyApp());
}

class MyAppState extends State<MyApp> {
  bool bswitch = false;
  Color cardColor = Colors.white;
  Color cardTextColor = Colors.blueAccent;
  Color cardShadowColor = Colors.blueAccent;
  List<Cars> listCars = [
    Cars("Car_1", 80000, "car1.jpeg"),
    Cars("Car_2", 90000, "car2.jpeg"),
    Cars("Car_3", 85000, "car3.jpg"),
    Cars("Car_5", 78000, "car5.jpeg"),
    Cars("Car_5", 78000, "car2.jpeg"),
    Cars("Car_5", 78000, "car1.jpeg"),
    Cars("Car_3", 85000, "car3.jpg"),
    Cars("Car_5", 78000, "car5.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Card"),
          actions: [
            Switch(
                activeColor: Colors.grey,
                value: bswitch,
                onChanged: (vbool) {
                  setState(() {
                    bswitch = vbool;
                    if (bswitch == true) {
                      cardColor = Colors.black;
                      cardTextColor = Colors.white;
                      cardShadowColor = Colors.blueAccent;
                    } else {
                      cardColor = Colors.white;
                      cardTextColor = Colors.blueAccent;
                      cardShadowColor = Colors.blueAccent;
                    }
                  });
                }),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          color: Colors.white,
          child: ListView.builder(
              itemCount: listCars.length,
              itemBuilder: (con, index) {
                return Card(
                  color: cardColor,
                  shadowColor: cardShadowColor,
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "name: " + listCars[index].name.toString(),
                              style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "  price: " + listCars[index].price.toString(),
                              style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/" +
                              listCars[index].nameImage.toString(),
                          width: 150,
                          height: 160,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.shopping_cart_sharp),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
