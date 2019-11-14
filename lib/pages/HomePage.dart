import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:golotlo/pages/ProductPageWidget.dart';
import 'package:golotlo/pages/samepages/FoodBeverage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  List malist = [
    'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
    'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
    'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
    'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
  ];
  List maimg = [
    'http://www.textures4photoshop.com/tex/thumbs/restaurant-food-frame-with-rustic-wood-background-free-93.jpg',
    'https://www.lsretail.com/hubfs/Main%20banner%20top/leisure-and-entertainment-industry-main-head-3.jpg',
    'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190828-index-walmart-toys-1567004787.png?crop=1.00xw:1.00xh;0,0&resize=1200:*'
  ];
  List tt = ["الأكل و الشراب", 'الالكترونيات', 'المتعة والترفيه', 'الألعاب'];
  int indexx;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 9),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue[700],
              ),
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
                height: height / 7.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: width / 2.7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(maimg[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            tt[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    );
                    // );
                  },
                  itemCount: 4, // this is a hardcoded value
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              CarouselSlider(
                height: height / 3.7,
                enableInfiniteScroll: false,
                autoPlay: true,
                enlargeCenterPage: true,
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
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: height / 300),
                            child: GestureDetector(
                                child: Image.network(i, fit: BoxFit.fill),
                                onTap: () {})),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                width: double.infinity,
                height: height / 20,
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
              Container(
                width: double.infinity,
                height: height / 14,
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
              Container(
                height: height / 3.5,
                child: minicardd(context, height, width),
              ),
              Container(
                width: double.infinity,
                height: height / 17,
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
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 13,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {},
                        child: cardd(context, height, width),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Pick Image',
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height / 100,
            ),
            Icon(Icons.add_a_photo),
            Text(
              "Scan",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardd(context, h, w) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                height: h / 5,
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
                    promo2(context, 18, 2, 6.5, txt: "خصم %30"),
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

Widget minicardd(context, h, w) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Card(
        elevation: 2,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: h / 6,
              width: w / 1.4,
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
                  promo2(context, 18, 2, 8.3, txt: "خصم %30"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20),
                  child: Container(
                    width: w / 10,
                    height: h / 10,
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
          ],
        ),
      );
      // );
    },
    itemCount: 6, // this is a hardcoded value
  );
}
