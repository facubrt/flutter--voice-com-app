import 'package:flutter/material.dart';
import 'package:voicecom/core/constants/constants.dart';
import 'package:voicecom/src/communication/presentation/views/pages/communication_page.dart';

class VoiceCOM extends StatelessWidget {
  const VoiceCOM({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CommunicationPage()
    );
  }
}