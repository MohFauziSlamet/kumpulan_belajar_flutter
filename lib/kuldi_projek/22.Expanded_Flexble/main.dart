import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latihan Expanded dan Flexible",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Ini menggunakan flexible fit",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // didalam row , ketika tidak diberi height , makai heightnya akan bernilai
                // setinggi dari layar hp tsb default nya
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "Container 2",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  // child bisa paling besar sebesar ruang yang tersedia
                  // (tetapi diperbolehkan untuk menjadi lebih kecil).
                  // masih bisa dipasang dengan width , jika tidak dipasang , maka akan penuh
                  // fit: FlexFit.loose,

                  // FlexFit.tight :  child dipaksa untuk mengisi ruang yang tersedia.
                  // meskipun dia memiliki width , width tsb akan di abaikan
                  fit: FlexFit.loose,
                  child: Container(
                    height: 100,
                    // width: 50,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Container 3",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          const SizedBox(
            height: 36,
          ),

          const Text(
            "Ini menggunakan flexible flex",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // didalam row , ketika tidak diberi height , makai heightnya akan bernilai
                // setinggi dari layar hp tsb default nya
                Flexible(
                  // total keseluruhan =  total flex didalam row 2 + 1 + 2 = 5
                  // ini artinya lebarnya 2/5 dari total keseluruhan
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "Container 2",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  //  Faktor flex untuk digunakan untuk child ini.
                  //  Jika null atau nol, child tidak fleksibel (0 ) akan menentukan ukurannya sendiri.
                  //  Jika non-nol(ada isinya), jumlah ruang yang dapat ditempati child dalam sumbu utama ditentukan dengan membagi ruang bebas
                  //  (setelah menempatkan child yang tidak fleksibel) sesuai dengan faktor fleksibel child  yang fleksibel.
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Container 3",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          const SizedBox(
            height: 36,
          ),

          const Text(
            "Ini menggunakan expanded",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // didalam row , ketika tidak diberi height , makai heightnya akan bernilai
                // setinggi dari layar hp tsb default nya
                Expanded(
                  // Membuat widget yang memperluas child or children dari [Row], [Column], atau [Flex]
                  // sehingga child or children  mengisi ruang yang tersedia di sepanjang sumbu utama widget flex (horizontal).
                  // expanded sama dengan flexible yang diberi FlexFit.tight
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "Container 2",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Container 3",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
