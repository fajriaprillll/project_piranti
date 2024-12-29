import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _allMenus = [
    'Nasi Goreng',
    'Mie Goreng',
    'Es Teh',
    'Es Jeruk',
    'Pisang Goreng',
    'Burger',
    'Sate Ayam',
    'Kopi',
    'Roti Bakar',
    'Pizza'
  ];
  List<String> _filteredMenus = [];

  @override
  void initState() {
    super.initState();
    _filteredMenus = _allMenus; // Menampilkan semua menu saat pertama kali
  }

  // Fungsi pencarian menu
  void _searchMenu(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMenus = _allMenus;
      } else {
        _filteredMenus = _allMenus
            .where((menu) => menu.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cari Menu", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kolom Pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari makanan, minuman, atau snack...',
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                filled: true,
                fillColor: Colors.orange[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              onChanged: (query) {
                _searchMenu(query);
              },
            ),
          ],
        ),
      ),
    );
  }
}
