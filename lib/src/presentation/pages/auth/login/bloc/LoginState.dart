import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey; // Obligatorio cuando trabajamos con formularios
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingresa un email'),
    this.password = const BlocFormItem(error: 'Ingresa un password'),
    this.formKey
  });

  // Permite cambiar el estado de esta clase
  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    BlocFormItem? email,
    BlocFormItem? password
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [email, password]; // Se especifican las vbles que van a cambiar de estado.
}