import 'package:ecommerce_flutter/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.purple,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          ProductsScreen(),
          // CartBody(),
          // UserPageView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.purple,
        onTap: (index) {
          setState(() {
            _page = index;
            // _pageController.jumpToPage(index);
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutExpo,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: "",
          ),
        ],
      ),
    );
  }
}
