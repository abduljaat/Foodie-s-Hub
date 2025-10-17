import 'package:flutter/material.dart';
import 'FoodItem.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  // 🧁 PageView Data
  final List<Map<String, String>> _pages = [
    {
      "image": 'https://images.unsplash.com/photo-1648679708301-3e2865043526',
      "title": "Delicious Pizza",
      "desc": "Hot and cheesy pizza straight from the oven 🍕",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=800",
      "title": "Tasty Burger",
      "desc": "Juicy beef burger with crispy fries 🍔",
    },
    {
      "image":
          'https://plus.unsplash.com/premium_photo-1667546202654-e7574a20872c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=873',
      "title": "Sweet Dessert",
      "desc": "Treat yourself with something sweet 🍰",
    },
  ];

  // Handle bottom navigation bar item taps and navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
     
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔸 App Bar
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
         leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // now it works
        },
      ),
    ),
        actions: [
          IconButton(
            onPressed: () => print("Search"),
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/cart'),
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          
        ],
        
      ),
      drawer: MyDrawer(),

      // 🔹 BODY
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // 🔸 Greeting Section
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

                  // 🔹 PageView Section (Food Gallery)
                  SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() => _currentPage = index);
                            },
                            itemCount: _pages.length,
                            itemBuilder: (context, index) {
                              final page = _pages[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        page["image"]!,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          color: Colors.black26,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                page["title"]!,
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                page["desc"]!,
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _pages.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              height: 10,
                              width: _currentPage == index ? 30 : 10,
                              decoration: BoxDecoration(
                                color:
                                    _currentPage == index
                                        ? Colors.deepOrange
                                        : Colors.grey[400],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🔸 Popular Dishes Section
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

      // 🔻 Bottom Navigation Bar
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
  ),),

    );
  }
}
