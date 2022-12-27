class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Anne Cooper Big Sis",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item(
        id: 2,
        name: "Devon Lane Son",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item(
        id: 3,
        name: "Devon Lane Son",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item(
        id: 4,
        name: "Devon Lane Son",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item(
        id: 5,
        name: "Devon Lane Son",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item(
        id: 5,
        name: "Devon Lane Son",
        price: "Call Now",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
  ];
}

class Item {
  final int id;
  final String name;

  final String price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.image});
}
