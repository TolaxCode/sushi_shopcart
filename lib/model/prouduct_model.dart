class Products {
  String image;
  String name;
  double price;
  double weigth;
  Products({
    required this.image,
    required this.name,
    required this.price,
    required this.weigth,
  });
}

List<Products> _products = [
  Products(
    image: 'assets/images/j1.jpg',
    name: 'Salmon Rice',
    price: 15,
    weigth: 300,
  ),
  Products(
    image: 'assets/images/j3.jpg',
    name: 'Sushi Rice',
    price: 14,
    weigth: 280,
  ),
  Products(
    image: 'assets/images/j2.png',
    name: 'Salmon Rice',
    price: 7,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j4.jpg',
    name: 'Sushi Rice',
    price: 8,
    weigth: 240,
  ),
  Products(
    image: 'assets/images/j5.jpg',
    name: 'Sushi Green',
    price: 10,
    weigth: 220,
  ),
  Products(
    image: 'assets/images/j3.jpg',
    name: 'Salmon Rice',
    price: 8,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j6.jpg',
    name: 'Nigril Salmon',
    price: 8,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j7.jpg',
    name: 'Nigril Salmon',
    price: 4,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j10.jpg',
    name: 'Nigril Salmon',
    price: 14,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j3.jpg',
    name: 'Sushi Rice',
    price: 15,
    weigth: 230,
  ),
  Products(
    image: 'assets/images/j9.jpg',
    name: 'Sushi Yellow',
    price: 17,
    weigth: 270,
  ),
  Products(
    image: 'assets/images/j2.png',
    name: 'Salmon Rice',
    price: 23,
    weigth: 250,
  ),
  Products(
    image: 'assets/images/j4.jpg',
    name: 'Sushi Set',
    price: 20,
    weigth: 300,
  ),
];

List<Products> get products => _products;
