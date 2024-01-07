import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../common_widget/round_button.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  bool isOtpConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              const Text(
                "We have sent an OTP to your mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "please check your mobile number 071******12\n to  reset your password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                  key: _otpPinFieldController, onChange: (String text) {},
                  onSubmit: (String text) {},
                  // ... Your existing OTP field configuration ...
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        // Verify OTP and set isOtpConfirmed to true if verified
                        // For example: if (_otpPinFieldController.currentState?.getOtp() == '1234')
                        setState(() {
                          isOtpConfirmed = true;
                        });
                      },
                      child: Text('Verify OTP'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        // Resend OTP functionality
                      },
                      child: Text('Resend OTP'),
                    ),
                  ),
                ],
              ),
              if (isOtpConfirmed)
                Column(
                  children: [
                    // Add your OTP confirmation UI here
                    // For example:
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'OTP Confirmed!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RoundButton(
                      title: "Next",
                      onPressed: () {
                        // Navigate to the next screen or perform an action
                      },
                    ),
                  ],
                ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  // Handle didn't receive OTP action
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't Received an OTP?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
