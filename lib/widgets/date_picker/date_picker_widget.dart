import 'package:best_food_by_birthday/assets/color_assets.dart';
import 'package:best_food_by_birthday/assets/text_assets.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../buttons/button_header_widget.dart';

List<dynamic> _unhealthyFoodList = [];
List<dynamic> _neutralFoodList = [];
List<dynamic> _healthyFoodList = [];
List<dynamic> _curingFoodList = [];

get unhealthyFoodList => _unhealthyFoodList;
get neutralFoodList => _neutralFoodList;
get healthyFoodList => _healthyFoodList;
get curingFoodList => _curingFoodList;

bool _zodiacError = false;
get zodiacError => _zodiacError;

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  DatePickerWidgetState createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
  int _selectedZodiacYear = 0;
  int _selectedRow = 0;
  int _pickedArchetype = 0;
  DateTime? _dateOfBirth;

  String getText() {
    if (_dateOfBirth == null) {
      _zodiacError = true;
      _dateOfBirth = DateTime.now();
      return TextAssests.buttonHeaderStartText;
    } else {
      _zodiacError = false;
      return DateFormat(TextAssests.datePickerDateFormat).format(_dateOfBirth!);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: '',
        text: getText(),
        onClicked: () => _showDatePicker(context),
      );

  _showDatePicker(context) {
    showCupertinoModalPopup(
      semanticsDismissible: false,
      context: this.context,
      builder: (_) => Container(
        height: 250,
        color: ColorAssets.buttonHeaderColor,
        child: Column(
          children: [createDatePicker(), pressButtonInDatePicker(context)],
        ),
      ),
    );
  }

  SizedBox createDatePicker() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
          backgroundColor: ColorAssets.buttonHeaderColor,
          mode: CupertinoDatePickerMode.date,
          dateOrder: DatePickerDateOrder.dmy,
          minimumDate: DateTime(1910, 1, 1),
          maximumDate: DateTime(2032, 12, 31),
          initialDateTime: _dateOfBirth ?? DateTime.now(),
          onDateTimeChanged: (changedDate) {
            _dateOfBirth ??= DateTime?.now();
            _dateOfBirth = changedDate;
          }),
    );
  }

  CupertinoButton pressButtonInDatePicker(context) {
    return CupertinoButton(
        color: ColorAssets.datePickerDoneButtonColor,
        child: const Text(
          TextAssests.datePickerDoneButtonText,
          style: TextStyle(
              color: ColorAssets.datePickerDoneTextButtonColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        onPressed: () => setState(() {
              getArchetypeNumber() & getZodiacAssetsNumber() & selectCsvRow();

              Navigator.of(context, rootNavigator: true).pop(Container);
            }));
  }

  int getArchetypeNumber() {
    _dateOfBirth ??= DateTime.now();
    List<String> _archeYearSplit = _dateOfBirth!.year.toString().split('');
    List<String> _archeDateSplit = _dateOfBirth!.day.toString().split('');
    List<String> _archeMonthSplit = _dateOfBirth!.month.toString().split('');

    int _archeYear = int.parse(_archeYearSplit[0]) +
        int.parse(_archeYearSplit[1]) +
        int.parse(_archeYearSplit[2]) +
        int.parse(_archeYearSplit[3]);
    if (_archeYear.toString().length == 2) {
      _archeYear = int.parse(_archeYear.toString().split('')[0]) +
          int.parse(_archeYear.toString().split('')[1]);
    }

    int _archeDate = int.parse(_archeDateSplit[0]);
    if (_dateOfBirth?.day.toString().length == 2) {
      _archeDate =
          int.parse(_archeDateSplit[0]) + int.parse(_archeDateSplit[1]);
    }

    int _archeMonth = int.parse(_archeMonthSplit[0]);
    if (_dateOfBirth!.month.toString().length == 2) {
      _archeMonth =
          int.parse(_archeMonthSplit[0]) + int.parse(_archeMonthSplit[1]);
    }

    _pickedArchetype = _archeYear + _archeDate + _archeMonth;

    while (_pickedArchetype.toString().length == 2) {
      _pickedArchetype = int.parse(_pickedArchetype.toString().split('')[0]) +
          int.parse(_pickedArchetype.toString().split('')[1]);
    }
    return _pickedArchetype;
  }

  int getZodiacAssetsNumber() {
    _dateOfBirth ??= DateTime.now();
    List<DateTime> listOfZodiac = [
      DateTime(_dateOfBirth!.year, 12, 21),
      DateTime(_dateOfBirth!.year, 1, 21),
      DateTime(_dateOfBirth!.year, 1, 20),
      DateTime(_dateOfBirth!.year, 2, 20),
      DateTime(_dateOfBirth!.year, 2, 19),
      DateTime(_dateOfBirth!.year, 3, 21),
      DateTime(_dateOfBirth!.year, 3, 20),
      DateTime(_dateOfBirth!.year, 4, 21),
      DateTime(_dateOfBirth!.year, 4, 20),
      DateTime(_dateOfBirth!.year, 5, 22),
      DateTime(_dateOfBirth!.year, 5, 21),
      DateTime(_dateOfBirth!.year, 6, 22),
      DateTime(_dateOfBirth!.year, 6, 21),
      DateTime(_dateOfBirth!.year, 7, 24),
      DateTime(_dateOfBirth!.year, 7, 23),
      DateTime(_dateOfBirth!.year, 8, 24),
      DateTime(_dateOfBirth!.year, 8, 23),
      DateTime(_dateOfBirth!.year, 9, 24),
      DateTime(_dateOfBirth!.year, 9, 23),
      DateTime(_dateOfBirth!.year, 10, 24),
      DateTime(_dateOfBirth!.year, 10, 23),
      DateTime(_dateOfBirth!.year, 11, 23),
      DateTime(_dateOfBirth!.year, 11, 22),
      DateTime(_dateOfBirth!.year, 12, 22),
    ];

    for (int i = 2; i < listOfZodiac.length; i = i + 2) {
      final bool? isOutAfter = _dateOfBirth?.isAfter(listOfZodiac[i]);
      final bool? isOutBefore = _dateOfBirth?.isBefore(listOfZodiac[(i + 1)]);

      if (isOutAfter! && isOutBefore!) {
        double j = i / 2 + 1;
        _selectedZodiacYear = j.toInt();
      }
    }
    final bool? specialCaseC =
        _dateOfBirth?.isAfter(DateTime(_dateOfBirth!.year - 1, 12, 21));
    final bool? specialCaseD = _dateOfBirth?.isAfter(listOfZodiac[0]);
    final bool? specialCaseE = _dateOfBirth?.isBefore(listOfZodiac[1]);
    final bool? specialCaseF =
        _dateOfBirth?.isBefore(DateTime(_dateOfBirth!.year + 1, 1, 21));

    if ((specialCaseD! && specialCaseE!) ||
        (specialCaseC! && specialCaseE!) ||
        (specialCaseD && specialCaseF!)) {
      _selectedZodiacYear = 1;
    }

    return _selectedZodiacYear;
  }

  int selectCsvRow() {
    _dateOfBirth ??= DateTime.now();
    for (int rowFromBookTable = 1910;
        rowFromBookTable <= 2032;
        rowFromBookTable = rowFromBookTable + 12) {
      for (int tierFromBookTable = 0;
          tierFromBookTable <= 11;
          tierFromBookTable++) {
        _dateOfBirth?.year == (rowFromBookTable + tierFromBookTable)
            ? _selectedRow = tierFromBookTable + 1
            : {};
      }
    }
    loadCSVforZodiac();
    loadCSVforArchetype();

    return _selectedRow;
  }

  Future<dynamic> loadCSVforZodiac() async {
    final temporaryList = [];
    List<List<dynamic>> _recievedZodiacData = [];

    final _zodiacRawData =
        await rootBundle.loadString("assets/zodiac/$_selectedZodiacYear.csv");
    List<List<dynamic>> _convertedZodiacData =
        const CsvToListConverter().convert(_zodiacRawData);

    unhealthyFoodList.clear();
    neutralFoodList.clear();
    healthyFoodList.clear();
    curingFoodList.clear();
    temporaryList.clear();

    _recievedZodiacData = _convertedZodiacData;

    for (int i = 0; i < _recievedZodiacData.length; i++) {
      temporaryList.add(
        [
          (_recievedZodiacData[i].sublist(0)[0]),
          (_recievedZodiacData[i].sublist(0)[_selectedRow])
        ],
      );
    }

    for (var a = -5; a <= -1; a++) {
      for (var minusFood in temporaryList) {
        minusFood.contains(a) ? unhealthyFoodList.add(minusFood) : (0);
      } // return minusList;
    }

    for (int a = 3; a >= 1; a--) {
      for (var plusFood in temporaryList) {
        plusFood.contains(a) ? healthyFoodList.add(plusFood) : (0);
      } // return plusList
    }

    for (var zeroFood in temporaryList) {
      zeroFood.contains(0) ? neutralFoodList.add(zeroFood) : (0);
    } // return zeroList;

    for (int a = 5; a >= 4; a--) {
      for (var supePlusFood in temporaryList) {
        supePlusFood.contains(a) ? curingFoodList.add(supePlusFood) : (0);
      } // return superPlusList;
    }
  }

  Future<dynamic> loadCSVforArchetype() async {
    final List<List<String>> temporaryList2 = [];

    final _rawDataByArchetype =
        await rootBundle.loadString("assets/$_pickedArchetype ru.csv");

    List<List<dynamic>> _listData2 =
        const CsvToListConverter().convert(_rawDataByArchetype);

    for (int i = 0; i < _listData2.length; i++) {
      temporaryList2.add(List<String>.from(_listData2[i]));
    }
  }
}
