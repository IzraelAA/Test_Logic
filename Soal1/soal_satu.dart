import 'dart:async';
import 'dart:io';

void FirstMain() async {
  List<Name> list = [];
  var sNamaWrung = "";
  stdout.write("\nNama Warung : ");
  sNamaWrung = (await stdin.readLineSync().toString());
  var sNama = "";
  stdout.write("\nNama : ");
  sNama = (await stdin.readLineSync().toString());
  var sTanggal = "";
  stdout.write("\nNama Tanggal : ");
  sTanggal = (await stdin.readLineSync().toString());
  list.add(Name("Nasi", "RP.5.000"));
  list.add(Name("Lauk", "Rp.10.000"));
  list.add(Name("Minum", "Rp.5.000"));
  await SoalSatu(
      name: sNama, namaWarung: sNamaWrung, list: list, tanggal: sTanggal);
}

Future<void> SoalSatu(
    {String name, String tanggal, String namaWarung, List<Name> list}) async {
  setLog("\n" + "\n" + "\n" + "\n" + "\n");
  setLog(center(namaWarung));
  setLog(lengthString("Tanggal :", " ", tanggal));
  setLog(lengthString("Nama Kasir :", " ", name));
  setLog(lengthString("", "=", ""));
  list.forEach((element) {
    setLog(lengthString(element.title, ".", element.price));
  });
}

String center(String nameCenter) {
  String code = "";

  int left = 25 - nameCenter.length;
  for (var i = 0; i < left; i++) {
    code = code + " ";
  }

  return code + nameCenter + "";
}

void setLog(String value) {
  print(value);
}

String lengthString(String left, String center, String right) {
  String code = "";
  int count = 30 - left.length - right.length;
  for (var i = 0; i < count; i++) {
    code = code + center;
  }

  return left + code + right + "\n";
}

class Name {
  final String title;
  final String price;

  Name(this.title, this.price);
}
