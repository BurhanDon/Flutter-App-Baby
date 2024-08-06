import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_delete/Admin_Pannel_Pages/admin.dart';
import 'package:test_delete/Admin_Pannel_Pages/category_screen.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF749F29),
            title: const Text("Products Page"),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Admin_Pannel(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCard(
                      context, 'Product 1', Icons.edit, Icons.delete),
                  _buildProductCard(
                      context, 'Product 2', Icons.edit, Icons.delete),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCard(
                      context, 'Product 3', Icons.edit, Icons.delete),
                  _buildProductCard(
                      context, 'Product 4', Icons.edit, Icons.delete),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCategoryPage(onAddCategory: (String value) {  },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF4911A),
            ),
            child: const Text('Add Category'),
          ),
          const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderText(String text) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 5, // Adjust the width as needed
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String productName,
      IconData editIcon, IconData deleteIcon) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddProductPage(),
          ),
        );
      },
      child: Container(
        width: 220,
        height: 250,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your image widget goes here
            const Icon(
              Icons.image,
              size: 120,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              productName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Product description goes here.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  editIcon,
                  color: Colors.blue,
                ),
                GestureDetector(
                  onTap: () {
                    // Show delete confirmation dialog
                    showDialog(
                      context: context,
                      builder: (context) => _buildDeleteDialog(context),
                    );
                  },
                  child: Icon(
                    deleteIcon,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: Text('Are you sure you want to delete it?')),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Confirm Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescController = TextEditingController();
  String? _selectedImagePath;

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add Product',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _productNameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _productPriceController,
              decoration: const InputDecoration(
                labelText: 'Product Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _productDescController,
              decoration: const InputDecoration(
                labelText: 'Product Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                // Handle image upload
                String? filePath = await _openFileManager();
                if (filePath != null) {
                  setState(() {
                    _selectedImagePath = filePath;
                  });
                  print('Selected file path: $filePath');
                }
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: _displaySelectedImage(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Add Product button tap
                _addProductToFirestore();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4911A),
              ),
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _openFileManager() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      String? filePath = result.files.single.path;
      print('Selected image path: $filePath');
      return filePath;
    }
    return null;
  }

  Widget _displaySelectedImage() {
    if (_selectedImagePath != null) {
      return Image.file(
        File(_selectedImagePath!),
        width: double.infinity,
        height: 120,
        fit: BoxFit.cover,
      );
    } else {
      return const Center(
        child: Icon(
          Icons.image,
          size: 48,
          color: Colors.grey,
        ),
      );
    }
  }

  Future<void> _addProductToFirestore() async {
    print('Adding product to Firestore');
    print('Selected image path: $_selectedImagePath');

    // Check other data fields as well
    print('Product name: ${_productNameController.text}');
    print('Product price: ${_productPriceController.text}');
    print('Product description: ${_productDescController.text}');

    await productsCollection.add({
      'name': _productNameController.text,
      'price': _productPriceController.text,
      'description': _productDescController.text,
      'imagePath': _selectedImagePath,
    });
  }
}
