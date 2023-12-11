import 'package:flutter/material.dart';
import 'MyBookHomePage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80, top: 160, bottom: 80),
              child: Image.asset('assets/whyfish.jpg', width: 200,),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('빠르게 배달되는 책 배달 서비스',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black87,
            ),),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
            return const MyBookHomePage();
            },
            ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text("Get Stared", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
