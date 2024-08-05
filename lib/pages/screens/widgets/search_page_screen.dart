import 'package:flutter/material.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/models/product.dart'; // Import the Product class
import '../detail_screen.dart';

class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  // Dummy data for demonstration using Product model from product.dart
  List<Product> searchResults = [
    Product(
      name: 'Baby Toys',
      description: 'Fun toys for babies',
      price: 10.0,
      rating: 4.5,
      imageUrl: 'lib/assets/images/babytoys.jpg', id: '1',
    ),
    Product(
      name: 'Child Clothes',
      description: 'Clothes for children',
      price: 20.0,
      rating: 4.2,
      imageUrl: 'lib/assets/images/childclothes.jpg', id: '2',
    ),
    // Add more Product objects as needed
  ];

  List<Product> filteredResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPageScreen()),
            );
          },
        ),
        title: Text('Search....'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPageScreen()),
              );
              _searchController.clear();
              setState(() {
                _searchText = "";
                filteredResults.clear();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildSearchResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (text) {
        setState(() {
          _searchText = text;
          filteredResults = searchResults
              .where((product) =>
                  product.name.toLowerCase().contains(_searchText.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: _searchText.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchText = "";
                    filteredResults.clear();
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _buildSearchResult() {
    return _searchText.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: filteredResults.length,
              itemBuilder: (context, index) {
                final product = filteredResults[index];
                return ListTile(
                  title: Text(product.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          )
        : Container(); // Empty container if there are no search results
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchProductPage(),
  ));
}
