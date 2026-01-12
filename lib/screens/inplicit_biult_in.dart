import 'package:flutter/material.dart';

class InplicitBiultIn extends StatefulWidget {
  const InplicitBiultIn({super.key});

  @override
  State<InplicitBiultIn> createState() => _InplicitBiultInState();
}

class _InplicitBiultInState extends State<InplicitBiultIn> {
  double _margin = 0;
  Color _color = Colors.blue;
  double _width = 200;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 800),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: _color,
          margin: EdgeInsets.all(_margin),
          width: _width,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _width = 300),
                child: Text('Animate Width'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _margin = 20),
                child: Text('Animate Margin'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _color = Colors.purple),
                child: Text('Animate Color'),
              ),
               ElevatedButton(
                onPressed: () => setState(() => _opacity = 0),
                child: Text('Animate Opicity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
