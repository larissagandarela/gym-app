import 'package:flutter/material.dart';
import 'package:gym_app/_core/my_colors.dart';
import 'package:gym_app/components/decoration_authentication.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool wantToEnter = true;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  MyColors.gradientBlueUp,
                  MyColors.gradientBlueDown,
                  ],
              ),
           ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/logo.png", height: 128),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null){
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5){
                            return "O e-mail é muito curto";
                          }
                          if (!value.contains("@")){
                            return "O e-mail não é válido";
                          }
                          if (!value.contains(".com")){
                            return "O e-mail não é válido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: 
                          getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null){
                            return "A senha não pode ser vazio";
                          }
                          if (value.length < 5){
                            return "A senha é muito curto";
                          }
                            return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !wantToEnter,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: 
                                getAuthenticationInputDecoration("Confirme senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null){
                                  return "A confirmação de senha não pode ser vazio";
                                }
                                if (value.length < 5){
                                  return "A confirmação de senha é muito curto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: 
                                getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null){
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5){
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(onPressed: (){
                        bottonPrincipal();
                      },
                      child: Text((wantToEnter) ? "Entrar" : "Cadastrar"),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            wantToEnter = !wantToEnter;
                          });
                        },
                        child: Text((wantToEnter) ? "Crie uma conta" : "Já tem uma conta? Entre!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bottonPrincipal(){
    if (_formKey.currentState!.validate()){
      print("Form válido");
    } else {
      print("Form inválido");
    }
  }
}