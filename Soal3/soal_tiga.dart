void ThreeMain() async {
  List<Data> post = await PostViewModel.loadData();
  print("Jawaban 3");
  String one = "";
  String two = "";
  String three = "";
  String four = "";
  String five = "";
  int countOne = 0;
  int countTwo = 0;
  int countThree = 0;
  int countFour = 0;
  int countFive = 0;
  post.forEach((element) {
    if (element.placement.name == "Meeting Room") {
      String and = " ";
      if (countOne != 0) and = " & ";
      one = one + and + element.name;
      countOne++;
    }
    if (element.type == "electronic") {
      String and = " ";
      if (countTwo != 0) and = " & ";
      two = two + and + element.name;
      countTwo++;
    }
    if (element.type == "furniture") {
      String and = " ";
      if (countThree != 0) and = " & ";
      three = three + and + element.name;
      countThree++;
    }
    if (element.purchasedAt == 16) {
      String and = " ";
      if (countFour != 0) and = " & ";
      four = four + and + element.name;
      countFour++;
    }
    element.tags.forEach((value) {
      if (value == "brown") {
        String and = " ";
        if (countFive != 0) and = " & ";
        five = five + and + element.name;
        countFive++;
      }
    });
  });

  setLog("1. ", one);
  setLog("2. ", two);
  setLog("3. ", three);
  setLog("4. ", four);
  setLog("5. ", five);
}

void setLog(String number, String value) {
  if (value == "") value = " Nothing";
  print(number + value);
}

class PostViewModel {
  static List<Data> post = [];

  static Future<List<Data>> loadData() async {
    try {
      List<Map<String, Object>> config = [
        {
          "inventory_id": 9382,
          "name": "Brown Chair",
          "type": "furniture",
          "tags": ["chair", "furniture", "brown"],
          "purchased_at": 1579190471,
          "placement": {"room_id": 3, "name": "Meeting Room"}
        },
        {
          "inventory_id": 9380,
          "name": "Big Desk",
          "type": "furniture",
          "tags": ["desk", "furniture", "brown"],
          "purchased_at": 1579190642,
          "placement": {"room_id": 3, "name": "Meeting Room"}
        },
        {
          "inventory_id": 2932,
          "name": "LG Monitor 50 inch",
          "type": "electronic",
          "tags": ["monitor"],
          "purchased_at": 1579017842,
          "placement": {"room_id": 3, "name": "Lavender"}
        },
        {
          "inventory_id": 232,
          "name": "Sharp Pendingin Ruangan 2PK",
          "type": "electronic",
          "tags": ["ac"],
          "purchased_at": 1578931442,
          "placement": {"room_id": 5, "name": "Dhanapala"}
        },
        {
          "inventory_id": 9382,
          "name": "Alat Makan",
          "type": "tableware",
          "tags": ["spoon", "fork", "tableware"],
          "purchased_at": 1578672242,
          "placement": {"room_id": 10, "name": "Rajawali"}
        }
      ];
      config.forEach((element) {
        post.add(Data.fromJson(element));
      });
    } catch (e) {
      print(e.toString() + "adnan");
    }
    return post;
  }
}

class Data {
  int inventoryId;
  String name;
  String type;
  List<String> tags;
  int purchasedAt;
  Placement placement;

  Data(
      {this.inventoryId,
      this.name,
      this.type,
      this.tags,
      this.purchasedAt,
      this.placement});

  Data.fromJson(Map<String, dynamic> json) {
    inventoryId = json['inventory_id'];
    name = json['name'];
    type = json['type'];
    tags = json['tags'].cast<String>();
    purchasedAt = json['purchased_at'];
    placement = json['placement'] != null
        ? new Placement.fromJson(json['placement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventory_id'] = this.inventoryId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['purchased_at'] = this.purchasedAt;
    if (this.placement != null) {
      data['placement'] = this.placement.toJson();
    }
    return data;
  }
}

class Placement {
  int roomId;
  String name;

  Placement({this.roomId, this.name});

  Placement.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['name'] = this.name;
    return data;
  }
}
