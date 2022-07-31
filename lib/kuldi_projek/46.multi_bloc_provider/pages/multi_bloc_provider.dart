import 'package:belajar_flutter/kuldi_projek/46.multi_bloc_provider/bloc/counter_bloc.dart';
import 'package:belajar_flutter/kuldi_projek/46.multi_bloc_provider/bloc/them.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMultiBlocProvider extends StatelessWidget {
  const HomeMultiBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BlocProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterMultiBloc, int>(
              builder: (context, state) => Text(
                'Angka saat ini : $state',
                style: TextStyle(fontSize: 25),
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
