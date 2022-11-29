
import 'package:flutter/material.dart';

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({Key? key}) : super(key: key);

  @override
  _DetailHomePageState createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // bagian kiri layar
          color: Colors.lightGreen[100],
          width: MediaQuery.of(context).size.width * 0.2,
          child: ListView(
            children: [
              // profil
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text(
                                'Halo \nMoh Fauzi Slamet',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.lightGreen[200],
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ],
    );
  }
}
