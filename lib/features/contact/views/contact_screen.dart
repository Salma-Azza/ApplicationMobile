import 'package:bz/core/network/dio_client.dart';
import 'package:bz/features/contact/controller/contact_controller.dart';
import 'package:bz/features/contact/data/models/contact.dart';
import 'package:bz/features/contact/data/repository/contact_repository.dart';
import 'package:bz/features/contact/views/widgets/contact_item.dart';
import 'package:bz/features/contact/views/widgets/contact_update_form.dart';
import 'package:bz/features/widgets/dismissible_item.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ContactController _controller = ContactController(
    ContactRepository(DioClient.create()),
  );
  late Future<List<Contact>> contacts;

  @override
  void initState() {
    super.initState();
    contacts = _controller.fetchContacts();
  }

  Future<void> _reload() async {
    setState(() {
      contacts = _controller.fetchContacts();
    });
  }

  Future<bool> _confirm(Contact contact, DismissDirection direction) async {
    if (direction == DismissDirection.startToEnd) {
      // Right swipe → delete confirmation
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Delete ${contact.name}?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Delete"),
            ),
          ],
        ),
      );

      return confirmed ?? false;
    } else {
      // Left swipe → edit contact
      await showDialog(
        context: context,
        builder: (context) => Dialog(
          child: UpdateContactForm(
            contact: contact,
            onUpdate: (updated) {
              _controller.editContact(updated);
              _reload();
              setState(() {}); // refresh UI
            },
          ),
        ),
      );

      return false; // do not dismiss the item
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Contacts", style: AppTextStyle().h3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder<List<Contact>>(
          future: contacts,
          builder: (context, snapshot) {
            // Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: AppTextStyle.withColor(AppTextStyle().h2, Colors.red),
                ),
              );
            }

            // Empty
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text("No contacts found", style: AppTextStyle().h2),
              );
            }

            // Success
            final list = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _reload,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, idx) {
                  final contact = list[idx];

                  return DismissibleItem(
                    id: contact.id,
                    confirmDismiss: (direction) => _confirm(contact, direction),
                    child: ContactItem(
                      name: contact.name,
                      email: contact.email,
                    ),
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
