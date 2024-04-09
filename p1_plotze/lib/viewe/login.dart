import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  // Controladores dos campos de texto
  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();

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
                            width: currentWidth * 0.25, // largura da imagem
                            height: currentHeight * 0.15, // altura da imagem
                            fit: BoxFit
                                .contain, // ajuste da imagem dentro do espaço disponível
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
                                  return 'Informe um valor';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: currentHeight * 0.05),

                          SizedBox(
                            width: currentWidth * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                border: InputBorder.none,
                                labelText: 'Senha',
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

                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 't4');
                            },
                            child: const Text("Esqueceu a senha"),
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
                                // Chamar os validadores
                                if (formKey.currentState!.validate()) {
                                  // Os campos foram validados com sucesso
                                  Navigator.pushNamed(context, 'shoppingList');
                                }
                              },
                              child: const Text('Log-in',
                                  style: TextStyle(
                                      fontSize:
                                          20)), // tamanho de fonte dinâmico
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
                                // Chamar os validadores
                                if (formKey.currentState!.validate()) {
                                  // Os campos foram validados com sucesso
                                  Navigator.pushNamed(context, 'shoppingList');
                                }
                              },
                              child: const Text('Sign-in',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              // tamanho de fonte dinâmico
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
