import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/export.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(utilityControllerProvider);
        },
        child: const Icon(Icons.replay),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Utility Page"),
      ),
      body: ref.watch(utilityControllerProvider).when(
            data: (utility) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      ...utility.utilities.map(
                        (e) => InkWell(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (ctx) => WebViewPage(util: e),
                            ),
                          ),
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 30,
                                  child: Text(
                                    e.key.substring(0, 1).toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  e.key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
