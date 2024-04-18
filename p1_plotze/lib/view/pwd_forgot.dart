import 'package:flutter/material.dart';

class PasswordRecover extends StatefulWidget {
  const PasswordRecover({Key? key});

  @override
  State<PasswordRecover> createState() => _PasswordRecoverState();
}

class _PasswordRecoverState extends State<PasswordRecover> {
  final formKey = GlobalKey<FormState>();

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                            'images/reset-password.png',
                            width: currentWidth * 0.3,
                            height: currentHeight * 0.3,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: currentHeight * 0.05),
                          const Text(
                            "Confirme seu email para continuar.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: currentHeight * 0.05),
                          SizedBox(
                            width: currentWidth * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                border: InputBorder.none,
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Informe um valor';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: currentHeight * 0.1),
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
                                  Navigator.pushNamed(context, 'email_enviado');
                                }
                              },
                              child: const Text('Confirmar',
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
