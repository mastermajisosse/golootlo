import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 9),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Icon(
              Icons.g_translate,
              size: 42,
              color: Colors.blue,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                style: TextStyle(fontSize: 20, height: 1),
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  disabledBorder: InputBorder.none,
                  filled: true,
                  labelText: " بحت ..",
                  prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "http://www.textures4photoshop.com/tex/thumbs/restaurant-food-frame-with-rustic-wood-background-free-93.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Food & beverages",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    );
                    // );
                  },
                  itemCount: 6, // this is a hardcoded value
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CarouselSlider(
                height: 200.0,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (i) {
                  setState(() {
                    _current = i;
                    indexx = _current;
                  });
                },
                items: malist.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: GestureDetector(
                              child: Image.network(i, fit: BoxFit.fill),
                              onTap: () {
                                // Navigator.push<Widget>(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ImageScreen(i),
                                //   ),
                                // );
                              }));
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2.3),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4)),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                // color: Colors.black12,
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "اختياراتنا لك",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                              child: minicardd(context),
                    );
                  },
                  itemCount: 6, // this is a hardcoded value
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                // color: Colors.black12,
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "تخفيضات بالقرب منك",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 13,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {},
                      child: cardd(context),
                    );
                  }),
            ],
          ),
        ),
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
                      "https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg",
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
                                "خصم %30  ",
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
                      "برغر كينغ",
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
}
