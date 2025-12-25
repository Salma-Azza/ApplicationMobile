import 'package:dio/dio.dart';

import '../api/contact_api.dart';
import '../models/contact.dart';

class ContactRepository {
  late final ContactApi _api;

  ContactRepository(Dio dio) : _api = ContactApi(dio);

  Future<List<Contact>> getAllContacts() => _api.getContacts();
  Future<Contact> updateContact(int id, Contact contact) =>
      _api.updateContact(id, contact);
}
