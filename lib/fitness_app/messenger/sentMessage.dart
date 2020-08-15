import 'package:flutter/material.dart';

class SendedMessageWidget extends StatelessWidget {
  final String content;
  final String time;
  const SendedMessageWidget({
    Key key,
    this.content,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Color(0xFF59CDB6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    right: 12.0, left: 12.0, top: 8.0, bottom: 5.0),
                alignment: Alignment.centerLeft,
                child: Text(content),
              ),
              Container(
                padding:
                    const EdgeInsets.only(right: 12.0, left: 23.0, bottom: 5.0),
                alignment: Alignment.centerRight,
                child: Text(
                  time,
                  style: TextStyle(
                      fontSize: 10, color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
