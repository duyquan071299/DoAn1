import 'package:flutter/material.dart';
import 'receivedMessage.dart';
import 'sentMessage.dart';
import 'sender.dart';

class ConversionScreen extends StatefulWidget {
  final SenderInfo object;

  const ConversionScreen({
    Key key,
    this.object,
  }) : super(key: key);

  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  @override
  void initState() {
    super.initState();
    childList.add(Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
              child: Text(
            "9:00 12th2, 2020",
            style: TextStyle(fontSize: 16.0, color: Color(0xFF1DA1A2)),
          )),
        )));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Hello',
        time: '21:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'How are you? What are you doing?',
        time: '21:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Hello, Mohammad.I am fine. How are you?',
        time: '22:40 PM',
        avatarPath: widget.object.avatar,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content:
            'I am good. Can you do something for me? I need your help my bro.',
        time: '22:40 PM',
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF2F5F6),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 65,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF1DA1A2), Color(0xFF59CDB6)],
                            begin: const FractionalOffset(0.0, 1.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.object.avatar),
                                radius: 50,
                                foregroundColor: Colors.red,
                              ),
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(0.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        spreadRadius: -1,
                                        offset: Offset(0.0, 5.0))
                                  ]),
                            ),
                          ),
                          Text(
                            widget.object.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  Container(
                    color: Colors.white,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                          hintText: "Viết tin nhắn...",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
