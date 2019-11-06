import 'package:flutter/material.dart';

class FoodBev extends StatefulWidget {
  @override
  _FoodBevState createState() => _FoodBevState();
}

class _FoodBevState extends State<FoodBev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue[700],
        ),
        title: Text(
          "الأغذية والمشروبات",
          style: TextStyle(color: Colors.blue[700]),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 13,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {},
                child: cardd(context),
              );
            }),
      ),
    );
  }
}

Widget cardd(context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.rnz.co.nz/assets/news_crops/60885/eight_col_32917696_l.jpg?1531180823",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "اشتري 1 خد 1",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25.0, left: 20, right: 35),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "6759.47km",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.add_location),
                          ),
                        ],
                      )),
                ),

                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 8,
                // ),
                Column(
                  children: <Widget>[
                    Text(
                      "بيتزا هوت",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الأغذية والمشروبات",
                      style: TextStyle(
                        color: Colors.black87,
                        // fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://i.pinimg.com/originals/96/0a/be/960abef4528685a8daffe3c4221594f2.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
        )),
  );
}
