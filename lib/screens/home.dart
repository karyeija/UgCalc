import 'package:flutter/material.dart';
import 'package:ugcalc/widgets/buttons.dart';
import 'package:ugcalc/widgets/custom_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  children: [
                    TextField(
                      // maxLines: 5,
                      // controller: calController,
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300], // light gray background
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300], // light gray background
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                        itemCount: Buttons.allButtons.length,
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                  itemCount: Buttons.allButtons.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            Buttons.allButtons[index],
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: customButton(
      //   onpress: _anyFunc,
      //   icon: Icons.abc,
      //   // onpress:
      // ),
    );
  }
}
