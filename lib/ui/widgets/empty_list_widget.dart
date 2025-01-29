import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'lib/assets/empty_list_second.json',
            height: 500,
            width: 500,
            fit: BoxFit.scaleDown,
          ),
          const Text(
            "Todo list Empty!",
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ],
        
      ),
    );
  }
}
