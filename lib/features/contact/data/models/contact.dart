import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final int id;
  final String name;
  final String email;

  Contact({required this.id, required this.name, required this.email});

  // Factory constructor to parse JSON
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  // Method to convert object to JSON
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
