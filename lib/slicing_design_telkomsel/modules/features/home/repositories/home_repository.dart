// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:java_code/constant/core/api_const.dart';
// import 'package:java_code/modules/models/all_menu_res/all_menu_res.dart';
// import 'package:java_code/utils/services/dio_service.dart';

// class HomeRepository {
//   /// GET ALL MENU
//   Future<AllMenuRes> getAllMenu() async {
//     try {
//       var result = await DioService.dioCall().get(
//         ApiConst.getAllMenuURL,
//       );
//       var resultMenu = AllMenuRes.fromJson(result.data);

//       return resultMenu;
//     } on DioError catch (e) {
//       if (e.type == DioErrorType.connectTimeout) {
//         Get.snackbar('Terjadi Kesalahan', 'Connection Timeout');
//         // ignore: avoid_print
//         print(
//             '[POST - ${ApiConst.getAllMenuURL}] ERROR ${e.response!.statusCode} ==> ${e.response!.data}');

//         return AllMenuRes.fromJson(e.response!.data);
//       } else {
//         if (e.response == null) {
//           Get.snackbar('Terjadi Kesalahan', 'Unknown Error');
//           // ignore: avoid_print
//           print(
//               '[POST - ${ApiConst.getAllMenuURL}] ERROR ${e.response!.statusCode} ==> ${e.response!.data}');

//           return AllMenuRes.fromJson(e.response!.data);
//         } else {
//           // ignore: avoid_print
//           print(
//               '[POST - ${ApiConst.getAllMenuURL}] ERROR ${e.response!.statusCode} ==> ${e.response!.data}');

//           return AllMenuRes.fromJson(e.response!.data);
//         }
//       }
//     }
//   }
// }
