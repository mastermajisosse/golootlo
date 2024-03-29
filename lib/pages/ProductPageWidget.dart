import 'package:flutter/material.dart';

Widget promo(context, x, y) {
  return Positioned(
    top: MediaQuery.of(context).size.height / 4.4,
    right: 0,
    child: Container(
      height: MediaQuery.of(context).size.height / x,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: LimitedBox(
            maxWidth: MediaQuery.of(context).size.width / y,
            child: Text(
              "اشتري 1 خد 1",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
          )),
    ),
  );
}

Widget promo2(context, x, y, w, {String txt = "اشتري 1 خد 1"}) {
  return Positioned(
    top: MediaQuery.of(context).size.height / w,
    right: 0,
    child: Container(
      height: MediaQuery.of(context).size.height / x,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: LimitedBox(
            maxWidth: MediaQuery.of(context).size.width / y,
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
          )),
    ),
  );
}

Widget cardd(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
    child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              LimitedBox(
                maxWidth: 250,
                child: Text(
                  "عرض خاص بيتزا هات",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Container(
                width: 250,
                // height: 55,
                alignment: Alignment.bottomRight,
                child: LimitedBox(
                  maxHeight: 60,
                  child: Text(
                    "بيتزا و البطاطس مقلية و كوكاكولا ",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, height: 1.2),
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
        )),
  );
}

Widget bottomButtom() {
  return MaterialButton(
    // elevation: 0,
    minWidth: double.infinity,
    padding: EdgeInsets.all(14),
    color: Color(0xFF2196f3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.chrome_reader_mode,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          'الحصول على خصم',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 20,
        )
      ],
    ),
    onPressed: () {},
  );
}

Widget review() {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      color: Colors.black,
    ),
    shrinkWrap: true,
    primary: true,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            'ism la9ab ${index}',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.clip,
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      );
    },
    itemCount: 6, // this is a hardcoded value
  );
}

Widget infoo(iconn, txt, subtxt, boul) {
  return Padding(
      padding: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(
              iconn,
              color: Color(0xFF2196f3),
              size: 22,
            ),
            title: Text(
              txt,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.clip,
            ),
            subtitle: Text(
              subtxt,
              style: TextStyle(
                  fontSize: 14, color: Color(0xFF2196f3), height: 1.2),
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.clip,
            ),
            leading: Icon(
              Icons.chevron_left,
              size: 30,
              color: Color(0xFF2196f3),
            ),
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ));
}
