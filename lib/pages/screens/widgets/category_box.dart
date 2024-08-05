import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String count;
  final IconData editIcon;
  final IconData deleteIcon;
  final VoidCallback onDelete;

  const CategoryBox({
    required this.imagePath,
    required this.title,
    required this.count,
    required this.editIcon,
    required this.deleteIcon,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap event
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryDetailsPage(imagePath: imagePath, categoryName: title),
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
              width: 120,
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
                  onTap: onDelete,
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
}

class CategoryDetailsPage extends StatelessWidget {
  final String imagePath;
  final String categoryName;

  CategoryDetailsPage(
      {Key? key, required this.imagePath, required this.categoryName})
      : super(key: key);

  final TextEditingController _categoryDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _categoryDataController,
              decoration: const InputDecoration(
                labelText: 'Category Data',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle update data button tap
                String updatedData = _categoryDataController.text;
                // Process the updated data as needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4911A),
              ),
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
