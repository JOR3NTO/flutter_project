import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/base_view.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _running = false;

  void _start() {
    if (_timer != null) return;
    setState(() => _running = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _seconds++);
    });
  }

  void _pause() {
    _timer?.cancel();
    _timer = null;
    setState(() => _running = false);
  }

  void _resume() {
    if (_timer != null) return;
    setState(() => _running = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _seconds++);
    });
  }

  void _reset() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _seconds = 0;
      _running = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Cronómetro con Timer',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_seconds}s',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: _running ? null : _start,
                  child: const Text('Iniciar'),
                ),
                ElevatedButton(
                  onPressed: _running ? _pause : null,
                  child: const Text('Pausar'),
                ),
                ElevatedButton(
                  onPressed: !_running && _seconds > 0 ? _resume : null,
                  child: const Text('Reanudar'),
                ),
                ElevatedButton(
                  onPressed: _seconds > 0 ? _reset : null,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
