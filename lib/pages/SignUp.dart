import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  Widget _buildTextFied(
      BuildContext context, String labelText, bool isPassowrd, double x) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.blue),
        child: Container(
          width: x,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              obscureText: isPassowrd,
              focusNode: FocusNode(),
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: Theme.of(context).textTheme.body1,
              ),
            ),
          ),
        ),
      ),
    );
  }

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
          "التسجيل",
          style: TextStyle(
            color: Color(0xFF2196f3),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(width: double.infinity),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Text(
                'تسجيل',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildTextFied(context, 'اسم الشخصي', false, 150),
                  _buildTextFied(context, 'اسم العائلي', false, 150),
                ],
              ),
              _buildTextFied(context, 'البريد', false, 400),
              _buildTextFied(context, 'كلمة السر', true, 400),
              _buildTextFied(context, 'تأكيد كلمة السر ', true, 400),
              SizedBox(height: 30.0),
              Center(
                child: OutlineButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                      'سجل عضوية جديدة',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
