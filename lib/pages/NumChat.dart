import 'package:flutter/material.dart';

class NumChat extends StatefulWidget {
  @override
  _NumChatState createState() => _NumChatState();
}

class _NumChatState extends State<NumChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "..بحت",
                        hintText: "..بحت",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 20,
                  // itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                "A",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        title: Text('ism la9ab ${index}'),
                        subtitle: Text('num 002233${index}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
