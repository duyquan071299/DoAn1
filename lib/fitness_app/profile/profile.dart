import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile();

  @override
  State<StatefulWidget> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  String userId = 'userId';
  String userMail = 'userMail';

  String _phoneNumber;
  String _name = 'Đào Hữu Duy Quân';
  String _surname;
  bool _notificate = true;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pageConstruct(context);
  }

  Widget userInfoTopSection() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        minRadius: 70.0,
        backgroundImage: NetworkImage(
          'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.0-9/110008428_1491145941093587_1606106372826410073_n.jpg?_nc_cat=111&_nc_sid=7aed08&_nc_ohc=H5BduTiSB3sAX_ejdll&_nc_ht=scontent.fsgn5-3.fna&oh=bb21ffaed6ed6a290b64bbf6a8957186&oe=5F5C6D72',
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Color(0xFFC0C8CF),
      height: 15,
      indent: 70,
    );
  }

  Widget userBottomSection() {
    Widget name() {
      return ListTile(
        leading: Icon(
          Icons.person,
          color: Color(0xFF1DA1A2),
          size: 35,
        ),
        title: Text(
          "Họ tên",
          style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Color(0xFFC0C8CF)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Họ tên'),
                              onSaved: (value) => {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RaisedButton(
                              color: Color(0xFF1DA1A2),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Text(
                                "Hoàn thành",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        subtitle: Text(
          'Đào Hữu Duy Quân',
          style: TextStyle(
            fontSize: 15.0,
            color: Color(0xFF2A3743),
          ),
        ),
      );
    }

    Widget gender() {
      return ListTile(
        leading: Icon(
          Icons.supervisor_account,
          color: Color(0xFF1DA1A2),
          size: 35,
        ),
        title: Text(
          "Giới tính",
          style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Color(0xFFC0C8CF)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: 'Giới tính'),
                              onSaved: (value) => _surname = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color(0xFF1DA1A2),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Text(
                                "Hoàn thành",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        subtitle: Text(
          'Nam',
          style: TextStyle(fontSize: 15.0, color: Color(0xFF2A3743)),
        ),
      );
    }

    Widget address() {
      return ListTile(
        leading: Icon(
          Icons.location_on,
          color: Color(0xFF1DA1A2),
          size: 35,
        ),
        title: Text(
          "Địa chỉ",
          style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Color(0xFFC0C8CF)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Địa chỉ'),
                              onSaved: (value) => _surname = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color(0xFF1DA1A2),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Text(
                                "Hoàn thành",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        subtitle: Text(
          '401, Nguyễn Xí, Bình Thạnh',
          style: TextStyle(fontSize: 15.0, color: Color(0xFF2A3743)),
        ),
      );
    }

    Widget phone() {
      return ListTile(
        leading: Icon(
          Icons.phone,
          color: Color(0xFF1DA1A2),
          size: 35,
        ),
        title: Text(
          "Số điện thoại",
          style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Color(0xFFC0C8CF)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: 'Số điện thoại'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) => _phoneNumber = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color(0xFF1DA1A2),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Text(
                                "Đồng ý",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        subtitle: Text(
          '0987459893',
          style: TextStyle(fontSize: 15.0, color: Color(0xFF2A3743)),
        ),
      );
    }

    Widget privacy() {
      return ListTile(
          leading: Icon(
            Icons.date_range,
            color: Color(0xFF1DA1A2),
            size: 35,
          ),
          trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFC0C8CF)),
              onPressed: () {}),
          title: Text(
            "Điều khoản sử dụng",
            style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
          ));
    }

    Widget help() {
      return ListTile(
          leading: Icon(
            Icons.help,
            color: Color(0xFF1DA1A2),
            size: 35,
          ),
          trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFC0C8CF)),
              onPressed: () {}),
          title: Text(
            "Thông tin hỗ trợ",
            style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
          ));
    }

    Widget notification() {
      return ListTile(
        leading: Icon(
          Icons.notifications,
          color: Color(0xFF1DA1A2),
          size: 35,
        ),
        title: Text(
          "Notification",
          style: TextStyle(color: Color(0xFF2A3743), fontSize: 18.0),
        ),
        trailing: Switch(
          value: this._notificate,
          onChanged: (value) {
            this.setState(() {
              this._notificate = !this._notificate;
            });
          },
          activeColor: Colors.lightBlueAccent,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: FractionalOffset.center,
                    width: 390,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 16),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    name(),
                                    divider(),
                                    gender(),
                                    divider(),
                                    address(),
                                    divider(),
                                    phone(),
                                    divider(),
                                    notification(),
                                    divider(),
                                    privacy(),
                                    divider(),
                                    help(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageConstruct(context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F5F6),
      resizeToAvoidBottomPadding: false,
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //     floating: true,
          //     backgroundColor: Color(0xFFF2F5F6)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://i.pinimg.com/736x/6d/f8/fa/6df8faf4abf2d4459d45b9962d36b38c.jpg'))),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: userInfoTopSection(),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: userBottomSection(),
                ),
                Container(
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
