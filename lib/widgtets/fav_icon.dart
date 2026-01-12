import 'package:flutter/material.dart';
import 'package:flutter_practice/model/hero_tile.dart';

// ignore: must_be_immutable
class FavIcon extends StatefulWidget {
  HeroTile heroTile;
  FavIcon({super.key, required this.heroTile});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.pink,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            if (widget.heroTile.isClicked) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            widget.heroTile.isClicked = !widget.heroTile.isClicked;
          },
          icon: Icon(
            Icons.favorite,
            color: widget.heroTile.isClicked ? _animation.value : Colors.grey[400],
            size: 30,
          ),
        );
      },
    );
  }
}
