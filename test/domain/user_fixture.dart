import 'package:mc_challenge/domain/user/user.dart';

const cUserJson = {
  "id": 1,
  "name": "Joseph Hernandez",
  "username": "@JosephHndz",
  "email": "katlynn2000@hotmail.com",
  "address": {
    "street": "746 Dark Hollow Road",
    "suite": "Apt. 142",
    "city": "Juda",
    "zipcode": "53550",
    "geo": {"lat": "42.606506", "lng": "-89.420395"}
  },
  "phone": "608-934-9353",
  "website": "hernandez-joseph.org",
  "company": {
    "name": "Disc Jockey",
    "catchPhrase": "Meditation-oriented dynamic structure",
    "bs": "Management Occupations"
  }
};

final cUser = User(
  id: 1,
  name: "Joseph Hernandez",
  email: "katlynn2000@hotmail.com",
  address: Address(
    street: "746 Dark Hollow Road",
    suite: "Apt. 142",
    city: "Juda",
    zipcode: "53550",
    geolocation: Geolocation(lat: "42.606506", lng: "-89.420395"),
  ),
  phone: "608-934-9353",
  website: "hernandez-joseph.org",
  company: Company(
    name: "Disc Jockey",
    catchPhrase: "Meditation-oriented dynamic structure",
    bs: "Management Occupations",
  ),
);
