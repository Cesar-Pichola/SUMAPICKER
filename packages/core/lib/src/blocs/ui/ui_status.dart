// ignore_for_file: public_member_api_docs

abstract class UIStatus {
  const UIStatus(); // Agregar constructor const para clases de estado.
}

class UIInitial extends UIStatus {
  const UIInitial(); // Const constructor para inmutabilidad.
}

class UILoading extends UIStatus {
  const UILoading(); // Const constructor para inmutabilidad.
}

class UISuccess extends UIStatus {
  const UISuccess(); // Const constructor para inmutabilidad.
}

class UIError extends UIStatus {
  const UIError({required this.message});
  final String message;
}
