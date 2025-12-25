import 'package:bz/features/contact/data/models/contact.dart';
import 'package:bz/features/contact/data/repository/contact_repository.dart';

class ContactController {
  final ContactRepository _repo;

  ContactController(this._repo);

  Future<List<Contact>> fetchContacts() async {
    try {
      return await _repo.getAllContacts();
    } catch (err) {
      throw err;
    }
  }

  Future<Contact> editContact(Contact contact) async {
    int id = contact.id;
    try {
      return await _repo.updateContact(id, contact);
    } catch (err) {
      throw err;
    }
  }

  removeContact() {}
}
