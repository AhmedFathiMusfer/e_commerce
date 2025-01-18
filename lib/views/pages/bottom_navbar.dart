import 'package:e_commerce/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  //List<String> students=[];
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF5E5E5E5),
            selectedItemColor: Colors.black, // اللون الأرجواني
            unselectedItemColor: Colors.black54,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded, size: 20),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 20),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, size: 20),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 20),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 20),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
