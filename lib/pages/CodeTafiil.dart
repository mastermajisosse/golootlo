import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue[700],
          ),
        ),
        title: Text(
          "كود التفعيل",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              child: Text(
                "لقد ارسلنا لك كود التفعيل على الرقم 09339388848 ، ادخله اسفله ليتم التفعيل بنجاح",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
                // color: Colors.,
                decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    setState(() {
                      // participantNames = text.toLowerCase();
                    });
                  },
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: MaterialButton(
                // elevation: 0,
                minWidth: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color(0xFF2196f3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'تأكيد التفعيل',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'لم تستلم كود التفعيل؟',
              style: TextStyle(
                  // color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'اعادة ارسال الكود في' + " 00:44",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text("اتصل بمركز المساعدة",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
