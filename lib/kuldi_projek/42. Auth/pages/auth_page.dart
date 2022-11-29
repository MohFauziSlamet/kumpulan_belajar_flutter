import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import './home_page.dart';
import '../providers/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// data auth dari [AuthPage
class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  /// jika tidak ada error , maka akan langsung diarahakan ke [HomePage
  Future<String?> _authUserSignUp(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      //  Future<String?> _authUserSignUp(SignupData data) kembalian data berupa string ini
      // isinya ketika terjadi error , dia akan menampilkan pesan error berupa  string
      // return 'halo';
      /// jika tidak ada error , maka akan langsung diarahakan ke [HomePage
      try {
        // kita pasang await , agar proses ini ditungguin sampai selesai
        // agar kita tau ada error apa tidak pada proses signUp
        await Provider.of<AuthPage>(context, listen: false)
            .SignUp(email: data.name, password: data.password);
      } catch (err) {
        // kita ubah ke string , karena function ini mengembalikan string jika terjadi error
        print(err);
        return err.toString();
      }

      return null;
    });
  }

  Future<String?> _authUserLogin(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      //  Future<String?> _authUserSignUp(SignupData data) kembalian data berupa string ini
      // isinya ketika terjadi error , dia akan menampilkan pesan error berupa  string
      // return 'halo';
      /// jika tidak ada error , maka akan langsung diarahakan ke [HomePage
      try {
        // kita pasang await , agar proses ini ditungguin sampai selesai
        // agar kita tau ada error apa tidak pada proses signUp
        await Provider.of<AuthPage>(context, listen: false)
            .login(email: data.name, password: data.password);
      } catch (err) {
        // kita ubah ke string , karena function ini mengembalikan string jika terjadi error
        print(err);
        return err.toString();
      }

      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      return null!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUserLogin,
      onSignup: _authUserSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
