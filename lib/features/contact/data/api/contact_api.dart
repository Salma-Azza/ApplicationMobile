import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_client.dart';
import '../models/contact.dart';

part 'contact_api.g.dart';

@RestApi()
abstract class ContactApi extends ApiClient {
  factory ContactApi(Dio dio, {String baseUrl}) = _ContactApi;

  @GET("/users")
  Future<List<Contact>> getContacts();

  @PUT("/users/{id}")
  Future<Contact> updateContact(@Path("id") int id, @Body() Contact contact);
}
