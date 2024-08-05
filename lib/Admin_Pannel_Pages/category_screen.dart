import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/admin.dart';
import 'package:test_delete/Admin_Pannel_Pages/order_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/product_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/setting_screen.dart';
import '../pages/screens/widgets/category_box.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: const Color(0xFF749F29),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  children: [
                    _buildSliderText('Dashboard', const Admin_Pannel()),
                    _buildSliderText('Category', const CategoryPage()),
                    _buildSliderText('Product', const ProductPage()),
                    _buildSliderText('Order', const OrderPage()),
                    _buildSliderText('Settings', const SettingPage()),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        imagePath: 'lib/assets/images/cloth baby.jpg',
                        title: 'Child Cloths',
                        count: '10',
                        editIcon: Icons.edit,
                        deleteIcon: Icons.delete,
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => _buildDeleteDialog(context),
                          );
                        },
                      ),
                      CategoryBox(
                        imagePath: 'lib/assets/images/diaper baby.jpg',
                        title: 'Baby Diapers',
                        count: '5',
                        editIcon: Icons.edit,
                        deleteIcon: Icons.delete,
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => _buildDeleteDialog(context),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        imagePath: 'lib/assets/images/baby food.jpg',
                        title: 'Baby Food',
                        count: '8',
                        editIcon: Icons.edit,
                        deleteIcon: Icons.delete,
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => _buildDeleteDialog(context),
                          );
                        },
                      ),
                      CategoryBox(
                        imagePath: 'lib/assets/images/feeder.jpg',
                        title: 'Natural Feeder',
                        count: '3',
                        editIcon: Icons.edit,
                        deleteIcon: Icons.delete,
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => _buildDeleteDialog(context),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCategoryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4911A),
                    ),
                    child: const Text('Add Category'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderText(String text, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
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
      ),
    );
  }

  Widget _buildDeleteDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: Text('Are you sure want to delete it?')),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle cancel button tap
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle confirm delete button tap
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

class AddCategoryPage extends StatelessWidget {
  final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add Category',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _categoryNameController,
              decoration: const InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle add category button tap
                String categoryName = _categoryNameController.text;
                // Process the new category as needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4911A),
              ),
              child: const Text('Add Category'),
            ),
          ],
        ),
      ),
    );
  }
}
