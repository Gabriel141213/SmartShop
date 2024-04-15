import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final formKey = GlobalKey<FormState>();

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Sobre o app"),
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
                            'images/about.png',
                            width: currentWidth * 0.4,
                            height: currentHeight * 0.4,
                            fit: BoxFit.contain,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                            child: Text(
                              "Bem-vindo ao nosso aplicativo de lista de compras! Com um layout moderno, combinando tons de azul e amarelo,"
                              "nosso objetivo é simplificar sua organização de compras diárias."
                              "Desenvolvido por Gabriel da Silva Assunção, estamos aqui para tornar suas compras mais fáceis e eficientes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
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
