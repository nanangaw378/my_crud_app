import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CRUDScreenState createState() => _CRUDScreenState();
}

class _CRUDScreenState extends State<CRUDScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedItemId;
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await FirestoreService.getItems();
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem() async {
    final name = _nameController.text.trim();
    final ageText = _ageController.text.trim();

    if (name.isEmpty || ageText.isEmpty) {
      // Show error message or handle empty inputs as needed
      return;
    }

    final age = int.tryParse(ageText);
    if (age == null) {
      // Show error message or handle invalid age input as needed
      return;
    }

    await FirestoreService.addItem(name, age);
    _nameController.clear();
    _ageController.clear();
    _loadItems();
  }

  Future<void> _deleteItem(String id) async {
    await FirestoreService.deleteItem(id);
    _loadItems();
  }

  Future<void> _updateItem(String id, String newName, int newAge) async {
    await FirestoreService.updateItem(id, newName, newAge);
    _loadItems();
  }

  void _editItem(Map<String, dynamic> item) {
    setState(() {
      _selectedItemId = item['id'];
      _nameController.text = item['name'];
      _ageController.text = item['age'].toString();
    });
  }

  void _clearSelected() {
    setState(() {
      _selectedItemId = null;
      _nameController.clear();
      _ageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed:
                      _selectedItemId != null ? _updateSelectedItem : _addItem,
                  child: Text(
                      _selectedItemId != null ? 'Update Item' : 'Add Item'),
                ),
                if (_selectedItemId != null)
                  ElevatedButton(
                    onPressed: _clearSelected,
                    child: const Text('Cancel'),
                  ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]['name']),
                    subtitle: Text('Age: ${_items[index]['age']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(_items[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editItem(_items[index]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSelectedItem() {
    final newName = _nameController.text.trim();
    final newAgeText = _ageController.text.trim();

    if (newName.isEmpty || newAgeText.isEmpty) {
      // Show error message or handle empty inputs as needed
      return;
    }

    final newAge = int.tryParse(newAgeText);
    if (newAge == null) {
      // Show error message or handle invalid age input as needed
      return;
    }

    _updateItem(_selectedItemId!, newName, newAge);
    _clearSelected();
  }
}
