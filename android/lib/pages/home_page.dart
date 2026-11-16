import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // BANNER DAN MEMBERSHIP
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // BANNER PROMO
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF211D1A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/home_hero_reference.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  // KARTU MEMBERSHIP
                  Positioned(
                    top: 260,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          // LEVEL DAN POIN
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F0F0),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Color(0xFF9E9181),
                                      child: Text(
                                        'Lv.1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '5% Cashback',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Row(
                                children: [
                                  Icon(
                                    Icons.confirmation_num,
                                    color: Color(0xFFF45124),
                                    size: 24,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.workspace_premium,
                                    color: Color(0xFFFFB21C),
                                    size: 24,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '44 pts',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // PICKUP DAN DELIVERY
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Pickup dipilih'),
                                      ),
                                    );
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.shopping_bag,
                                        size: 85,
                                        color: Color(0xFFF45124),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'PICKUP',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                height: 75,
                                width: 1,
                                color: Colors.black12,
                              ),

                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Delivery dipilih'),
                                      ),
                                    );
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        size: 85,
                                        color: Color(0xFFF45124),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'DELIVERY',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // SHORTCUT MENU
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.workspace_premium_outlined,
                                      size: 34,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Monthly\nPromo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),

                              InkWell(
                                onTap: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.people_outline,
                                      size: 34,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Referral',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),

                              InkWell(
                                onTap: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.assignment_turned_in_outlined,
                                      size: 34,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Mission',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),

                              InkWell(
                                onTap: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.speed_outlined,
                                      size: 34,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Spin & Win',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
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

              // JARAK SETELAH MEMBERSHIP
              const SizedBox(height: 285),

              // LIMITED OFFERS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Limited Offers',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0ED),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            size: 16,
                            color: Color(0xFFF45124),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '06 : 53 : 31',
                            style: TextStyle(
                              color: Color(0xFFF45124),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // PROMO HORIZONTAL SCROLL
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),

                    Image.asset(
                      'assets/images/offer_saturday_reference.jpg',
                      width: 310,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 15),

                    Image.asset(
                      'assets/images/offer_matcha_reference.jpg',
                      width: 310,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 16),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFF45124),
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 13,
        unselectedFontSize: 13,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: 'Menu'),

          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),

          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Member',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}
