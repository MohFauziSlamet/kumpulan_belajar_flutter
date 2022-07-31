import 'package:belajar_flutter/kuldi_projek/29.HTTP%20Post%20methode/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // mengambil data dari provider yang namanya HttpProvider
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data['id'] == null)
                        ? "ID : Belum ada data"
                        : " ID : ${value.data['id']}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data['name'] == null)
                        ? "ID : Belum ada data"
                        : " ID : ${value.data['name']}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data['job'] == null)
                        ? "ID : Belum ada data"
                        : " ID : ${value.data['job']}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data['createdAt'] == null)
                        ? "ID : Belum ada data"
                        : " ID : ${value.data['createdAt']}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                //menampilkan pemberitahuan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data berhasil Di post"),
                    duration: Duration(milliseconds: 800),
                  ),
                );
                dataProvider.connectApi(' Mauludy', 'psikolog');
              },
              child: Text(
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
