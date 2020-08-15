import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/fintness_app_theme.dart';
import 'package:grid_selector/base_grid_selector_item.dart';
import 'package:grid_selector/grid_selector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Medicine {
  final String name;
  final String unitPrice;
  final String price;

  Medicine({
    this.name,
    this.unitPrice,
    this.price,
  });
}

class StoreScreen extends StatefulWidget {
  StoreScreen();

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Medicine> listMedicine = [
    Medicine(name: "Panadol", unitPrice: "10 viên/vỉ", price: "15.000"),
    Medicine(name: "Povidine", unitPrice: "90ml", price: "20.000đ"),
    Medicine(name: "Băng gạc", unitPrice: "10 cái", price: "15.000"),
    Medicine(name: "Oxy già", unitPrice: "90ml", price: "20.000đ"),
    Medicine(name: "Aspirin", unitPrice: "10 viên/vỉ", price: "15.000"),
    Medicine(name: "Berberin", unitPrice: "1 lọ", price: "50.000đ"),
  ];

  List<String> listSymptom = [
    "Tất cả",
    "Cảm",
    "Đau bụng",
    "Ho khan",
    "Đau đầu",
    "Sốt",
    "Nhức mỏi",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff1DA1A2),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(250.0, 14.0, 14.0, 14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1DA1A2),
                  borderRadius: BorderRadius.circular(23.00),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: InkWell(
                    onTap: () => {},
                    child: new Text(
                      "Thêm vào giỏ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: FintnessAppTheme.background,
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Color(0xff1da1a2),
              tabs: [
                Tab(
                  icon: new Text(
                    "Kê thuốc theo toa",
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
                    "Cửa hàng",
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
              "Cửa hàng",
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
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
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
                    getSearchBarUI(),
                    buildListMedicine(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
                child: ListView(
                  children: <Widget>[
                    getSearchBarUI(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 40.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: buildListSymptom(),
                      ),
                    ),
                    listMedicineCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildListSymptom() {
    List<Widget> returnList = [];
    listSymptom.forEach((element) {
      returnList.add(SymptomTag(title: element));
    });
    return returnList;
  }

  Widget buildListMedicine() {
    List<Widget> returnList = [];
    listMedicine.forEach((element) {
      returnList.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: new MedicineListTile(
            info: element,
          ),
        ),
      );
    });
    return Container(
      height: 350,
      child: ListView(
        children: returnList,
      ),
    );
  }

  Widget listMedicineCard() {
    List<Widget> returnList = [];
    listMedicine.forEach((element) {
      returnList.add(
        new MedicineCard(
          info: element,
        ),
      );
    });
    return Container(
      height: 480,
      child: SingleChildScrollView(
        child: Wrap(
          children: returnList,
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(38.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  onChanged: (String txt) {},
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    suffixIcon: Icon(
                      FontAwesomeIcons.search,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
}

class SymptomTag extends StatefulWidget {
  @override
  SymptomTag({this.title});
  final String title;
  _SymptomTagState createState() => _SymptomTagState();
}

class _SymptomTagState extends State<SymptomTag> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () => {
          this.setState(() {
            isSelected = !isSelected;
          })
        },
        child: Container(
          alignment: Alignment.center,
          width: 66.00,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff1DA1A2) : Colors.white,
            border: Border.all(
              width: 1.0,
              color: Color(0xff1DA1A2),
            ),
            borderRadius: BorderRadius.circular(10.00),
          ),
          child: new Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isSelected ? Colors.white : Color(0xff1DA1A2),
            ),
          ),
        ),
      ),
    );
  }
}

class MedicineCard extends StatefulWidget {
  @override
  MedicineCard({this.info});
  final Medicine info;
  _MedicineCardState createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  int quantity = 0;

  addQuantiy() {
    if (quantity < 99)
      this.setState(() {
        quantity++;
      });
  }

  removeQuantiy() {
    if (quantity > 0)
      this.setState(() {
        quantity--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 165,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff1da1a2).withOpacity(0.16),
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(16.00),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Placeholder(
                fallbackWidth: 80,
                fallbackHeight: 90,
              ),
              new Text(
                widget.info.name,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: Color(0xff1da1a2),
                ),
              ),
              new Text(
                "Đơn vị : " + widget.info.unitPrice,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: Color(0xff7f878e),
                ),
              ),
              new Text(
                widget.info.price,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: Color(0xffdf2f45),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 2),
                  InkWell(
                    onTap: () {
                      removeQuantiy();
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: Color(0xff1da1a2),
                    ),
                  ),
                  SizedBox(width: 2),
                  Container(
                    alignment: Alignment.center,
                    height: 33.00,
                    width: 21.00,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(7.00),
                    ),
                    child: new Text(
                      quantity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        color: Color(0xff1da1a2),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  InkWell(
                    onTap: () {
                      addQuantiy();
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff1da1a2),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineListTile extends StatefulWidget {
  @override
  MedicineListTile({this.info});
  final Medicine info;
  _MedicineListTileState createState() => _MedicineListTileState();
}

class _MedicineListTileState extends State<MedicineListTile> {
  int quantity = 0;

  addQuantiy() {
    if (quantity < 99)
      this.setState(() {
        quantity++;
      });
  }

  removeQuantiy() {
    if (quantity > 0)
      this.setState(() {
        quantity--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Container(
          height: 76.00,
          width: 277.00,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(16.00),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Placeholder(
                  fallbackWidth: 80,
                  fallbackHeight: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      widget.info.name,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff1da1a2),
                      ),
                    ),
                    new Text(
                      widget.info.unitPrice,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        color: Color(0xff2a3743),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      widget.info.price,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        color: Color(0xff2a3743),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 2),
        InkWell(
          onTap: () {
            removeQuantiy();
          },
          child: Icon(
            Icons.remove_circle_outline,
            color: Color(0xff1da1a2),
          ),
        ),
        SizedBox(width: 2),
        Container(
          alignment: Alignment.center,
          height: 33.00,
          width: 21.00,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(7.00),
          ),
          child: new Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Color(0xff1da1a2),
            ),
          ),
        ),
        SizedBox(width: 2),
        InkWell(
          onTap: () {
            addQuantiy();
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Color(0xff1da1a2),
          ),
        ),
      ],
    );
  }
}
