import 'package:flutter/material.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({Key? key}) : super(key: key);

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Widget Screen',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.red),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_rounded)),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Column', style: TextStyle(fontSize: 30)),

            const SizedBox(height: 10),
            Container(
              color: const Color(0xfff38989),
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: someFunction,
                onLongPress: () {},
                child: const Text('Submit')),

            // SizedBox(height: 10),

            Container(
              color: Colors.blue,
              margin: const EdgeInsets.all(30),
              child: TextButton(
                  onPressed: () {}, child: const Text('Text Button')),
            ),

            SizedBox(
              width: 200,
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // align left
                  children: [
                    const Text("Row Widget"),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                          color: Colors.cyan,
                          child: const Text("Hello World!")),
                    ),
                  ],
                ),
              ),
            ),
            // Placeholder()

            const SizedBox(height: 10),

            // Image Widget with asset's image
            // For using network image: Image.network('url')
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Align(
                  alignment: const Alignment(0.5, -0.5),
                  child: Image.asset(
                    'assets/bird.jpg',
                  ),
                ),
              ),
            ),

            // Textfield with outline
            const TextField(
              decoration: InputDecoration(
                  //You can also use UnderlineInputBorder() class
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  labelText: 'Enter your username',
                  labelStyle: TextStyle(
                      color: Colors.cyan, fontSize: 20, letterSpacing: 10)),
            ),

            const SizedBox(height: 10),

            // Textfield with outline
            const TextField(
              decoration: InputDecoration(
                //You can also use UnderlineInputBorder() class
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                labelText: 'Enter your username',
              ),
            )
          ],
        ),
      ),
    );
  }

  someFunction() {
    print('Button Pressed!');
  }
}
