import 'package:weddin/Screens/michango.dart';

class Weddings {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<User> michango;

  Weddings({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.michango,
  });

  // ignore: empty_constructor_bodies

}

class User {
  final String imageUrl;
  final String name;
  final String phone;
  final int kiasi;
  final bool kamaliza;
  final int baki;

  User(
      {required this.imageUrl,
      required this.name,
      required this.phone,
      required this.kiasi,
      required this.kamaliza,
      required this.baki});
}

List<Weddings> weddings = [
  Weddings(
      id: 0,
      name: 'Jenadius\'s wedding',
      description:
          'Jenadius and Elivira area hold they wedding Jenadius and Elivira area hold they wedding',
      imageUrl: 'images/pp.jpeg',
      michango: [
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'jenadius nicholaus',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'jenadius nicholaus',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: true,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'jenadius nicholaus',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: false,
            baki: 50000)
      ]),
  Weddings(
      id: 1,
      name: 'Isaya\'s wedding',
      description:
          'Isaya and ya area hold they wedding Jenadius and Elivira area hold they wedding',
      imageUrl: 'images/pp.jpeg',
      michango: [
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'John Doe',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Musa Haji',
            phone: '+255788811189',
            kiasi: 67700000,
            kamaliza: true,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000)
      ]),
  Weddings(
      id: 2,
      name: 'Ibura\'s wedding',
      description:
          'Isaya and ya area hold they wedding Jenadius and Elivira area hold they wedding',
      imageUrl: 'images/pp.jpeg',
      michango: [
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'John Doe',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Musa Haji',
            phone: '+255788811189',
            kiasi: 67700000,
            kamaliza: true,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000)
      ]),
  Weddings(
      id: 3,
      name: 'Ganga\'s wedding',
      description:
          'Isaya and ya area hold they wedding Jenadius and Elivira area hold they wedding',
      imageUrl: 'images/pp.jpeg',
      michango: [
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'John Doe',
            phone: '+255788811189',
            kiasi: 200000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Musa Haji',
            phone: '+255788811189',
            kiasi: 67700000,
            kamaliza: true,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
        User(
            imageUrl: 'images/pp.jpeg',
            name: 'Mlokozi karumuna',
            phone: '+255788811189',
            kiasi: 3000000,
            kamaliza: false,
            baki: 50000),
      ]),
];
