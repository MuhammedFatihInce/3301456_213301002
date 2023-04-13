class Product {
  late int id;
  late String name;
  late String photoUrl;
  late String discount;

  Product(
      {required this.name, required this.photoUrl, required this.discount});

  Product.withId(
      {required this.id,
        required this.name,
        required this.photoUrl,
        required this.discount});

}
