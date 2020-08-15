import 'package:best_flutter_ui_templates/fitness_app/messenger/conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'sender.dart';

class MessengerWidget extends StatefulWidget {
  MessengerWidget({Key key}) : super(key: key);

  @override
  _MessengerWidgetState createState() => _MessengerWidgetState();
}

class _MessengerWidgetState extends State<MessengerWidget> {
  SlidableController slidableController;
  final List<SenderInfo> items = [
    SenderInfo(
        'https://photo-1-baomoi.zadn.vn/w1000_r1/2019_06_10_180_31035889/a3bb9d021842f11ca853.jpg',
        'Alex',
        'how are you?',
        '9:00'),
    SenderInfo('https://www.woolha.com/media/2020/03/eevee.png', 'Mixi',
        'how are you?', '9:00'),
    SenderInfo(
        'https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.0-9/p960x960/104324867_133859501667956_2559023028355471447_o.jpg?_nc_cat=110&_nc_sid=85a577&_nc_ohc=RQSQuh3UiFgAX_sMoI7&_nc_ht=scontent.fsgn2-6.fna&_nc_tp=6&oh=87b150f05cd070309e1ac486756bc952&oe=5F5B60C8',
        'Hoàng Công Minh',
        'how are you?',
        '9:00'),
  ];

  @protected
  void initState() {
    slidableController = SlidableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return _getSlidableWithLists(context, index);
      },
      itemCount: items.length,
    ));
  }

  Widget _getSlidableWithLists(BuildContext context, int index) {
    final SenderInfo item = items[index];
    return Slidable(
      key: Key(item.title),
      controller: slidableController,
      direction: Axis.horizontal,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          _showSnackBar(context, 'Xoá');
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.25,
      child: VerticalListItem(items[index]),
      secondaryActions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15.0, top: 5.5, bottom: 5.5),
          child: SlideAction(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Text(
                'Xoá',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              onTap: () => _showSnackBar(context, 'Xoá')),
        )
      ],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class VerticalListItem extends StatelessWidget {
  VerticalListItem(this.item);
  final SenderInfo item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Slidable.of(context)?.renderingMode == SlidableRenderingMode.none
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConversionScreen(object: item)),
                )
              : Slidable.of(context)?.close(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: CircleAvatar(
              backgroundImage: NetworkImage(item.avatar),
              radius: 50,
              foregroundColor: Colors.red,
            ),
            foregroundColor: Colors.white,
          ),
          title: Text(
            item.title,
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff1DA1A2)),
          ),
          subtitle: Text(item.subtitle),
          trailing: Text(item.time),
        ),
      ),
    );
  }
}
