class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.url,
    this.description,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;

  String description;
  String url;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath:
          'https://media.laodong.vn/Storage/NewsPortal/2018/11/11/640867/Benh-Ho-Khan.jpg?w=888&h=592&crop=auto&scale=both',
      titleTxt: 'Cách chữa trị dứt điểm ho khan',
      url:
          'https://laodong.vn/suc-khoe/benh-ho-khan-nguyen-nhan-trieu-chung-va-cach-dieu-tri-dut-diem-640867.ldo',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    MealsListData(
      imagePath:
          'https://vinmec-prod.s3.amazonaws.com/images/20190402_173753_566067_nen-biet-ve-xet-nghie.max-800x800.jpg',
      url:
          'https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/vi-sao-can-chu-dong-xet-nghiem-mau-tong-quat-de-phat-hien-benh/',
      titleTxt: 'Xét nghiệm máu định kỳ',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    MealsListData(
      url:
          'https://tokuyo.com.vn/tin-tuc/may-massage-toan-than-cho-nguoi-gia.html',
      imagePath:
          'https://tokuyo.com.vn/photo/tin-tuc/hinh-anh-tin-tuc/dau-lung-o-nguoi-gia.jpg',
      titleTxt: 'Cách chữa trị đau lưng ở người già',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    MealsListData(
      url:
          'https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/cach-chua-benh-mat-ngu-o-thanh-nien/?link_type=related_posts',
      imagePath:
          'https://vinmec-prod.s3.amazonaws.com/images/20190622_042110_012887_mat-ngu.max-800x800.jpg',
      titleTxt: 'Cách chữa trị mất ngủ',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
  ];
}
