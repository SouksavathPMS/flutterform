import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.inversePrimary),
      ),
      onPressed: () => onPressed(),
      child: Text(
        "Submit".toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
