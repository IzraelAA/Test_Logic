import 'package:refactory_flutter_test/domains/entities/user.dart';

class UserMapper {
  List<User> getUsersConverter(Map<String, dynamic> response) {
    List<User> users = [];
    var data = response['data'];

    for (var item in data) {
      users.add(User(
        id: item['name'],
        name: item['name'],
        email: item['email'],
        phone: item['phone']
      ));
    }

    return users;
  }
}