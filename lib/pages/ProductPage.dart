import 'package:flutter/material.dart';
import 'package:golotlo/pages/ProductPageWidget.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isActive = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // physics: PageScrollPhysics(),
          children: <Widget>[
            Container(
              // هنا تغيير حجم الصورة كلما نقص الرقم كانت الصورة اكبر
              height: height / 3.7,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.rnz.co.nz/assets/news_crops/60885/eight_col_32917696_l.jpg?1531180823",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  // ال 18 هي طول الشريط الأبيض و 2 هي عرضه
                  promo(context, 17, 2),
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 20,
                      ),
                      child: Row(
                        children: <Widget>[
                          LimitedBox(
                            maxWidth: 100,
                            child: Text(
                              "2.56",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "km",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.add_location,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // هنا تبديل الحجم بين و ما يوجد تحتها
                  SizedBox(
                    height: height / 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "بيتزا هوت",
                        style: TextStyle(
                            color: Colors.black,
                            // هنا تبديل حجم من 18 الى ما تريد
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ],
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
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          "https://i.pinimg.com/originals/96/0a/be/960abef4528685a8daffe3c4221594f2.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: height / 5.5,
                  color: Colors.grey[100],
                  child:
                      // cardd(context),
                      ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return cardd(context);
                    },
                    itemCount: 6, // this is a hardcoded value
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,

                          child: MaterialButton(
                            elevation: 0,
                            // هنا التقييم بدل 2 الى ما تريد

                            padding: EdgeInsets.all(2),
                            color: isActive ? Colors.white : Color(0xFF2196f3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'تقييم',
                              style: TextStyle(
                                  color: isActive ? Colors.black : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              setState(() {
                                isActive = false;
                              });
                            },
                          ),
                          // ),
                        ),
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            elevation: 0,
                            // هنا التفاصيل بدل 2 الى ما تريد
                            padding: EdgeInsets.all(2),
                            color: isActive ? Color(0xFF2196f3) : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'التفاصيل',
                              style: TextStyle(
                                  color: isActive ? Colors.white : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              setState(() {
                                isActive = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                  child: isActive
                      ? Column(
                          children: <Widget>[
                            infoo(Icons.add_location, "location", "location",
                                false),
                            infoo(Icons.phone, "Contact", "0944993322", false),
                            infoo(Icons.access_time, "Timing", "friday", true),
                          ],
                        )
                      : review(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 20),
        child: bottomButtom(),
      ),
    );
  }
}
