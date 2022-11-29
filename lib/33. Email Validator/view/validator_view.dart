import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationView extends StatelessWidget {
  const ValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    /// menghapus controller
    @override
    void dispose() {
      textEditingController.dispose();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Email Validator"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),

        ///
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter your email :",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "bad  : (",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// TEXTFIELD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      autocorrect: false,
                      controller: textEditingController,
                      style: const TextStyle(color: Colors.white),
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        hintText: 'someThing@gmail.com',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
