import 'package:flutter/material.dart';
import 'package:qouteapp/quotes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Quotes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _changeQuote(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final quote = Quote.quotes[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () {
                _changeQuote(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sports'),
              onTap: () {
                _changeQuote(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Inspirational"),
              onTap: () {
                _changeQuote(2);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => _changeQuote((_currentIndex + 1) % Quote.quotes.length),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                quote.text,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              Text(
                quote.author,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
