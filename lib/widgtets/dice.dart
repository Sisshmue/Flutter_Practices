import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => DiceState();
}

class DiceState extends State<Dice> with TickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;
  late Animation _diceAnimation;
  late Animation _diceAnimation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _diceAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(_curvedAnimation);

    _diceAnimation2 = TweenSequence(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(0, -0.5), end: Offset(-0.5, 0)),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(-0.5, 0),end: Offset(0, 0.5)),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(0, 0.5),end: Offset(0.5, 0)),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(0.5, 0),end: Offset(0, -0.5)),
        weight: 20,
      ),
    ]).animate(_curvedAnimation);
  }

  void rollDice() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FractionalTranslation(
            translation: _diceAnimation2.value,
            child: Transform.rotate(
              angle: _controller.value * 2 * 3.14159,
              child: Image.asset('assets/images/bid_dice.png')),
          );
        },
      ),
    );
  }
}
