import 'dart:ui';
import 'package:best_flutter_ui_templates/hotel_booking/model/hotel_list_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../hotel_booking/hotel_app_theme.dart';
import 'messenger.dart';

class MessengerScreen extends StatefulWidget {
  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<HotelListData> hotelList = HotelListData.hotelList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                              .padding
                                              .top,
                                          left: 8,
                                          right: 8),
                                      child: Container(
                                        child: getSearchBarUI(),
                                      ),
                                    )
                                  ],
                                );
                              }, childCount: 1),
                            ),
                          ];
                        },
                        body: MessengerWidget(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 8, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            color: HotelAppTheme.buildLightTheme().backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(38.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 8, top: 4, bottom: 4),
            child: TextField(
              onChanged: (String txt) {},
              style: const TextStyle(
                fontSize: 18,
              ),
              cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                suffixIcon: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Icon(
                      FontAwesomeIcons.search,
                      size: 20,
                      color: HotelAppTheme.buildLightTheme().primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
