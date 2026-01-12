// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/hero_tile.dart';
import 'package:flutter_practice/widgtets/deatil.dart';
import 'package:flutter_practice/widgtets/fav_icon.dart';
import 'package:flutter_practice/widgtets/text.dart';

class InplicitCustom extends StatefulWidget {
  const InplicitCustom({super.key});

  @override
  State<InplicitCustom> createState() => _InplicitCustomState();
}

class _InplicitCustomState extends State<InplicitCustom>
    with SingleTickerProviderStateMixin {
  List<HeroTile> _list = [
    HeroTile(img: 'bird', name: 'Bird', des: 'This is a bird'),
    HeroTile(img: 'clover', name: 'Clover Leaf', des: 'This is a clover leaf'),
    HeroTile(img: 'dice', name: 'Dice', des: 'This is a dice'),
  ];

  

  ListView buildListTile(List<HeroTile> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final currentTile = list[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Deatil(heroTile: currentTile),
              ),
            );
          },
          leading: Hero(
            tag: 'hero-${currentTile.img}',
            child: Image.asset('assets/images/${currentTile.img}.jpg'),
          ),
          title: Text(currentTile.name),
          subtitle: Text(currentTile.des),
          trailing: FavIcon(heroTile: currentTile,)
        );
      },
      itemCount: list.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText()),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            Text('Hero Animation', style: TextStyle(fontSize: 20)),
            Expanded(child: buildListTile(_list)),
          ],
        ),
      ),
    );
  }
}
