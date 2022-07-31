import '../widget/widget_counter.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  static const routName = "/counter-page";

  CounterPage() {
    print("==================");
    print("Constructor counter page STF");
  }

  @override
  // ignore: no_logic_in_create_state
  State<CounterPage> createState() {
    // ignore: avoid_print

    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;
  @override
  void didChangeDependencies() {
    // didChangeDependencies dapat diletakan diatasa maupun dibawah
    // dijalankan setelah initstate
    print("didChangeDependencies() WidgetCounter");
    Object? numberState = ModalRoute.of(context)!
        .settings
        .arguments; // menangkap data dari route  yang dikirim OtherPage , dan kita tampung ke variabel numberState

    // lalu kita ubah nilai counter dengan nilai yang baru ditangkap dari route
    if (numberState != null) {
      setState(() {
        counter = numberState as int;
      });
    }
    super.didChangeDependencies();
    // sama dengan initsate , didChangeDependencies() dijalankan pertama kali
    // saat aplikasi dijalankan , dan didalam didChangeDependencies() di bolehkan
    // ada context
  }

  @override
  Widget build(BuildContext context) {
    // print("Build() methode counter page");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
