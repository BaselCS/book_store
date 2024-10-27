import 'package:flutter/material.dart';

class Model {
  String title;
  String author;
  String path;
  bool isAvailable;

  Model({required this.title, required this.author, required this.path, this.isAvailable = true});
}

List<Model> modelList = [
  Model(
      title: ("HANDBOOK OF COSMETIC SCIENCE & TECHNOLOGY 3RD EDITION"),
      author: ("ANDRE O. BAREL & MARC PAYE"),
      path: "assets/Books/ANDRE O. BAREL & MARC PAYE - HANDBOOK OF COSMETIC SCIENCE & TECHNOLOGY 3RD EDITION.jpg"),
  Model(
      title: ("PHARMACEUTICAL BIOTECHNOLOGY 4TH EDITION"),
      author: ("DAAN J A. CROMMELIN & ROBERT D. SINDELAR"),
      path: "assets/Books/DAAN J A. CROMMELIN & ROBERT D. SINDELAR - PHARMACEUTICAL BIOTECHNOLOGY 4TH EDITION.jpeg"),
  Model(title: ("MedSurg Success"), author: ("Kathryn Cadenhead"), path: "assets/Books/MedSurgSuccess.png"),
  Model(title: ("Nursing Care Plans 6th Edition"), author: ("Mariynn E. Doenges"), path: "assets/Books/nursing care plans 6th edition.jpg"),
  Model(title: ("أحكام المواريث و الوصايا و الوقف"), author: ("صالح بن إبراهيم الحصين"), path: "assets/Books/أحكام المواريث و الوصايا و الوقف.jpeg"),
  Model(title: ("إلى الجيل الصاعد"), author: ("أحمد بن يوسف السيد"), path: "assets/Books/إلى الجيل الصاعد.jpg"),
  Model(title: ("الفوائد ابن القيم"), author: ("شمس الدين ابن قيم الجوزية"), path: "assets/Books/الفوائد ابن القيم.jpg"),
  Model(
      title: ("تفسير الكريم الرحمن في تفسير كلام المنان"),
      author: ("عبد الرحمن بن ناصر السعدي"),
      path: "assets/Books/تفسير الكريم الرحمن في تفسير كلام المنان.jpg"),
  Model(title: ("زخرف القول"), author: ("عبد الله بن صالح العجيري و فهد بن صالح العجلان"), path: "assets/Books/زخرف القول.jpg"),
  Model(title: ("سبع مسرحيات"), author: ("يوجين أونيل"), path: "assets/Books/سبع مسرحيات.jpg"),
  Model(title: ("شرح ديوان المتنبي"), author: ("عبد الرحمن بن البرقوقي"), path: "assets/Books/شرح ديوان المتنبي.jpg"),
  Model(title: ("صحيح البخاري"), author: ("محمد بن إسماعيل البخاري"), path: "assets/Books/صحيح البخاري.jpg"),
  Model(
    title: ("صحيح مسلم"),
    author: ("مسلم بن الحجاج النيسابوري"),
    path: "assets/Books/صحيح مسلم.jpg",
  ),
  Model(title: ("كيف تذاكر"), author: ("رون فراي"), path: "assets/Books/كيف تذاكر.jpg"),
  Model(title: ("لعبة الأمم"), author: ("مايلز كوبلاند"), path: "assets/Books/لعبة الأمم.jpg", isAvailable: false),
  Model(title: ("ما لا يسع المسلم جهله"), author: ("عبد الله المصلح و صالح الصّاوي"), path: "assets/Books/ما لا يسع المسلم جهله.jpg"),
  Model(title: ("مبادئ القانون التجاري"), author: ("عدنان العمر و خالد عبد التواب و نزار الحمروني"), path: "assets/Books/مبادئ القانون التجاري.jpeg"),
  Model(title: ("مقدمة في الإرشاد السياحي"), author: ("يوسف مصطفى"), path: "assets/Books/مقدمة في الإرشاد السياحي.jpeg", isAvailable: false),
  Model(title: ("هيروشميا"), author: ("عبد الله بن ناصر العجيري "), path: "assets/Books/هيروشميا.jpg"),
];

String truncate(String text, int size) {
  return text.length > size ? '${text.substring(0, size)}...' : text;
}

List<Model> borrowList = [];

class ConfirmListProvider with ChangeNotifier {
  final List<Model> _confirmList = [];

  List<Model> get confirmList => _confirmList;

  void addToList(Model model) {
    _confirmList.add(model);
    notifyListeners();
  }

  void removeFromList(Model model) {
    _confirmList.remove(model);
    notifyListeners();
  }

  void clearList() {
    _confirmList.clear();
    notifyListeners();
  }
}
