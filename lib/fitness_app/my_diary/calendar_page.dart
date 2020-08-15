import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Components/chart.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen();

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: FintnessAppTheme.background,
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Color(0xff1da1a2),
              tabs: [
                Tab(
                  icon: new Text(
                    "Lịch cá nhân",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff1da1a2),
                    ),
                  ),
                ),
                Tab(
                  icon: new Text(
                    "Sức khỏe cá nhân",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff1da1a2),
                    ),
                  ),
                ),
              ],
            ),
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
              "Cá nhân hóa",
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
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[
                  TableCalendar(
                    calendarController: _calendarController,
                    calendarStyle: CalendarStyle(
                      todayColor: Color(0xff1DA1A2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xff1DA1A2),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height: 35.0,
                                      child: Text("Bạn có lịch hẹn"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: new Text(
                                      "Vui lòng đến đúng giờ ghi trên phiếu khám bệnh.",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Color(0xff2a3743),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      "9:00 - 08/01/2020",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        color: Color(0xff1da1a2),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.local_hospital,
                              color: Color(0xff1DA1A2),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height: 35.0,
                                      child: Text("Bạn cần phải uống thuốc"),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      "9:00 - 08/01/2020",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        color: Color(0xff1da1a2),
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: ListView(
                  children: <Widget>[
                    SimpleLineChart(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
