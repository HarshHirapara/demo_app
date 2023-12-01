import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  DateTime birthDate;
  Login login;
  Address address;
  Phone phone;
  String website;
  Company company;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.login,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstname"],
        lastName: json["lastname"],
        email: json["email"],
        birthDate: DateTime.parse(json["birthDate"]),
        login: Login.fromJson(json["login"]),
        address: Address.fromJson(json["address"]),
        phone: phoneValues.map[json["phone"]]!,
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "login": login.toJson(),
        "address": address.toJson(),
        "phone": phoneValues.reverse[phone],
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  String street;
  String suite;
  City city;
  Zipcode zipCode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: cityValues.map[json["city"]]!,
        zipCode: zipcodeValues.map[json["zipcode"]]!,
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": cityValues.reverse[city],
        "zipcode": zipcodeValues.reverse[zipCode],
        "geo": geo.toJson(),
      };
}

enum City { ANYTOWN }

final cityValues = EnumValues({"Anytown": City.ANYTOWN});

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

enum Zipcode { THE_123456789 }

final zipcodeValues = EnumValues({"12345-6789": Zipcode.THE_123456789});

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

class Login {
  String uuid;
  String username;
  Password password;
  Md5 md5;
  Sha1 sha1;
  DateTime registered;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.md5,
    required this.sha1,
    required this.registered,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: passwordValues.map[json["password"]]!,
        md5: md5Values.map[json["md5"]]!,
        sha1: sha1Values.map[json["sha1"]]!,
        registered: DateTime.parse(json["registered"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": passwordValues.reverse[password],
        "md5": md5Values.reverse[md5],
        "sha1": sha1Values.reverse[sha1],
        "registered": registered.toIso8601String(),
      };
}

enum Md5 { C1328472_C5794_A25723600_F71_C1_B4586 }

final md5Values = EnumValues({
  "c1328472c5794a25723600f71c1b4586": Md5.C1328472_C5794_A25723600_F71_C1_B4586
});

enum Password { JSONPLACEHOLDER_ORG }

final passwordValues =
    EnumValues({"jsonplaceholder.org": Password.JSONPLACEHOLDER_ORG});

enum Sha1 { THE_35544_A31_CC19_BD6520_AF116554873167117_F4_D94 }

final sha1Values = EnumValues({
  "35544a31cc19bd6520af116554873167117f4d94":
      Sha1.THE_35544_A31_CC19_BD6520_AF116554873167117_F4_D94
});

enum Phone {
  THE_5555551234,
  THE_5555553456,
  THE_5555555678,
  THE_5555556789,
  THE_5555559012
}

final phoneValues = EnumValues({
  "(555) 555-1234": Phone.THE_5555551234,
  "(555) 555-3456": Phone.THE_5555553456,
  "(555) 555-5678": Phone.THE_5555555678,
  "(555) 555-6789": Phone.THE_5555556789,
  "(555) 555-9012": Phone.THE_5555559012
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
