import 'package:http/http.dart';

class MessagesUtils {
  static requestBodyExceptionError(
    String message,
    Response response,
    String requestBody,
  ) {
    return "$message"
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}";
  }

  static noRequestBodyExceptionError(String message, Response response) {
    return "$message"
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}";
  }

  static notEmptyFields() {
    return "Preencha todos os campos obrigatórios.";
  }

  static duplicatedBudget() {
    return "Já existe um orçamento cadastrado para a categoria selecinoada.";
  }

  static findAllError(String description) {
    return "Não foi possível carregar a lista de $description.";
  }

  static findByIdError(String description, int id) {
    return "$description não localizado. ID: \"$id\".";
  }

  static postSuccess(String description) {
    return "Cadastro de $description realizado com sucesso.";
  }

  static postError(String description) {
    return "Não foi possível cadastrar $description";
  }

  static putSuccess(String description) {
    return "Alteração de $description realizada com sucesso.";
  }

  static putError(String description) {
    return "Não foi possível alterar $description.";
  }

  static patchSuccess(bool paid) {
    return paid == true
        ? "Pagamento realizado com sucesso."
        : "Pagamento cancelado com sucesso.";
  }

  static patchError(bool paid) {
    return paid == true
        ? "Não foi possível realizar o pagamento."
        : "Não foi possível cancelar o pagamento.";
  }

  static deleteSuccess(String description) {
    return "Exclusão de $description realizada com sucesso.";
  }

  static deleteError(String description) {
    return "Não foi possível excluir $description.";
  }

  static notMatchPassword() {
    return "As senhas não conferem.";
  }

  static noSecurePassword() {
    return "A senha informada não atinge os critérios de segurança desejados.";
  }
}
