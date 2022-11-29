import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthC extends GetxController {
  /// variabel untuk penanda kondisi true or false
  /// if true , ke HomePage
  /// /// if false , stay in LoginPage
  RxBool isAuth = false.obs;

  // kita buat contoh data fake
  final Map<String, String> _dataUser = {
    'email': 'admin@gmail.com',
    'password': 'sayaadmin',
  };

  // kita buat dialog onError
  // agar dapat dipakai berulang kali
  void dialogError(String msg) {
    Get.defaultDialog(
      title: 'Telah terjadi kesalahan login',
      middleText: msg,
    );
  }

  // kita buat function login
  void login(String email, String password, bool rememberMe) {
    // kita check kelengkapan inputan
    // email dan password diisi
    if (email != '' && password != '') {
      // kita chek lagi , apakah email yang dimasukan benar benar format email
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && password == _dataUser['password']) {
          if (rememberMe) {
            // jika true , maka simpan di storage
            final box = GetStorage();

            // Write data on your container
            // Menulis data di kontainer Anda
            box.write(
              'dataUser',
              {
                'email': email,
                'password': password,
                'rememberMe': rememberMe,
              },
            );
          } else {
            // jika false , maka hapus di storage
            final box = GetStorage();
            // read: Membaca nilai dalam wadah Anda dengan kunci yang diberikan
            if (box.read('dataUser') != null) {
              // menghapus semua data pada kontainer Anda
              box.erase();
            }
          }
          // berhasil login
          // kita ubah nilai dari isAuth
          isAuth.value = true;
        } else {
          dialogError('Data user yang anda masukan tidak valid');
        }
      } else {
        dialogError('Email yang anda masukan tidak valid');
      }
    } else {
      dialogError('Semua data input harus diisi');
    }
  }

  // auto login
  Future autoLogin() async {
    // kita panggil jembatan penyimpanan
    final box = GetStorage();

    // kita buat penampung untuk datanya
    final data = box.read('dataUser') as Map<String, dynamic>;

    // kita chek ada data apa tidak
    if (box.read('dataUser') != null) {
      login(
        data['email'],
        data['password'],
        data['rememberMe'],
      );
    }
  }

  // logout
  void logout(RxBool rememberMe) {
    // kita panggil jembatan penyimpanan
    final box = GetStorage();

    // kita check dia rememberMe atau tidak
    if (rememberMe == false) {
      // kita hapus untuk datanya
      if (box.read('dataUser') != null) {
        box.erase();
      }
    }

    isAuth.value = false;
  }
}
