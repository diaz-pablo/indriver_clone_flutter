import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ] 
            )
          ),
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Horizontal
            mainAxisAlignment: MainAxisAlignment.center, // Vertical
            children: [
              _textLoginRotated(context),
              SizedBox(height: 100),
              _textRegisterRotated(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ]
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 35),
          decoration: BoxDecoration(
            // color: Color.fromARGB(255, 24, 181, 254), // Si se define decoration, se debe poner el color dentro de aqui
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 189, 189, 189),
                Color.fromARGB(255, 245, 245, 245),
              ]
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomLeft: Radius.circular(35))
          ),
          child: Stack(
            children: [
              _imageBackground(context),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _imageBanner(),
                    DefaultTextFieldOutlined(
                      text: 'Nombre', 
                      icon: Icons.person_outline,
                      margin: EdgeInsets.only(left: 50, right: 50, top: 50),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Apellido', 
                      icon: Icons.person_2_outlined,
                      margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Email', 
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Contraseña', 
                      icon: Icons.lock_outlined,
                      margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Repetir contraseña', 
                      icon: Icons.lock_outlined,
                      margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    ),
                    DefaultButton(
                      text: 'Crear usuario',
                      margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                    ),
                    SizedBox(height: 25),
                    _separatorOr(),
                    SizedBox(height: 10),
                    _textAlreadyHaveAccount(context),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,  
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.1),  
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/trip.png',
        width: 180,
        height: 180,
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Log In',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.grey[900],
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 17,
          ),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.grey[900],
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _textAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 16,
          ),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'login'),
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}