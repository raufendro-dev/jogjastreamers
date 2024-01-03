import "package:flutter/material.dart";
import "package:jogja_streamers/config/theme/colorStyle.dart";
import "package:jogja_streamers/pages/TabViews/home.dart";
import "package:jogja_streamers/pages/TabViews/profil.dart";
import "package:jogja_streamers/pages/TabViews/search.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(_selectedIndex);
    });
  }

  List<Widget> _tabBarView = [Home(), Search(), Profil()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabBarView.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: TabBarView(
        children: _tabBarView,
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: cBackground,
        unselectedItemColor: Colors.white,
        selectedItemColor: cButton,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
