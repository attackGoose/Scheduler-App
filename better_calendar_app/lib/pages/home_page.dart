import 'package:flutter/material.dart';

//this is th starting screen. "Hello" at the top
//and "Home" on the appbar
// below are 3 buttons listed in vertical or
//slightly zigzag order or tilted order

//this should be used to navigate between the pages


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
//https://blog.logrocket.com/creating-multi-page-app-flutter/
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text("Calendar Page"),
          ),
      ),
      bottomNavigationBar: BottomAppBar(),);
  }
  
}
//note to self, tomorrow, try to think from scratch what I want this to look like
//and try to think about pieceing all these parts together in a different way from the way I'm doing it now
//try to piece these things together in a different way than I'm doing right now.



// i have so many resources opened at this point i feel like my pc is going to crash
// 