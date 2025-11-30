import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color counterPrimaryColor = Color(0xFF673AB7); 
const Color successColor = Color(0xFF4CAF50); 
const Color neutralColor = Color(0xFF2196F3); 
const Color warningColor = Color(0xFFFF9800); 

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  int _colorState = 0; 
  final String _counterKey = 'counter_value';

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Color _getCounterColor() {
    if (_counter == 0) {
      return neutralColor;
    } else if (_colorState == 1) {
      return successColor;
    } else if (_colorState == -1) {
      return warningColor; 
    }
    return counterPrimaryColor; 
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(_counterKey) ?? 0;
      _colorState = _counter == 0 ? 0 : 1; 
    });
  }

  void _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, _counter);
  }

  // Increment Counter
  void _incrementCounter() {
    setState(() {
      _counter++;
      _colorState = 1;
      _saveCounter();
    });
  }

  // Decrement Counter 
  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _colorState = _counter == 0 ? 0 : -1; 
        _saveCounter();
      });
    }
  }

  // Reset Counter 
  void _resetCounter() {
    setState(() {
      _counter = 0;
      _colorState = 0;
      _saveCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterColor = _getCounterColor();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
        backgroundColor: counterPrimaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count Value:',
              style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 40),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 220,
              height: 220,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: counterColor.withOpacity(0.1),
                border: Border.all(color: counterColor, width: 5),
                boxShadow: [
                  BoxShadow(
                    color: counterColor.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w900,
                  color: counterColor,
                ),
                child: Text('$_counter'),
              ),
            ),
            
            const SizedBox(height: 60),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 1. Decrement Button 
                  ActionChip(
                    label: const Text('DECREMENT'),
                    avatar: Icon(
                    Icons.remove,
                    color: _counter == 0 ? Colors.grey : Colors.white,
                    ),
                  onPressed: _counter == 0 ? null : _decrementCounter,
                  backgroundColor: _counter == 0 ? Colors.grey[300] : warningColor,
                  labelStyle: TextStyle(
                  color: _counter == 0 ? Colors.grey[600] : Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),
                ),

                const SizedBox(width: 15), 

                // 2. Reset Button 
                if (_counter != 0)
                  ActionChip(
                    label: const Text('RESET'),
                    avatar: const Icon(Icons.refresh, color: Colors.white),
                    onPressed: _resetCounter,
                    backgroundColor: neutralColor,
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  ),

                if (_counter != 0) const SizedBox(width: 15),

                // 3. Increment Button
                ActionChip(
                  label: const Text('INCREMENT'),
                  avatar: const Icon(Icons.add, color: Colors.white),
                  onPressed: _incrementCounter,
                  backgroundColor: successColor,
                  labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            
            // Persistence Status
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, size: 16, color: Colors.black54),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'The current state is saved locally using SharedPreferences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.normal, color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}