import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../widgets/top_up_sheet.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  String selectedProvider = 'Keremet Bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Толтыру"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ақша аудару",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            PaymentProvider(
              image: "assets/keremet_bank.jpg",
              name: "Keremet bank",
              account: "**** **** **** 8426",
              isSelected: selectedProvider == 'Keremet Bank',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Keremet Bank';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/kb.png",
              name: "Keremet Bank",
              account: "**** **** **** 1785",
              isSelected: selectedProvider == 'Keremet bank',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Keremet Bank';
                  });
                }
              },
            ),
            const Text(
              "Басқа",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            PaymentProvider(
              image: "assets/paypal.jpg",
              name: "Paypal",
              account: "Төлем",
              isSelected: selectedProvider == 'Paypal',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Paypal';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/apple.png",
              name: "Apple pay",
              account: "Төлем",
              isSelected: selectedProvider == 'Apple pay',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Apple pay';
                  });
                }
              },
            ),
            PaymentProvider(
              image: "assets/google.png",
              name: "Google pay",
              account: "Төлем",
              isSelected: selectedProvider == 'Google pay',
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    selectedProvider = 'Google pay';
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    )
                  ),
                  builder: (context) =>  TopUpBottomSheet(
                    selectedProvider: selectedProvider,
                    image: getImageForProvider(selectedProvider),
                    account:getAccountForProvider(selectedProvider)
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text(
                "Растау",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getAccountForProvider(String provider) {
    switch (provider) {
      case 'Keremet Bank':
        return '**** **** **** 1785';
      case 'Keremet Bank':
        return '**** **** **** 8426';
      default:
        return 'Төлем';
    }
  }

  String getImageForProvider(String provider) {
    switch (provider) {
      case 'Keremet Bank':
        return 'assets/keremet_bank.jpg';
      case 'keremet Bank':
        return 'assets/kb.png';
      case 'Paypal':
        return 'assets/paypal.jpg';
      case 'Apple pay':
        return 'assets/apple.png';
      case 'Google pay':
        return 'assets/google.png';
      default:
        return 'assets/default.png';
    }
  }
}

class PaymentProvider extends StatelessWidget {
  const PaymentProvider(
      {super.key,
      required this.image,
      required this.name,
      required this.account,
      required this.isSelected,
      required this.onChanged});

  final String image;
  final String name;
  final String account;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.white,
          ),
          title: Text(name),
          subtitle: Text(account),
          trailing: Transform.scale(
            scale: 1.5,
            child: Radio.adaptive(
              value: true,
              groupValue: isSelected,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 39, 173, 95),
            ),
          ),
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.black12,
              )),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
