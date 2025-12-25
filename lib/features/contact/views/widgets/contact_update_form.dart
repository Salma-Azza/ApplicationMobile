import 'package:bz/features/contact/data/models/contact.dart';
import 'package:flutter/material.dart';

class UpdateContactForm extends StatefulWidget {
  final Contact contact;
  final Function(Contact) onUpdate; // callback when form is submitted

  const UpdateContactForm({
    super.key,
    required this.contact,
    required this.onUpdate,
  });

  @override
  State<UpdateContactForm> createState() => _UpdateContactFormState();
}

class _UpdateContactFormState extends State<UpdateContactForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _emailController = TextEditingController(text: widget.contact.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final updatedContact = Contact(
      id: widget.contact.id,
      name: _nameController.text,
      email: _emailController.text,
    );

    widget.onUpdate(updatedContact);
    Navigator.of(context).pop(); // close the form
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: Offset(0, 3),
                color: Colors.black26,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Update Contact",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text("Update")),
            ],
          ),
        ),
      ),
    );
  }
}
