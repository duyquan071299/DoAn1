import 'package:flutter/material.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final String content;
  final String time;
  final String avatarPath;
  const ReceivedMessageWidget(
      {Key key, this.content, this.time, this.avatarPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding:
          const EdgeInsets.only(right: 5.0, left: 5.0, top: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 20,
            height: 20,
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarPath),
              radius: 50,
              foregroundColor: Colors.red,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.only(left: 5.0),
              child: Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                  child: Text(
                    content,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 10,
                  child: Text(
                    time,
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
