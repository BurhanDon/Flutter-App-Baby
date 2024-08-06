import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:test_delete/Admin_Pannel_Pages/adminpanel_screen.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'description': 'Description for product 1',
      'imagePath': 'lib/assets/images/cloth.png',
    },
    {
      'name': 'Product 2',
      'description': 'Description for product 2',
      'imagePath': 'lib/assets/images/cloth1.png',
    },
  ];

  void _addProduct(Map<String, String> productData) {
    setState(() {
      products.add(productData);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF749F29),
            title: const Text(
              "Products Page",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  context,
                  products[index]['name']!,
                  products[index]['description']!,
                  products[index]['imagePath']!,
                  Icons.edit,
                  Icons.delete,
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) => _buildDeleteDialog(context, index),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddProductPage(onAddProduct: _addProduct),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF4911A),
            ),
            child: const Text('Add Product'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String productName,
    String productDescription,
    String imagePath,
    IconData editIcon,
    IconData deleteIcon, {
    required VoidCallback onDelete,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductPage(
              onAddProduct: (productData) {
                setState(() {
                  products.add(productData);
                });
              },
            ),
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
            Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
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
            Text(
              productDescription,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(editIcon, color: Colors.blue),
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(deleteIcon, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteDialog(BuildContext context, int index) {
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
                  _deleteProduct(index);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
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
  final ValueChanged<Map<String, String>> onAddProduct;

  const AddProductPage({super.key, required this.onAddProduct});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescController = TextEditingController();
  String? _selectedImagePath;

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
            const SizedBox(height: 20),
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
                String? filePath = await _openFileManager();
                if (filePath != null) {
                  setState(() {
                    _selectedImagePath = filePath;
                  });
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
                widget.onAddProduct({
                  'name': _productNameController.text,
                  'description': _productDescController.text,
                  'imagePath': _selectedImagePath ?? '',
                });
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
      return result.files.single.path;
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
}
