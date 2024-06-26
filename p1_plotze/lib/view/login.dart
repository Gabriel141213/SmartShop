import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                          // Imagens
                          Image.asset(
                            'images/logo3.png',
                            width: currentWidth * 0.25,
                            height: currentHeight * 0.15,
                            fit: BoxFit.contain,
                          ),
                          const Text.rich(TextSpan(
                              style: TextStyle(
                                fontSize: 30,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Smart',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 71, 170, 228),
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: 'Shop',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 247, 234, 63),
                                    )),
                              ])),
                          SizedBox(height: currentHeight * 0.05),

                          // Campo de texto
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
                                  return 'Informe um e-mail';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: currentHeight * 0.05),

                          SizedBox(
                            width: currentWidth * 0.8,
                            child: TextFormField(
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                border: InputBorder.none,
                                labelText: 'Senha',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Informe a senha';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: currentHeight * 0.01,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'recuperacao_senha');
                            },
                            child: const Text("Esqueceu a senha?"),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'sobre');
                            },
                            child: const Text("Sobre o app"),
                          ),

                          SizedBox(height: currentHeight * 0.05),

                          // Botões
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
                                  Navigator.pushNamed(context, 'shoppingList');
                                }
                              },
                              child: const Text('Log-in',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),

                          SizedBox(height: currentHeight * 0.01),

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
                                Navigator.pushNamed(context, 'cadastro');
                              },
                              child: const Text('Sign-up',
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
