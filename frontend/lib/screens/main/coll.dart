import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/router.dart';

class CollPage extends StatefulWidget {
  const CollPage({Key? key}) : super(key: key);

  @override
  State<CollPage> createState() => _CollPageState();
}

class _CollPageState extends State<CollPage> {
  final query = '1234';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () => context.push(
              '${AppRouter.post}?query=$query&from=${AppRouter.coll}?',
            ),
            child: const Text('Go'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
