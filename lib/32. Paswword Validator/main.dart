import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const PasswordValidation());
}

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    RxBool isSuccess = false.obs;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus
            ?.unfocus(), // untuk disable semua ,
        child: Obx(
          () => Scaffold(
            appBar: AppBar(
              title: Column(
                children: const [
                  Text(
                    "Password Validation",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "mohfauzislamet@gmail.com",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: isSuccess.value ? Colors.green : Colors.red,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isSuccess.value ? Icons.lock_open : Icons.lock_outline,
                      size: 150,
                      color: isSuccess.value ? Colors.green : Colors.red,
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextField(
                              controller: controller,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffa77979),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: isSuccess.value
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FlutterPwValidator(
                            width: 400,
                            height: 150,
                            minLength: 8,
                            uppercaseCharCount: 2,
                            numericCharCount: 3,
                            normalCharCount: 3,
                            specialCharCount: 1,
                            failureColor: Colors.grey,
                            successColor: Colors.green,
                            onSuccess: () {
                              isSuccess.value = true;
                              Get.snackbar(
                                "Berhasil",
                                "Password matched",
                                duration: const Duration(seconds: 2),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                              );
                            },
                            onFail: () {
                              isSuccess.value = false;
                            },
                            controller: controller,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
