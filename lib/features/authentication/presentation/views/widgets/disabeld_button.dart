import 'package:flutter/material.dart';

class DisabledButton extends StatelessWidget {
  const DisabledButton({super.key, required this.onPress});
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text('إعادة الإرسال'));
  }
}
