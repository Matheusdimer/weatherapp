import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Error extends StatelessWidget {
  final String message;
  final VoidCallback callback;

  const Error({Key? key, required this.message, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 40,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              decoration: TextDecoration.none,
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: callback,
            style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
            child: const Text("Tentar novamente"),
          ),
        ],
      ),
    );
  }
}
