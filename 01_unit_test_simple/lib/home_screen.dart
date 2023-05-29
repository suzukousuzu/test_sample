import 'package:flutter/material.dart';
import 'package:unit_test_simple/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押した回数:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _countUp(),
                  child: Text("増やす"),
                ),
                ElevatedButton(
                  onPressed: () => _countDown(),
                  child: Text("減らす"),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _clear(),
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  _countUp() {
    counter.countUp();
    setState(() {});
  }

  _countDown() {
    counter.countDown();
    setState(() {});
  }

  _clear() {
    counter.clear();
    setState(() {});
  }
}
