void TwoMain() async {
  List<Data> post = await PostViewModel.loadData();
  List<Articles> articels = [];
  print("Jawaban 2");
  String one = "";
  String two = "";
  String three = "";
  String four = "";
  String five = "";
  String six = "";
  String seven = "";
  int countOne = 0;
  int countTwo = 0;
  int countThree = 0;
  int countFour = 0;
  int countFive = 0;
  int countSix = 0;
  int countSeven = 0;
  
  post.forEach((element) {
    if (element.profile.phones.length == 0) {
      String and = " ";
      if (countOne != 0) and = " & ";
      one = one + and + element.username;
      countOne++;
    }
    if (element.articles.length != 0) {
      String and = " ";
      if (countTwo != 0) and = " & ";
      two = two + and + element.username;
      countTwo++;
    }
    if (element.profile.fullName.toLowerCase().contains("annis")) {
      String and = " ";
      if (countThree != 0) and = " & ";
      three = three + and + element.username;
      countThree++;
    }
    if (element.profile.birthday.contains("1986")) {
      String and = " ";
      if (countFive != 0) and = " & ";
      five = five + and + element.username;
      countFive++;
    }
    articels.addAll(element.articles);
  });
  articels.forEach((element) {
    if (element.publishedAt.contains("2020")) {
      String and = " ";
      if (countFour != 0) and = " & ";
      four = four + and + element.title;
      countFour++;
    }
    if (element.title.toLowerCase().contains("tips")) {
      String and = " ";
      if (countSix != 0) and = " & ";
      six = six + and + element.title;
      countSix++;
    }

    if (DateTime.parse(element.publishedAt).month < 08) {
      String and = " ";
      if (countSeven != 0) and = " & ";
      seven = seven + and + element.title;
      countSeven++;
    }
  });

  setLog("1. ", one);
  setLog("2. ", two);
  setLog("3. ", three);
  setLog("4. ", four);
  setLog("5. ", five);
  setLog("6. ", six);
  setLog("7. ", seven);
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
          "id": 323,
          "username": "rinood30",
          "profile": {
            "full_name": "Shabrina Fauzan",
            "birthday": "1988-10-30",
            "phones": ["08133473821", "082539163912"]
          },
          "articles:": [
            {
              "id": 3,
              "title": "Tips Berbagi Makanan",
              "published_at": "2019-01-03T16:00:00"
            },
            {
              "id": 7,
              "title": "Cara Membakar Ikan",
              "published_at": "2019-01-07T14:00:00"
            }
          ]
        },
        {
          "id": 201,
          "username": "norisa",
          "profile": {
            "full_name": "Noor Annisa",
            "birthday": "1986-08-14",
            "phones": []
          },
          "articles:": [
            {
              "id": 82,
              "title": "Cara Membuat Kue Kering",
              "published_at": "2019-10-08T11:00:00"
            },
            {
              "id": 91,
              "title": "Cara Membuat Brownies",
              "published_at": "2019-11-11T13:00:00"
            },
            {
              "id": 31,
              "title": "Cara Membuat Brownies",
              "published_at": "2019-11-11T13:00:00"
            }
          ]
        },
        {
          "id": 42,
          "username": "karina",
          "profile": {
            "full_name": "Karina Triandini",
            "birthday": "1986-04-14",
            "phones": ["06133929341"]
          },
          "articles:": []
        },
        {
          "id": 201,
          "username": "icha",
          "profile": {
            "full_name": "Annisa Rachmawaty",
            "birthday": "1987-12-30",
            "phones": []
          },
          "articles:": [
            {
              "id": 39,
              "title": "Tips Berbelanja Bulan Tua",
              "published_at": "2019-04-06T07:00:00"
            },
            {
              "id": 43,
              "title": "Cara Memilih Permainan di Steam",
              "published_at": "2019-06-11T05:00:00"
            },
            {
              "id": 58,
              "title": "Cara Membuat Brownies",
              "published_at": "2019-09-12T04:00:00"
            }
          ]
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
  int id;
  String username;
  Profile profile;
  List<Articles> articles;

  Data({this.id, this.username, this.profile, this.articles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['articles:'] != null) {
      articles = new List<Articles>();
      json['articles:'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.articles != null) {
      data['articles:'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  String fullName;
  String birthday;
  List<String> phones;

  Profile({this.fullName, this.birthday, this.phones});

  Profile.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    birthday = json['birthday'];
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['birthday'] = this.birthday;
    data['phones'] = this.phones;
    return data;
  }
}

class Articles {
  int id;
  String title;
  String publishedAt;

  Articles({this.id, this.title, this.publishedAt});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publishedAt = json['published_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['published_at'] = this.publishedAt;
    return data;
  }
}
