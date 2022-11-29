import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authC.dart';
import '../../controllers/loginC.dart';

class LoginPage extends StatelessWidget {
  final loginConFind = Get.find<LoginC>();
  final authConFind = Get.find<AuthC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autocorrect: false,
              controller: loginConFind.emailC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Email',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => TextField(
                autocorrect: false,
                controller: loginConFind.passwordC,
                obscureText: loginConFind.hidden.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // toggle digunakan untuk mengubah nilai boolean
                      // menjadi kembalikannya .
                      // hidden default true ,
                      // ketika icon mata diklik , maka hidden diubah ke false
                      loginConFind.hidden.toggle();
                    },
                    icon: loginConFind.hidden.isTrue
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  ),
                  label: const Text(
                    'Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // remember me
            Obx(
              () => CheckboxListTile(
                value: loginConFind.rememberMe.value,
                onChanged: (value) => loginConFind.rememberMe.toggle(),
                title: const Text('Remember me'),
                // mengubah posisi chekbox
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              width: Get.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  authConFind.login(
                    loginConFind.emailC.text,
                    loginConFind.passwordC.text,
                    loginConFind.rememberMe.value,
                  );
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20, letterSpacing: 5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
