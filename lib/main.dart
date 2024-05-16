import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Colors.black,
          secondary: Colors.blueGrey,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'home': (context) => HomePage(
              items: List<String>.generate(
                60,
                (index) => 'Chat $index',
              ),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isObscure = true;
  TextEditingController usr = TextEditingController();
  TextEditingController pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: MediaQuery.of(context).size.width * 0.145,
        ),
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.abc,
                    size: MediaQuery.of(context).size.height * 0.075,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome to Bubble',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem ipsum dolor sit consetetur sadipscing elitr, sed diam.',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/gradiant2.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: usr,
                      style: TextStyle(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        hintStyle: TextStyle(fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: MediaQuery.of(context).size.height * 0.08,
                    child: TextField(
                      style: TextStyle(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      obscureText: _isObscure,
                      controller: pwd,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontFamily: 'Montserrat'),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  if (usr.text.length <= 4) {
                    const snack = SnackBar(
                      content: Text('Username too short.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  } else if (pwd.text.length < 8) {
                    const snack = SnackBar(
                      content: Text('Password too short.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  } else {
                    Navigator.of(context).pushNamed('home');
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blue,
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.62,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                  ),
                ),
                child: const Text(
                  'Login to continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.62,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text(
                        'Continue in with Google',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blueGrey.shade800,
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.62,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                  ),
                ),
                child: const Text(
                  'Create a Bubble Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
