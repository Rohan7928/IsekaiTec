class NotificationModel {
  static final items = [
    Item1(
        id: 1,
        name: "Devon Lane Sonc",
        time: "07:12 pm",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item1(
        id: 2,
        name: "Devon Lane Son",
        time: "07:12 pm",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item1(
        id: 3,
        name: "Devon Lane Son",
        time: "07:12 pm",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
    Item1(
        id: 4,
        name: "Devon Lane Son",
        time: "07:12 pm",
        color: "#33505a",
        image: "assets/icons/profile_default.png"),
  ];
}

class Item1 {
  final int id;
  final String name;

  final String time;
  final String color;
  final String image;

  Item1(
      {required this.id,
      required this.name,
      required this.time,
      required this.color,
      required this.image});
}
