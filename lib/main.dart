import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/**
 * RESOURCES
 * -------------
 * https://scanbot.io/techblog/flutter-mobile-scanner-tutorial/ --> for camera scanner
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(home: MainApp());
  }
}




// The landing-page/homescreen
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,

          title: const Text('DIETMANAGER.ai'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          height: 50,

          child: Text(
            'Coded by Brandon Douglas 2025',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('\nChange your diet, change your life.'),
              Text('Point camera at the food label and let the app do the work!', textAlign: TextAlign.center,),
              // Button for barcode scanner
              ElevatedButton(
                child: const Text('Scan Food Label'),
                onPressed: () {
                  print('Scanner button pressed!');
                  // Scan camera/barcode somehow using the phones camera
                  // Navigate to the new screen page
                  /**
                   * 
                   */

                
                },
              ),
            

              // Button for OCR
            ],
          ),
        ),
      ),
    );
  }
}
