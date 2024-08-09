// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:core/core.dart';

class OrderEntity {
  final String code;
  final int status;
  final String date;
  final Client client;
  final Receptor receptor;
  final Billing billing;
  OrderEntity({
    required this.code,
    required this.status,
    required this.date,
    required this.client,
    required this.receptor,
    required this.billing,
  });

  factory OrderEntity.fromModel(OrderItem model) {
    return OrderEntity(
      code: model.code,
      status: model.status,
      date: model.date,
      client: Client.fromModel(model.client),
      receptor: Receptor.fromModel(model.receptor),
      billing: Billing.fromModel(model.billing),
    );
  }
}

class Client {
  final int code;
  final String name;
  Client({required this.code, required this.name});

  factory Client.fromModel(ClientOrder model) {
    return Client(code: model.code, name: model.name);
  }
}

class Receptor {
  final String prefix;
  final String phone;
  Receptor({required this.prefix, required this.phone});

  factory Receptor.fromModel(ReceptorOrder model) {
    return Receptor(phone: model.phone, prefix: model.prefix);
  }
}

class Billing {
  final String nit;
  Billing({required this.nit});

  factory Billing.fromModel(BillingOrder model) {
    return Billing(nit: model.nit);
  }
}
