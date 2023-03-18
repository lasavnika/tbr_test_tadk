import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_task_flutter/second_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? countryController;
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(147, 167, 245, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 40.0),
            child: Row(
              children: const [
                Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: IntlPhoneField(
              keyboardType: TextInputType.number,
              flagsButtonMargin: const EdgeInsets.all(10),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(186, 199, 249, 0.7),
                hintText: "Your phone number",
                labelStyle: const TextStyle(fontSize: 9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: 'UA',
              showDropdownIcon: false,
              onChanged: (phone) {
                setState(() {
                  isPhoneValid = phone.completeNumber.isNotEmpty;
                });
              },
              // inputFormatters: [
              //   MaskTextInputFormatter(
              //     mask: '(##) ###-##-##',
              //filter: {"#": RegExp(r'[0-9]')},
              // )
              // ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: isPhoneValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondScreen()),
                          );
                        }
                      : null,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
