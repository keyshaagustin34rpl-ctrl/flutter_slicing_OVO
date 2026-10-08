import 'package:flutter/material.dart';

void main() {
  runApp(const OVOApp());
}

class OVOApp extends StatelessWidget {
  const OVOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVO',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5428D6),
        ),
      ),
      home: const OVOPage(),
    );
  }
}

class OVOPage extends StatefulWidget {
  const OVOPage({super.key});

  @override
  State<OVOPage> createState() => _OVOPageState();
}

class _OVOPageState extends State<OVOPage> {
  int selectedIndex = 0;

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: selectedIndex == 0
            ? buildHome()
            : selectedIndex == 4
                ? buildProfile()
                : buildOtherPage(),
      ),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  // =========================
  // HOME
  // =========================

  Widget buildHome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(),
          buildNotification(),
          buildCategory(),
          buildServices(),
          buildBanner(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE1D8FF),
            Color(0xFFF5F2FF),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '09.29',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.signal_cellular_alt, size: 18),
                  SizedBox(width: 7),
                  Icon(Icons.wifi, size: 18),
                  SizedBox(width: 7),
                  Icon(Icons.battery_full, size: 20),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ovo',
                style: TextStyle(
                  color: Color(0xFF5428D6),
                  fontSize: 40,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showMessage('Menu Promo');
                },
                icon: const Icon(
                  Icons.local_offer,
                  size: 20,
                ),
                label: const Text('Promo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF5428D6),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          buildCashCard(),
        ],
      ),
    );
  }

  Widget buildCashCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4C6FDB),
            Color(0xFF4B25C5),
            Color(0xFF3C86D7),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OVO Cash',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Text(
                'Total Saldo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.visibility_outlined,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tap untuk lihat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: Color(0xFF5428D6),
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'OVO Points',
                      style: TextStyle(
                        color: Color(0xFF5428D6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCashMenu(Icons.add_circle, 'Top Up'),
              buildCashMenu(Icons.arrow_upward, 'Transfer'),
              buildCashMenu(Icons.wallet, 'Tarik Tunai'),
              buildCashMenu(Icons.history, 'History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCashMenu(
    IconData icon,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        showMessage(title);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // NOTIFICATION
  // =========================

  Widget buildNotification() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF0C2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_user,
              color: Color(0xFF5428D6),
              size: 30,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Text(
              'Cek data kamu demi kelancaran '
              'pemakaian akun OVO Premier kamu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(width: 8),

          ElevatedButton(
            onPressed: () {
              showMessage('Data berhasil dicek');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5428D6),
              foregroundColor: Colors.white,
            ),
            child: const Text('Cek'),
          ),
        ],
      ),
    );
  }

  // =========================
  // CATEGORY
  // =========================

  Widget buildCategory() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryItem(
            title: 'Favorit',
            active: true,
          ),
          CategoryItem(
            title: 'Finansial',
            active: false,
          ),
          CategoryItem(
            title: 'Hiburan',
            active: false,
          ),
          CategoryItem(
            title: 'Pilihan',
            active: false,
          ),
        ],
      ),
    );
  }

  // =========================
  // SERVICES
  // =========================

  Widget buildServices() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
        children: [
          buildService(
            Icons.account_balance,
            'Nabung',
            Colors.deepPurple,
            'BARU',
          ),
          buildService(
            Icons.payments,
            'Pinjaman',
            Colors.deepPurple,
            '100JT',
          ),
          buildService(
            Icons.credit_card,
            'Uang\nElektronik',
            Colors.deepOrange,
            'Rp 1',
          ),
          buildService(
            Icons.receipt_long,
            'Angsuran',
            Colors.pink,
            '',
          ),
          buildService(
            Icons.phone_android,
            'Pulsa',
            Colors.blue,
            'PROMO',
          ),
          buildService(
            Icons.bolt,
            'PLN',
            Colors.orange,
            'PROMO',
          ),
          buildService(
            Icons.water_drop,
            'Air PDAM',
            Colors.lightBlue,
            '',
          ),
          buildService(
            Icons.tv,
            'Internet',
            Colors.deepOrange,
            '',
          ),
        ],
      ),
    );
  }

  Widget buildService(
    IconData icon,
    String title,
    Color color,
    String label,
  ) {
    return GestureDetector(
      onTap: () {
        showMessage(title.replaceAll('\n', ' '));
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),

              if (label.isNotEmpty)
                Positioned(
                  top: -5,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // BANNER
  // =========================

  Widget buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3614B6),
            Color(0xFF6330D7),
          ],
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KrediOne',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Limit Pinjaman Hingga',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Rp 20 Juta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 20,
            bottom: 10,
            child: Text(
              '👩🏻',
              style: TextStyle(fontSize: 65),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // PROFILE
  // =========================

  Widget buildProfile() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8DCFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF5428D6),
                    size: 32,
                  ),
                ),

                const SizedBox(width: 15),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keysha Adelia Agustin',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '0800 1234 5678',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () {
                    showMessage('Ubah profile');
                  },
                  child: const Text('Ubah'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          buildProfileItem(
            Icons.verified_user,
            'OVO Premier',
          ),
          buildProfileItem(
            Icons.wallet,
            'OVO Points',
          ),
          buildProfileItem(
            Icons.star,
            'OVO Stamp',
          ),
          buildProfileItem(
            Icons.link,
            'Aplikasi Terhubung',
          ),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Bantuan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          buildProfileItem(
            Icons.help_outline,
            'Pusat Bantuan',
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildProfileItem(
    IconData icon,
    String title,
  ) {
    return InkWell(
      onTap: () {
        showMessage(title);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // OTHER PAGE
  // =========================

  Widget buildOtherPage() {
    String title;

    if (selectedIndex == 1) {
      title = 'Finance';
    } else if (selectedIndex == 2) {
      title = 'Pay';
    } else {
      title = 'Inbox';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.construction,
            size: 60,
            color: Color(0xFF5428D6),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Halaman belum dibuat',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // BOTTOM NAVIGATION
  // =========================

  Widget buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF5428D6),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Finance',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

// =========================
// CATEGORY ITEM
// =========================

class CategoryItem extends StatelessWidget {
  final String title;
  final bool active;

  const CategoryItem({
    super.key,
    required this.title,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: active
          ? BoxDecoration(
              color: const Color(0xFFF0EFF5),
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Text(
        title,
        style: TextStyle(
          color: active
              ? const Color(0xFF5428D6)
              : Colors.grey,
          fontWeight:
              active ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
      ),
    );
  }
}