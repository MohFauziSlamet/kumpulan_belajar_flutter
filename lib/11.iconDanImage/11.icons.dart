import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const IconsApp());
}

class IconsApp extends StatelessWidget {
  const IconsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row row1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.add,
          size: 25,
        ),
        Text(
          'Default sise 24, default color black',
          style: TextStyle(fontSize: 25),
        )
      ],
    );

    Row row2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.search,
          size: 25,
        ),
        Text(
          'search...',
          style: TextStyle(fontSize: 25),
        )
      ],
    );

    Row row3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        TextButton(
          onPressed: null,
          child: Text('Register'),
        )
      ],
    );

    Row row4 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('data'),
        ),
      ],
    );

    Row flatButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          child: const Text('Saya FlatButton'),
          onPressed: () => debugPrint('FlatButton di tekan'),
        )
      ],
    );

    Row raisedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('RaisedButton'),
          onPressed: () => debugPrint('RaisedButton di tekan'),
        )
      ],
    );

    Row iconButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => debugPrint('IconButton Ditekan'),
        )
      ],
    );

    Row outlineButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          child: const Text('OutlineButton'),
          onPressed: () => debugPrint('OutlineButton ditekan'),
        )
      ],
    );

    Row dropdownButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          items: <String>['Laki-Laki', 'Perempuan'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => debugPrint('Changed: ${value}'),
        ),
        const Text('DropdownButton')
      ],
    );

    Row backButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[BackButton(), Text('Back')],
    );

    Row closeButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CloseButton(),
        Text('Close'),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('latian icon'),
      ),
      body: ListView(
        children: [
          row1,
          row2,
          row3,
          row4,
          flatButton,
          raisedButton,
          iconButton,
          outlineButton,
          dropdownButton,
          backButton,
          closeButton
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => debugPrint('Floating Action Button ditekan'),
      ),
    );
  }
}
