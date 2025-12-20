import 'package:blog/constants/myColors.dart';
import 'package:blog/gen/assets.gen.dart';
import 'package:blog/models/model_fake_data.dart';
import 'package:blog/models/sample_data.dart';
import 'package:blog/pages/nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController instagramIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          elevation: 10,
          semanticLabel: "semantic Label",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
          ),
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.red,
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(Assets.images.logo.path, scale: 2.5),
              ),

              Expanded(
                child: ListView(
                  children: [
                    drawerItem("Home page", Icons.home, () {}),
                    Divider(),
                    drawerItem("Settings", Icons.settings, () {}),
                    Divider(),
                    drawerItem("Modal", Icons.ac_unit_outlined, () {}),
                    Divider(),
                  ],
                ),
              ),

              Divider(),

              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  print("Logout clicked");
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          elevation: 10,
          semanticLabel: "semantic Label",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
          ),
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.red,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Morteza"),
                accountEmail: Text("morteza@email.com"),

                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://api.msoltanpour.ca/api/v1/PublicApi/StaticImage/734bb66f-4e73-459b-b7c4-e39f61ca2ee3',
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/25399858?v=4',
                    ),
                  ),
                  CircleAvatar(child: Text("MS")),
                ],
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.indigo],
                  ),
                ),
                arrowColor: Colors.white,
              ),

              Expanded(
                child: ListView(
                  children: [
                    drawerItem("Home page", Icons.home, () {}),
                    Divider(),
                    drawerItem("Settings", Icons.settings, () {}),
                    Divider(),
                    drawerItem("Modal", Icons.ac_unit_outlined, () {}),
                    Divider(),
                  ],
                ),
              ),

              Divider(),

              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  print("Logout clicked");
                },
              ),
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 0),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(Icons.menu),
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                  ),
                  Image(
                    width: size.height / 8.6,
                    image: Assets.images.logo.image().image,
                  ),
                  InkWell(
                    child: Icon(Icons.zoom_in),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const NavScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://api.msoltanpour.ca/api/v1/PublicApi/StaticImage/c08fc3eb-9c73-4087-bf02-f30addc42285',
                        ),
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: GradiantColors.darkOverlay,
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'This is first blog title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Author Morteza',

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'like 232',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: sampleTags.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 20,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: [
                                Icon(Icons.tag, color: Colors.white),
                                SizedBox(width: 6),
                                Text(
                                  sampleTags[index].tag,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: Text(
                    'Most recent blogs',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 160,

                child: ListView.builder(
                  itemCount: blogs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(8, 0, 8, 0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              height: 160,
                              fit: BoxFit.cover,
                              image: AssetImage(blogs[index].image),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: const Color.fromARGB(100, 0, 0, 0),
                              ),
                              height: 160,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        blogs[index].author,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        blogs[index].view.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    blogs[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerItem(String title, IconData icon, VoidCallback onTap) {
  return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
}
