import 'package:flutter/material.dart';
import 'package:flutter_practice/model/hero_tile.dart';
import 'package:flutter_practice/widgtets/text.dart';

class Deatil extends StatefulWidget {
  final HeroTile heroTile;
  const Deatil({super.key, required this.heroTile});

  @override
  State<Deatil> createState() => _DeatilState();
}

class _DeatilState extends State<Deatil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText()),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Hero(
              tag: 'hero-${widget.heroTile.img}',
              child: Image.asset('assets/images/${widget.heroTile.img}.jpg'),
            ),
          ),
          Text(widget.heroTile.name, style: TextStyle(fontSize: 30)),
          Text(widget.heroTile.des, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
