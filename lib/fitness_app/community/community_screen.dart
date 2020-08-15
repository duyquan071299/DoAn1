import 'package:flutter/material.dart';
import 'package:grid_selector/base_grid_selector_item.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:grid_selector/grid_selector.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../hotel_booking/hotel_app_theme.dart';
import 'comment.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen();

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

const List<Comment> listComments = [
  Comment(
      'Tôi dạo này hay bị mất ngủ về đêm, sáng thì buồn ngủ và cảm giá nôn nao, dễ bị giật mình và mất tập chung trong giờ làm. Nhờ bác sĩ tư vấn xem bệnh gì ạ ?',
      'Nữ 23 tuổi',
      '13 phút trước',
      'https://meditecclinic.com.vn/wp-content/uploads/2017/07/b%C3%A1c-s%C4%A9-nguy%E1%BB%85n-tr%E1%BB%8Dng-h%C6%B0ng.jpg',
      'Đại Trần',
      '1 phút trước',
      'Bạn nên đến các phòng khám có chuyên môn để được chuẩn đoán tốt hơn.',
      4.5),
  Comment(
      'Em là phụ nữ 19 tuổi, dạo gần đây hay bị nổi mụn ở trán. Lúc nào cũng cảm thấy trong người nóng rạo rực, khó ăn đồ ngọt hơn trước rất nhiều. Nhờ bác sĩ tư vấn giúp.',
      'Nữ 19 tuổi',
      '15 phút trước',
      'https://cafefcdn.com/2020/1/24/goi-vong-o-ba-vang-bac-si-can-loi-voi-chuyen-nghiep-chua-dau-lun-22575a-1579853439911160174527.jpg',
      'Võ Xuân Thịnh',
      '1 giờ trước',
      'Bạn nên đến các phòng khám có chuyên môn để được chuẩn đoán tốt hơn.',
      5),
  Comment(
      'Đầu má em bị đau đầu, xảy ra thường xuyên và kéo dài liên tục, bác sĩ cho em hỏi phải làm sao ?',
      'Nữ 19 tuổi',
      '15 phút trước',
      'https://i.pinimg.com/736x/9b/6d/09/9b6d09cd352f6eb9bc01123d08ab7310.jpg',
      'Hoàng Phương',
      '22 giờ trước',
      'Bạn nên đến các phòng khám có chuyên môn để được chuẩn đoán tốt hơn.',
      3.5),
];

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff59CDB6),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: FintnessAppTheme.background,
        centerTitle: false,
        title: Text(
          "Cộng đồng",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Color(0xFF1DA1A2),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: FintnessAppTheme.background,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Chọn chuyên khoa',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            color: Color(0xFF1DA1A2),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: GridSelector<int>(
                          title: '',
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
                    getTextCommentInput(),
                    ...buildComments(listComments),
                    SizedBox(height: 75.0)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Container> buildComments(List<Comment> comments) {
    return comments
        .map((item) => Container(
              margin: EdgeInsets.symmetric(vertical: 3.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      item.contentComment,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.infomation,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7F878E)),
                        ),
                        Text(item.timeCommentDuration,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF7F878E))),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF1DA1A2)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(item.avatar),
                                radius: 50,
                                foregroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.nameDoctor,
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1DA1A2)),
                                    ),
                                    Text(item.timeReplyDuration,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1DA1A2))),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(item.contentReply,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF7F878E))),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Đánh giá câu trả lời của bác sĩ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [0, 1, 2, 3, 4].map((it) {
                        if (item.rank - it >= 1)
                          return Icon(Icons.star, color: Color(0xFF1DA1A2));
                        else if (item.rank - it == 0.5)
                          return Icon(Icons.star_half,
                              color: Color(0xFF1DA1A2));
                        else if (item.rank - it <= 0)
                          return Icon(Icons.star_border,
                              color: Color(0xFF1DA1A2));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  Icon getIconRanking() => Icon(Icons.star_border, color: Color(0xFF1DA1A2));

  List<BaseGridSelectorItem> _getTails() {
    return [
      BaseGridSelectorItem(key: 1, label: "Tất cả"),
      BaseGridSelectorItem(key: 2, label: "Khoa ngoại tổng quát"),
      BaseGridSelectorItem(key: 3, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 4, label: "Khoa mắt"),
      BaseGridSelectorItem(key: 5, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 6, label: "Khoa mắt"),
      BaseGridSelectorItem(key: 7, label: "Khoa thần kinh"),
      BaseGridSelectorItem(key: 8, label: "Khoa mắt"),
    ];
  }

  Widget getTextCommentInput() {
    return Padding(
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
          padding: const EdgeInsets.only(left: 16, right: 8, top: 4, bottom: 4),
          child: TextField(
            onChanged: (String txt) {},
            style: const TextStyle(
              fontSize: 18,
            ),
            cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Đặt câu hỏi...',
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
                    FontAwesomeIcons.arrowAltCircleRight,
                    size: 25.0,
                    color: Color(0xFFC0C8CF),
                  ),
                ),
              ),
              prefixIcon: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Icon(
                    FontAwesomeIcons.camera,
                    size: 25.0,
                    color: Color(0xFFC0C8CF),
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
