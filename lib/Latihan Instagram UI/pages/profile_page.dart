import 'package:flutter/material.dart';

// import ProfilePicture item
import '../widgets/profile_picture.dart';

// import Info item
import '../widgets/info_item.dart';

// import Story item
import '../widgets/story_item.dart';

// import tab item
import '../widgets/tab_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // name profile
        title: Row(
          children: [
            const Text(
              'Barochatul Mauludy',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // action
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                // membuat foto profile
                const ProfilePicture(),

                // informasi post , followers , following
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InforamsiItem(
                        title: 'Post',
                        value: '999',
                      ),
                      InforamsiItem(
                        title: 'Followers',
                        value: '999',
                      ),
                      InforamsiItem(
                        title: 'Following',
                        value: '999',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // jarak
          const SizedBox(height: 15),

          // username
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Barochatul Mauludy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // jarak
          const SizedBox(height: 5),

          // deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: const TextSpan(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' #Hastag',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // jarak
          const SizedBox(height: 5),

          // deskripsi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Link goes to',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          // jarak
          const SizedBox(height: 5),

          // edit profile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xff000000),
                    width: 0.5,
                  ),
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          // jarak
          const SizedBox(height: 7),

          // Status
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StoryItem(
                    title: 'Story 1',
                    imgUrl: 'assets/mauludy2.jpg',
                  ),
                  StoryItem(
                    title: 'Story 2',
                    imgUrl: 'assets/mauludy3.jpg',
                  ),
                  StoryItem(
                    title: 'Story 3',
                    imgUrl: 'assets/mauludy4.jpg',
                  ),
                  StoryItem(
                    title: 'Story 4',
                    imgUrl: 'assets/mauludy5.jpg',
                  ),
                  StoryItem(
                    title: 'Story 5',
                    imgUrl: 'assets/mauludy2.jpg',
                  ),
                  StoryItem(
                    title: 'Story 6',
                    imgUrl: 'assets/mauludy3.jpg',
                  ),
                  StoryItem(
                    title: 'Story 7',
                    imgUrl: 'assets/mauludy4.jpg',
                  ),
                  StoryItem(
                    title: 'Story 8',
                    imgUrl: 'assets/mauludy5.jpg',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: StoryItem(
                      title: 'Tambah',
                      imgUrl: 'assets/add.png',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // tab
          const SizedBox(height: 10),
          Row(
            children: const [
              TabItem(
                icon: Icons.grid_on_outlined,
                inActive: true,
              ),
              TabItem(
                icon: Icons.person_pin_outlined,
                inActive: false,
              ),
            ],
          ),

          //
          const SizedBox(height: 10),
          GridView.builder(
            // shrinkWrap dan physics :
            // kita memakiai scroll dari parent
            // karena GridView didalam ListView, yang sama sama memilik scroll able
            // sehingga kita memakai scroll dari parent (listview)
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return Image.asset('assets/mauludy2.jpg');
            },
          )
        ],
      ),

      //  bottom navigasi
      bottomNavigationBar: BottomNavigationBar(
        // warna terselect
        selectedItemColor: Colors.black,
        // warna tidak terselect
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: 4,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
