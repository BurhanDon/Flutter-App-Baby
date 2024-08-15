import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/widgets/order_success_screen.dart';
import 'package:test_delete/pages/shopping_cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CheckOutPage(),
  ));
}

class CheckOutPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        elevation: 0,
        title: const Center(
          child: Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
                'Credit and debit cards are the most common payment methods for e-commerce transactions.'),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text(
                      'Shipping',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingPage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Shipping Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.network('lib/assets/images/downloaddd.png',
                    width: 50, height: 50),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Baby Toys'),
                    Text('Price: \$90.00'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            const Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Price: \$90.00'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSuccessPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4911A),
                  ),
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  Future<void> placeOrder() async {
    try {
      await _firestore.collection('orders').add({
        'productName': 'Product Name',
        'price': 50.00,
      });
      print('Order placed successfully!');
    } catch (e) {
      print('Error placing order: $e');
    }
  }
}

class ShippingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        elevation: 0,
        title: const Center(
          child: Text(
            'Address Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutPage()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: ShippingForm(),
    );
  }
}

class ShippingForm extends StatefulWidget {
  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendData() async {
    String addressText = address.text;
    String nameText = name.text;
    String streetText = street.text;
    String phoneText = phone.text;
    String cityText = city.text;
    String stateText = state.text;

    firestore.collection('Payment').add({
      "Address": addressText,
      "Name": nameText,
      "Street": streetText,
      "Phone": phoneText,
      "City": cityText,
      "State": stateText,
    }).then((value) {
      print("Data saved successfully!");
    }).catchError((error) {
      print("Failed to save data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: address,
              decoration:
                  const InputDecoration(labelText: 'Address Location ie. home'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: street,
              decoration: const InputDecoration(labelText: 'Street'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter street';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phone,
              decoration: const InputDecoration(labelText: 'Phone'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: city,
                    decoration: const InputDecoration(labelText: 'City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: state,
                    decoration: const InputDecoration(labelText: 'State'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter state';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOutPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4911A),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
