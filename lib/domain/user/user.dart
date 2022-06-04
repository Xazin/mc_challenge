import 'package:mc_challenge/presentation/user/widgets/info.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
      );

  List<Info> toInfos() => [
        Info(label: 'Email', text: email),
        Info(label: 'Phone', text: phone),
        Info(label: 'Website', text: website),
      ];
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geolocation geolocation;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geolocation,
  });

  static Address fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geolocation: Geolocation.fromJson(json['geo']),
      );

  List<Info> toInfos() => [
        Info(label: 'City', text: city),
        Info(label: 'Street', text: street),
        Info(label: 'Suite', text: suite),
        Info(label: 'Zipcode', text: zipcode),
        ...geolocation.toInfos(),
      ];
}

class Geolocation {
  final String lat;
  final String lng;

  Geolocation({
    required this.lat,
    required this.lng,
  });

  static Geolocation fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json['lat'],
        lng: json['lng'],
      );

  List<Info> toInfos() => [
        Info(label: 'Latitude', text: lat),
        Info(label: 'Longitude', text: lng),
      ];
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  static Company fromJson(Map<String, dynamic> json) => Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );

  List<Info> toInfos() => [
        Info(label: 'Company Name', text: name),
        Info(label: 'Company Catchphrase', text: catchPhrase),
        Info(label: 'Business', text: bs),
      ];
}
