import 'package:flutter/cupertino.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HeadContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 812.0, // Optional
      width: 375.0, // Optional
      allowFontScaling: true, // Optional
    );
    return new ContainerResponsive(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 1.00,
          color: Color(0xff59cdb6),
        ),
        borderRadius: BorderRadius.circular(15.00),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsResponsive.all(18.0),
                child: ContainerResponsive(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    border: Border.all(
                      width: 1.00,
                      color: Color(0xff707070),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://thegioidienanh.vn/stores/news_dataimages/hath/032020/03/09/4917_nu-dien-vien-viet-do-khanh-van-xinh-dep.jpg'),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle,
                  ),
                  width: 30,
                  height: 30,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsetsResponsive.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new TextResponsive(
                        "Nguyễn Văn Đào",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xff1da1a2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsResponsive.all(0.0),
            child: Wrap(
              children: <Widget>[
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                      right: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                    ),
                  ),
                  child: Center(
                    child: new TextResponsive(
                      "Độ tuổi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff7f878e),
                      ),
                    ),
                  ),
                ),
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                    ),
                  ),
                  child: Center(
                    child: new TextResponsive(
                      "Chiều cao",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff7f878e),
                      ),
                    ),
                  ),
                ),
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                      bottom: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                    ),
                  ),
                  child: Center(
                    child: new TextResponsive(
                      "Cân nặng",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff7f878e),
                      ),
                    ),
                  ),
                ),
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                    ),
                  ),
                  child: Center(
                    child: new TextResponsive(
                      "20",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff1da1a2),
                      ),
                    ),
                  ),
                ),
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  child: Center(
                    child: new TextResponsive(
                      "170cm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff1da1a2),
                      ),
                    ),
                  ),
                ),
                ContainerResponsive(
                  height: 41.5,
                  width: 108.30,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 1.0,
                        color: Color(0xffDEE5EA),
                      ),
                    ),
                  ),
                  child: Center(
                    child: new TextResponsive(
                      "70kg",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff1da1a2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
