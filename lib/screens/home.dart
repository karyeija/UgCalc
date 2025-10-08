import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ugcalc/screens/utils/functionality.dart';
import 'package:ugcalc/screens/utils/numberformat.dart';
import 'package:ugcalc/widgets/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key /* required this.title */});
  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NumberFormat fd = NumberFormat.decimalPattern();
  NumberFormat fr = NumberFormat.decimalPatternDigits();

  @override
  Widget build(BuildContext context) {
    // var formater = NumberFormat('#,###.0');
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            TextFormField(
              maxLines: 4,
              controller: Functionality.input,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(border: OutlineInputBorder()),
              style: TextStyle(fontSize: 263),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                safeFormatInput(Functionality.input.text),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              children: Buttons.allButtons
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Buttons.evalButton.contains(e)
                                  ? screenWidth * 0.02
                                  : screenWidth * 0.1,
                            ),
                          ),
                          fixedSize: Buttons.evalButton.contains(e)
                              ? Size(screenWidth * 0.4, 80)
                              : Size(screenWidth * 0.2, 80),
                          backgroundColor: Buttons.topRowButtons.contains(e)
                              ? Colors.black
                              : Buttons.digitButtons.contains(e)
                              ? const Color.fromARGB(255, 233, 143, 7)
                              : Buttons.evalButton.contains(e)
                              ? Colors.blue[900]
                              : Buttons.bottomRowButtons.contains(e)
                              ? Colors.pink
                              : Colors.green,
                        ),
                        onPressed: () {
                          Functionality.appendInput(e, setState);
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 30,
                            color: Buttons.delButton.contains(e)
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
