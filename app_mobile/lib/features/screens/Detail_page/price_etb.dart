import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Booking/Booking_page.dart';
import 'package:myevent/features/screens/Login/components/login_screen.dart';
import 'package:myevent/features/screens/Signup/signup_screen.dart';
import 'package:provider/provider.dart';

import '../../../models/etablissement.dart';
import '../../../provider/customer_provider.dart';

class PriceEtb extends StatelessWidget {
  const PriceEtb(this.etb);
  final Etablissement etb;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.3, 0),
            child: Container(
              width: 120,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  etb.prix.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text("€",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ]),
            ),
          ),
          Align(
            alignment: const Alignment(0.3, 0),
            child: Container(
              height: double.maxFinite,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<CustomerProvider>(context, listen: false)
                                  .customer
                                  .token
                                  .isNotEmpty
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingPage(
                                            etb: etb,
                                          )),
                                )
                              : AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.topSlide,
                                  showCloseIcon: true,
                                  title: "Warning",
                                  desc:
                                      "Pour reserver veuillez vous connecter ou créer un compte",
                                  btnOk: ElevatedButton(
                                    child: const Text("Sign In"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    },
                                  ),
                                  btnCancel: ElevatedButton(
                                    child: const Text("Sign Up"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen()),
                                      );
                                    },
                                  ),
                                ).show();
                        },
                        child: const Text(
                          "Book",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
