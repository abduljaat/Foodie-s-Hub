import 'package:basic_widgets/FoodItem.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0; // for tracking bottom nav state

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: Text(
          "Foodie's Hub",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            shadows: [
              Shadow(
                blurRadius: 8,
                color: Colors.black45,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.redAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => print("Menu clicked"),
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => print("Search"),
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () => print("Cart"),
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),

      // BODY
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.redAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome,",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Abdul Rahman 👋",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Explore your menu & order your favorite food 🍕",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white24,
                          child: Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
        
                  // Food Items Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular Dishes 🍔",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
        
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
                          title: 'Cheese Pizza',
                          price: '\$12.99',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1648679708301-3e2865043526',
                          title: 'Tikka Pizza',
                          price: '\$10.49',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1586816001966-79b736744398',
                          title: 'Zinger Burger',
                          price: '\$8.99',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1672099260380-4ba66eead8ed',
                          title: 'Beef Burger',
                          price: '\$9.99',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1613319300832-a105da5bd34e',
                          title: 'Fries',
                          price: '\$4.99',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1546549032-9571cd6b27df',
                          title: 'Pasta',
                          price: '\$7.99',
                        ),
                        FoodItemCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1564436872-f6d81182df12',
                          title: 'Chicken Leg Piece',
                          price: '\$6.99',
                        ),
        
        
        
        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      //  Bottom Navigation Bar
     bottomNavigationBar: Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.orange, Colors.redAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
  child: ClipRRect(  // ensures gradient clip
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent, // important
      elevation: 0,
      type: BottomNavigationBarType.fixed, // ya shifting
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    ),
  ),
      ),
    );
  }
}
