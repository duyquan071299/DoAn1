class ClinicListData {
  ClinicListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.description,
    this.url = '',
  });

  String imagePath;
  String titleTxt;
  String url;
  String description;

  static List<ClinicListData> tabIconsList = <ClinicListData>[
    ClinicListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: 'Bệnh viện đa khoa Đồng Nai',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    ClinicListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: 'Bệnh viện đa khoa Thủ Đức',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    ClinicListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: 'Bệnh viện đa khoa Bình Thạnh',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
    ClinicListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Cách chữa trị mất ngủ',
      description:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...',
    ),
  ];
}
