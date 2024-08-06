import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/adminpanel_screen.dart';
import '../pages/screens/widgets/category_box.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'imagePath': 'lib/assets/images/cloth.png',
      'title': 'Child Cloths',
      'count': '10',
    },
    {
      'imagePath': 'lib/assets/images/diaper baby.jpg',
      'title': 'Baby Diapers',
      'count': '5',
    },
    {
      'imagePath': 'lib/assets/images/baby food.jpg',
      'title': 'Baby Food',
      'count': '8',
    },
    {
      'imagePath': 'lib/assets/images/feeder.jpg',
      'title': 'Natural Feeder',
      'count': '3',
    },
  ];

  void _addCategory(String title, String imagePath) {
    setState(() {
      categories.add({'title': title, 'imagePath': imagePath, 'count': '0'});
    });
  }

  void _deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF749F29),
            child: AppBar(
              backgroundColor: const Color(0xFF749F29),
              title: const Text(
                "Category Page",
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryBox(
                  imagePath: categories[index]['imagePath'],
                  title: categories[index]['title'],
                  count: categories[index]['count'],
                  editIcon: Icons.edit,
                  deleteIcon: Icons.delete,
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
                  builder: (context) => AddCategoryPage(
                    onAddCategory: (String categoryName) {
                      _addCategory(categoryName, 'lib/assets/images/cloth.png');
                    },
                    onAddCategoryImagePath: (String imagePath) {
                      _addCategory('Sample Category', imagePath);
                    },
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
    );
  }

  // Widget _buildSliderText(String text, Widget page) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => page),
  //       );
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 4,
  //       margin: const EdgeInsets.only(bottom: 10),
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDeleteDialog(BuildContext context, int index) {
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
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  _deleteCategory(index);
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
  final ValueChanged<String> onAddCategory; // Accepts only category name
  final ValueChanged<String> onAddCategoryImagePath; // Accepts image path

  AddCategoryPage({
    Key? key,
    required this.onAddCategory,
    required this.onAddCategoryImagePath,
  }) : super(key: key);

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
                String categoryName = _categoryNameController.text;
                onAddCategory(categoryName);
                // onAddCategoryImagePath('lib/assets/images/cloth.png');
                Navigator.of(context).pop();
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
