void SoalSatu({String name,String tanggal,String namaWarung,List<Name> list }){
  
  print(center( namaWarung));
  print(lengthString("Tanggal :", " ",tanggal));
  print(lengthString("Nama Kasir :", " ",name));
  print(lengthString("", "=",""));
  list.forEach((element) { 
    print(lengthString(element.title, ".",element.price));
  });
}
String center(String nameCenter){
  String code ="";
  int left = 23 - nameCenter.length  ;   
  for (var i = 0; i < left; i++) { 
    code = code + " ";  
  }

  return code+nameCenter;
}
String lengthString(String left,String center,String right){
  String code ="";
  int count = 30 - left.length -  right.length  ; 
  for (var i = 0; i < count; i++) { 
    code = code + center;  
  }

  return left+code+right;
}
class Name {
  final String title;
  final String price;

  Name(this.title, this.price);

}