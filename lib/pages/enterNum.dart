import 'package:flutter/material.dart';

class EnterNum extends StatefulWidget {
  @override
  _EnterNumState createState() => _EnterNumState();
}

class _EnterNumState extends State<EnterNum> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://scontent-amt2-1.cdninstagram.com/v/t51.2885-15/e35/67437433_2316595841794078_2186176041537568825_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com&se=7&oh=7ad9dcb9d973211d7bfa5ed4455ad2c9&oe=5E0D2E8F&ig_cache_key=MjExNzQyNjY3NzI4NTI1NzkyOA%3D%3D.2",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue[700],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  "تسجيل الدخول للحصول على الخصم",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, top: 10, bottom: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      initialValue: '',
                      decoration: InputDecoration(
                        hintText: 'ادخل رقم الهاتف',
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )
                    // TextField(
                    //   t
                    //                       textAlign: TextAlign.center,
                    //                       keyboardType: TextInputType.text,
                    //                       decoration: InputDecoration(
                    //                         labelText: '',
                    //                       ),
                    //                       onChanged: (text) {
                    //                         setState(() {
                    //                           // participantNames = text.toLowerCase();
                    //                         });
                    //                       },
                    //                     ),
                    // )
                    ),
              ),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: MaterialButton(
                        // elevation: 0,
                        minWidth: double.infinity,
                        padding: EdgeInsets.all(20),
                        color: Color(0xFF2196f3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'تأكيد ',
                          style: TextStyle(
                              color: Colors.white,
                              height: 0.7,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "انتقل إلى الصفحة التالية",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF2196f3),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ),
            ],
          )
        ],
      )),
    );
    //
  }
}
