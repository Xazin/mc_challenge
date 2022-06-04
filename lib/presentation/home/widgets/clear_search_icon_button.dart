import 'package:flutter/material.dart';

class ClearSearchIconButton extends StatelessWidget {
  final TextEditingController textController;

  const ClearSearchIconButton({Key? key, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Clear search',
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => textController.clear(),
        child: const Icon(Icons.clear),
      ),
    );
  }
}
