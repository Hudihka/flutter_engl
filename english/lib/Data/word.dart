class Word {
  final String trans;
  final String form1;
  final String form2;
  final String form3;

  Word(
      {required this.trans,
      required this.form1,
      required this.form2,
      required this.form3});

  factory Word.fromJson(Map<String, dynamic> json) {
    final String trans = json['trans'] ?? "-";
    final String form1 = json['form1'] ?? "-";
    final String form2 = json['form2'] ?? "-";
    final String form3 = json['form3'] ?? "-";

    return Word(trans: trans, form1: form1, form2: form2, form3: form3);
  }
}
