import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fitur Pencarian
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Cari menu...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Kategori Makanan
              MenuButton(
                title: "Makanan",
                description: "Nikmati hidangan lezat yang menggugah selera!",
                imageUrl: 'assets/food.jpg', // Ganti dengan gambar yang sesuai
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        category: "Makanan",
                        items: [
                          "Nasi Goreng",
                          "Sate Ayam",
                          "Ayam Penyet",
                          "Gado-Gado",
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              // Kategori Minuman
              MenuButton(
                title: "Minuman",
                description: "Segarkan dirimu dengan minuman pilihan kami.",
                imageUrl:
                    'assets/drinks.jpg', // Ganti dengan gambar yang sesuai
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        category: "Minuman",
                        items: [
                          "Es Teh Manis",
                          "Kopi Susu",
                          "Jus Alpukat",
                          "Es Campur",
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              // Kategori Snack
              MenuButton(
                title: "Snack",
                description: "Cemilan ringan yang cocok menemani waktu santai.",
                imageUrl:
                    'assets/images/logo.jpg', // Ganti dengan gambar yang sesuai
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        category: "Snack",
                        items: [
                          "Pisang Goreng",
                          "Tempe Mendoan",
                          "Martabak Mini",
                          "Roti Bakar",
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tombol Kategori dengan gambar dan deskripsi
class MenuButton extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  MenuButton({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 20),
          ],
        ),
      ),
    );
  }
}

// Halaman Kategori
class CategoryPage extends StatelessWidget {
  final String category;
  final List<String> items;

  CategoryPage({required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.fastfood, color: Colors.orange),
                onTap: () {
                  // Aksi ketika item dipilih
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${items[index]} dipilih")),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
