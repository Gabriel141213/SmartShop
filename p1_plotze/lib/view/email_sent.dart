import 'package:flutter/material.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({Key? key});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  final formKey = GlobalKey<FormState>();

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Recuperação de senha"),
          backgroundColor: const Color.fromARGB(255, 75, 197, 245),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 25, 178, 238),
              Color.fromARGB(255, 247, 250, 75)
            ],
          )),
          child: Center(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final currentWidth = constraints.maxWidth;
                final currentHeight = constraints.maxHeight;

                var horizontalPadding = currentWidth * 0.03;
                var verticalPadding = currentHeight * 0.03;

                return Padding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding,
                      verticalPadding, horizontalPadding, verticalPadding),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/feito.png',
                            width: currentWidth * 0.5,
                            height: currentHeight * 0.5,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            "Enviamos um link para o e-mail informado. \n Cheque sua caixa de entrada!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: currentHeight * 0.05),
                          SizedBox(
                            width: currentWidth < 700
                                ? currentWidth * 0.5
                                : currentWidth * 0.2,
                            height: currentHeight > 700
                                ? currentHeight * 0.04
                                : currentHeight * 0.08,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                                foregroundColor: Colors.grey.shade700,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, 'login');
                                }
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
