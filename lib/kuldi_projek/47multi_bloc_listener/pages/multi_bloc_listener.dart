import '../bloc/counter_bloc.dart';
import '../bloc/them.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMultiBlocListener extends StatefulWidget {
  const HomeMultiBlocListener({Key? key}) : super(key: key);

  @override
  State<HomeMultiBlocListener> createState() => _HomeMultiBlocListenerState();
}

class _HomeMultiBlocListenerState extends State<HomeMultiBlocListener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc Listener'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<CounterMultiBloc, int>(
              listener: (context, state) {
                // didalam listener , kita dapat menambahkan pengkondisisan
                if (state > 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text('Lebih dari ${state - 1}'),
                    ),
                  );
                }
              },
              child: BlocBuilder<CounterMultiBloc, int>(
                builder: (context, state) => Text(
                  // pada blocbuilder . tidak dapat memberikan pengkondisisan
                  // pada blocbuilder hanya membuild saja , membuat sesuatu
                  'Angka saat ini : $state',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    return context.read<CounterMultiBloc>().decrement();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    return context.read<CounterMultiBloc>().increment();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeMultiBloc>().changeTheme(),
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
