// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/hero_tile.dart';
import 'package:flutter_practice/widgtets/deatil.dart';
import 'package:flutter_practice/widgtets/dice.dart';
import 'package:flutter_practice/widgtets/fav_icon.dart';
import 'package:flutter_practice/widgtets/text.dart';

class InplicitCustom extends StatefulWidget {
  const InplicitCustom({super.key});

  @override
  State<InplicitCustom> createState() => _InplicitCustomState();
}

class _InplicitCustomState extends State<InplicitCustom>
    with SingleTickerProviderStateMixin {
  //list
  List<Widget> tileLst = [];
  //datasource
  List<HeroTile> _list = [
    HeroTile(img: 'bird', name: 'Bird', des: 'This is a bird'),
    HeroTile(img: 'clover', name: 'Clover Leaf', des: 'This is a clover leaf'),
    HeroTile(img: 'dice', name: 'Dice', des: 'This is a dice'),
  ];

  //global key
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<DiceState> _diceKey = GlobalKey<DiceState>();

  //add to tileList with animation
  Future<void> addtoList() async {
    for (var currentTile in _list) {
      tileLst.add(
        ListTile(
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
          trailing: FavIcon(heroTile: currentTile),
        ),
      );
      _listKey.currentState!.insertItem(tileLst.length - 1);
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addtoList();
    });
  }

  Tween<Offset> _offSet = Tween(begin: Offset(-1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText()),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            Flexible(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: tileLst.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(_offSet),
                    child: tileLst[index],
                  );
                },
              ),
            ),
            Flexible(flex: 2, child: Dice(key: _diceKey)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _diceKey.currentState!.rollDice();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
