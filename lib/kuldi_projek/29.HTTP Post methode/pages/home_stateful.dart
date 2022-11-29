import 'package:belajar_flutter/kuldi_projek/29.HTTP%20Post%20methode/models/http_stateful.dart';
import 'package:flutter/material.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  //
  HttpStateful dataResponse = HttpStateful();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - STATEFULL"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == "")
                    ? " ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.name == "")
                    ? " ID : Belum ada data"
                    : "ID : ${dataResponse.name}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.job == "")
                    ? " ID : Belum ada data"
                    : "ID : ${dataResponse.job}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.createdAt == "")
                    ? " ID : Belum ada data"
                    : "ID : ${dataResponse.createdAt}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                //menampilkan pemberitahuan
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data berhasil Di post"),
                    duration: Duration(milliseconds: 800),
                  ),
                );
                HttpStateful.connectApi("Mauludy", "psikolog").then(
                  (value) {
                    // kita masukan value kedalam dataResponse
                    setState(
                      () {
                        dataResponse = value;
                      },
                    );
                  },
                );
              },
              child: const Text(
                "POST DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
