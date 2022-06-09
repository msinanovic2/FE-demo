import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(
              title: "demo",
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/first': (context) => const MyFirstPage(title: "First"),
        '/second': (context) => const MySecondPage(title: "Second")
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void goToPage(context, route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 200,
              child: ElevatedButton(
                onPressed: () => goToPage(context, '/first'),
                child: const Text("Go to first"),
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(10),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () => goToPage(context, '/second'),
                child: const Text("Go to second"),
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  void goToInitial(context) {
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 34, 49, 255)),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 222, 255, 34)),
            ),
          ],
        ),
      ),
    );
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  int counter = 0;

  void increase() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 100,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 34, 49, 255)),
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 255, 34)),
                ),
              ),
              Positioned(
                  top: 160,
                  left: MediaQuery.of(context).size.width / 2 - 45,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Center(child: Text(counter.toString())),
                  ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
