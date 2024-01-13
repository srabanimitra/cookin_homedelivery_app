/*import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../../common_widget/round_button.dart';

class OtpView extends StatefulWidget {
  final String verificationId;
  const OtpView({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  bool loading = false;

  final PhoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: PhoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '6 digit code'),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
              title: 'Verify',
              onPressed: () {
                final Credential = PhoneAuthProvider.credential(
                    verificationId: 'verificationId', smsCode: 'smsCode');
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/