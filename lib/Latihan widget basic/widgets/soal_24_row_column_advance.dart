import 'package:flutter/material.dart';

class RowColumnAdvance extends StatelessWidget {
  const RowColumnAdvance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, right: 20),
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 120,
                    width: 100,
                    color: Colors.blue,
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 120,
                    width: 100,
                    color: Colors.amber,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Helo ${index + 1}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Helo ${index + 1}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
