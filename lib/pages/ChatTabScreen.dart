import 'package:flutter/material.dart';
import 'package:golotlo/pages/chat.dart';
import 'package:golotlo/pages/models/ConversationModel.dart';

class ChatTabScreen extends StatelessWidget {
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
          "المحادتات",
          style: TextStyle(
            color: Color(0xFF2196f3),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              child: Icon(
                Icons.message,
                color: Color(0xFF2196f3),
                size: 26,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, index) =>
              conversation(context, conversations[index])),
    );
  }
}

Widget conversation(BuildContext context, ConversationModel conversation) {
  return InkWell(
    onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            ChatScreen(conversation: conversation))),
    child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ClipOval(
              child: Image.network(conversation.image),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      conversation.fullName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    Text(
                      conversation.message,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      conversation.date,
                      style: TextStyle(
                          color: conversation.messageCout > 0
                              ? Color(0xFF2196f3)
                              : Colors.grey),
                    ),
                    conversation.messageCout > 0
                        ? Chip(
                            backgroundColor: Color(0xFF2196f3),
                            label: Text(
                              '${conversation.messageCout}',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Text(''),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 330,
            height: 1,
            margin: EdgeInsets.only(left: 56, top: 21),
            color: Colors.grey.withOpacity(.2),
          )
        ],
      ),
    ),
  );
}
