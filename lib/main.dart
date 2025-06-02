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

// The barcode scanner screen
class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String barcodeRes = 'Please point the camera at a valid barcode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan Your Food',
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: MobileScanner(
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
                  setState(() {
                    barcodeRes = barcodes.first.rawValue!;
                    // The barcode is stored in the variable barcodeRes
                    // TODO: sentbarcode to open food api

                    print('The barcode is: $barcodeRes');
                    // This button goes to the new screen of the app
                    ElevatedButton(
                      child: Text('Evaluate Food'),
                      onPressed:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FoodEvaluationScreen(),
                            ),
                          ),
                    );
                  });
                }
              },
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                'Your barcode: $barcodeRes',
                style: TextStyle(
                  backgroundColor: Colors.lightBlue,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodEvaluationScreen extends StatelessWidget {
  const FoodEvaluationScreen({super.key, barcode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.redAccent, body: Text('barcode')),
    );
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
              const Text('\nChange your diet, change your life...\n\n'),
              // Button for barcode scanner
              ElevatedButton(
                child: const Text('Scan Barcode Via Camera'),
                onPressed: () {
                  print('Scanner button pressed!');
                  // Scan camera/barcode somehow using the phones camera
                  // Navigate to the new screen page
                  /**
                   * 
                   */

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BarcodeScannerScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Scan food label'),
                onPressed: () {},
              ),

              // Button for OCR
            ],
          ),
        ),
      ),
    );
  }
}
