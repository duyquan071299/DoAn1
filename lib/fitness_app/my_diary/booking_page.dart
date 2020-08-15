import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:grid_selector/base_grid_selector_item.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:grid_selector/grid_selector.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen();

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> _locations = [
    'Hà Nội',
    'TP.Hồ Chí Minh',
    'Đà Nẵng',
    'Huế',
    'Bà Rịa',
    'Bạc Liêu',
    'Bảo Lộc',
    'Bắc Giang',
    'Bắc Kạn',
    'Bắc Ninh',
  ]; // Option 2
  String _selectedLocation;
  List<String> _province = [
    'Hải Châu',
    'Liên Chiểu',
    'Sơn Trà',
    'Hòa Vang',
    'Ngũ Hành Sơn',
  ]; // Option 2
  String _selectedProvince;
  List<String> _homelane = [
    'Hòa Cường Bắc',
    'Thanh Bình',
    'Thuận Phước',
    'Thạch Thang',
    'Hải Châu 1'
  ]; // Option 2
  String _selectedHomelane;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff59CDB6),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: FintnessAppTheme.background,
        leading: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: new Text(
          "Đặt lịch khám",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: FintnessAppTheme.background,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Chọn chuyên khoa',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            color: FintnessAppTheme.lightText,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: GridSelector<int>(
                          backgroundSelectedColor: Color(0xff1DA1A2),
                          backgroundColor: FintnessAppTheme.background,
                          titleTextStyle: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            color: FintnessAppTheme.lightText,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                          items: _getTails(),
                          onSelectionChanged: (option) => print(option),
                          itemSize: 80,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Địa điểm',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            color: FintnessAppTheme.lightText,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: DropdownButtonFormField(
                                  hint: Text(
                                      'Tỉnh/thành phố'), // Not necessary for Option 1
                                  value: _selectedLocation,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                  items: _locations.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Color(0xffecebeb),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                      color: Color(0xffC0C8CF),
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xffC0C8CF),
                                      ),
                                    ),
                                    prefixIcon: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.location_city),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: DropdownButtonFormField(
                                  hint: Text(
                                      'Quận/Huyện'), // Not necessary for Option 1
                                  value: _selectedProvince,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedProvince = newValue;
                                    });
                                  },
                                  items: _province.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Color(0xffecebeb),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                      color: Color(0xffC0C8CF),
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xffC0C8CF),
                                      ),
                                    ),
                                    prefixIcon: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.business),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: DropdownButtonFormField(
                                  hint: Text(
                                      'Phường'), // Not necessary for Option 1
                                  value: _selectedHomelane,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedHomelane = newValue;
                                    });
                                  },
                                  items: _homelane.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Color(0xffecebeb),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                      color: Color(0xffC0C8CF),
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xffC0C8CF),
                                      ),
                                    ),
                                    prefixIcon: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.home),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  cursorWidth: 2.0,
                                  cursorColor: Color(0xff666666),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Color(0xffecebeb),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                      color: Color(0xffC0C8CF),
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xffC0C8CF),
                                      ),
                                    ),
                                    hintText: "Địa chỉ cụ thể",
                                    prefixIcon: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        alignment: Alignment.center,
                                        child: Icon(Icons.location_on)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Thời gian',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            color: FintnessAppTheme.lightText,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: dateField(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 35.0,
                                child: timeField(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1DA1A2),
                            borderRadius: BorderRadius.circular(23.00),
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: InkWell(
                            onTap: () => {_settingModalBottomSheet(context)},
                            child: new Text(
                              "Đặt lịch",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  List<BaseGridSelectorItem> _getTails() {
    return [
      BaseGridSelectorItem(key: 1, label: "Khoa nhi"),
      BaseGridSelectorItem(key: 2, label: "Khoa ngoại tổng quát"),
      BaseGridSelectorItem(key: 3, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 4, label: "Khoa mắt"),
      BaseGridSelectorItem(key: 5, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 6, label: "Khoa mắt"),
      BaseGridSelectorItem(key: 7, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 8, label: "Khoa mắt"),
    ];
  }

  final format = DateFormat("HH:mm");
  final dateformat = DateFormat("dd-MM-yyyy");

  Widget dateField() {
    return DateTimeField(
      decoration: InputDecoration(
        isDense: true,
        hintText: "Ngày tháng",
        fillColor: Color(0xffecebeb),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
          color: Color(0xffC0C8CF),
        )),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffC0C8CF),
          ),
        ),
        prefixIcon: Container(
          width: 20.0,
          height: 20.0,
          alignment: Alignment.center,
          child: Icon(Icons.calendar_today),
        ),
      ),
      format: dateformat,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }

  Widget timeField() {
    return DateTimeField(
      decoration: InputDecoration(
        isDense: true,
        hintText: "Giờ hẹn",
        fillColor: Color(0xffecebeb),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
          color: Color(0xffC0C8CF),
        )),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffC0C8CF),
          ),
        ),
        prefixIcon: Container(
          width: 20.0,
          height: 20.0,
          alignment: Alignment.center,
          child: Icon(Icons.alarm),
        ),
      ),
      format: format,
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Choose your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  'Design Course',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )
        ],
      ),
    );
  }
}
