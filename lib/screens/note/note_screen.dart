import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note')),
      body: const Center(child: Text('Note Screen')),
    );
  }
}