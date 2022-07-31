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
// yang pada gilirannya dapat ditempatkan di [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
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

          /// SliverToBoxAdapter : digunakan untuk mengkonversi widget biasa ke slivers
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  /// isOdd : Mengembalikan true jika dan hanya jika bilangan bulat ini ganjil
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),

      /// BOTTOM NAV BAR
      /// Bisa digunakan langsung , karena ia diluar widget slivers
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
