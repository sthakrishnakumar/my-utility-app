import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Utility Page"),
      ),
      body: const Column(
        children: [
          Card(
            child: ListTile(
              title: Text("HRIS"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Work Report"),
            ),
          ),
        ],
      ),
    );
  }
}
