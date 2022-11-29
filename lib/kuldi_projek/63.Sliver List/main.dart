import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

// [SliverAppBar] biasanya digunakan di [CustomScrollView.slivers],
//yang pada gilirannya dapat ditempatkan di [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_rounded),
              ),
            ],
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm),
            ),

            /// pinned: jika true => appbar tetap ditampilkan , ketika di scroll
            /// pinned: jika false => appbar akan dihilangkan , ketika di scroll
            pinned: _pinned,

            /// snap : jika snap true , maka floating juga akan bernilai true.
            /// ketika layar discroll ke atas sedikit , lalu di angkat scroll nya,
            /// maka SliverAppBar akan langsung muncul , meskipun appbar hanya muncul sedikit.
            /// snap : jika snap false, maka floating tetap bisa true atau false.
            /// kesimpulannya floating tidak bergantung pada snap , namun snap bergantung
            /// pada floating.
            snap: _snap,

            /// floating : jika true => SliverAppBar akan ditampilkan meskipun belum mencapai
            /// puncak scroll. pada kasus ini puncak scroll adalah nilai 0.
            /// floating: jika false => SliverAppBar akan ditampilkan hanya saat sudah mencapai
            /// puncak scroll. yaitu angka 0
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'SliverAppBar',
                softWrap: true,
                style: TextStyle(fontSize: 24),
              ),
              centerTitle: true,
              background: Image(
                image: AssetImage('assets/images/mauludy5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              // height: 20,
              child: Center(
                child: Text(
                  'Scroll to see the SliverAppBar in effect.',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          /// SliverPersistentHeader => mirip appbar , tpi bisa custom
          SliverPersistentHeader(
            pinned: true,
            delegate: MyPersistent(),
          ),

          /// SliverList => SliverChildBuilderDelegate == listview.builder
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  /// isOdd : Mengembalikan true jika dan hanya jika bilangan bulat ini ganjil
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      'Menu item ke $index', textScaleFactor: 2,
                      // style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),

          /// SliverList => SliverChildListDelegate == listview biasa
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 200,
                  color: Colors.teal,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  color: Colors.amber,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  color: Colors.teal,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverGrid.count(
            crossAxisCount: 3,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.pink,
              )
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverGrid.extent(
            maxCrossAxisExtent: 150,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.pink,
              )
            ],
          ),

          ///
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPersistent extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    /// WIDGET YANG AKAN DITAMPILKAN
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/mauludy5.jpg",
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "BISA DIISI DENGAN WIDGET APAPUN",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override

  /// TINGGI MAX WIDGET
  double get maxExtent => 200;
  @override

  /// TINGGI MINIMUM WIDGET
  double get minExtent => 120;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    /// INIGIN DIBUILD LAGI , KE2 DST . ATAU TIDAK?
    return false;
  }
}
