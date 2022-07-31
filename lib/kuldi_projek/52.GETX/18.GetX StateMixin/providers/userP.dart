import 'package:get/get.dart';

class UserP extends GetConnect {
  // get request
  Future<Response> getUser() => get('https://reqres.in/api/users/1');
}
