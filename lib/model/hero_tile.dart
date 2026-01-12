class HeroTile {
  final String img;
  final String name;
  final String des;
  bool isClicked;

  HeroTile({
    required this.img,
    required this.name,
    required this.des,
    this.isClicked = false,
  });
}
