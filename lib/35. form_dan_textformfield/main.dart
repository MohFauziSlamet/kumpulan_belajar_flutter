import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void validateInput() {
      if (formKey.currentState!.validate()) {
        Get.snackbar('Berhasil', 'Proses Validasi sukses');
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Form'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autocorrect: false,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    hintText: 'Masukan Nama',
                    labelText: 'Nama',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    helperText: 'Your name',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == '') {
                      return 'nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Masukan Email',
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == '') {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Masukan Nomor',
                    labelText: 'Nomor Hp',
                    icon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == '') {
                      return 'Nomor tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      validateInput();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Validasi Data'),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Save"),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(64.0),
                    ),
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                  ),
                  onPressed: () {},
                  child: const Text("Save"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
