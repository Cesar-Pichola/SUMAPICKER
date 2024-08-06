// ignore_for_file: public_member_api_docs

class StoreResponseModel {
  StoreResponseModel({
    required this.stores,
    required this.code,
    required this.indicator,
    required this.message,
  });

  factory StoreResponseModel.fromJson(Map<String, dynamic> json) {
    List<StoreModel> stores = (json['store'] as List)
        .map((storeJson) =>
            StoreModel.fromJson(storeJson as Map<String, dynamic>))
        .toList();

    return StoreResponseModel(
      stores: stores,
      code: json['code'] as int,
      indicator: json['indicator'] as String,
      message: json['message'] as String,
    );
  }
  final List<StoreModel> stores;
  final int code;
  final String indicator;
  final String message;
}

class StoreModel {
  // Cambiado a double

  StoreModel({
    required this.code,
    required this.name,
    // required this.address,
    // required this.phone,
    // required this.image,
    // this.coverage,
    // required this.delivery,
    // required this.pickUp,
    // required this.distance, // Cambiado a double
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      code: json['code'] as int,
      name: json['name'] as String,
      // address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      // phone: PhoneModelStore.fromJson(json['phone'] as Map<String, dynamic>),
      // image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      // coverage: json.containsKey('coverage')
      //     ? CoverageModel.fromJson(json['coverage'] as Map<String, dynamic>)
      //     : null,
      // delivery:
      //     DeliveryModel.fromJson(json['delivery'] as Map<String, dynamic>),
      // pickUp: PickUpModel.fromJson(json['pickUp'] as Map<String, dynamic>),
      // distance: (json['distance'] as num).toDouble(), // Cambiado a double
    );
  }
  final int code;
  final String name;
  // final AddressModel address;
  // final PhoneModelStore phone;
  // final ImageModel image;
  // final CoverageModel? coverage;
  // final DeliveryModel delivery;
  // final PickUpModel pickUp;
  // final double distance;
}

class AddressModel {
  AddressModel({required this.address, required this.coords});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'] as String,
      coords: CoordsModel.fromJson(json['coords'] as Map<String, dynamic>),
    );
  }
  final String address;
  final CoordsModel coords;
}

class CoordsModel {
  CoordsModel({required this.latitude, required this.longitude});

  factory CoordsModel.fromJson(Map<String, dynamic> json) {
    return CoordsModel(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
  final double latitude;
  final double longitude;
}

class PhoneModelStore {
  PhoneModelStore({required this.country, required this.phone});

  factory PhoneModelStore.fromJson(Map<String, dynamic> json) {
    return PhoneModelStore(
      country: CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      phone: json['phone'] as String,
    );
  }
  final CountryModel country;
  final String phone;
}

class CountryModel {
  CountryModel({required this.code});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as int,
    );
  }
  final int code;
}

class ImageModel {
  ImageModel({required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['url'] as String,
    );
  }
  final String url;
}

class CoverageModel {
  CoverageModel({this.zones, required this.distance});

  factory CoverageModel.fromJson(Map<String, dynamic> json) {
    return CoverageModel(
      zones: json.containsKey('zones') ? json['zones'] as String : null,
      distance: json['distance'] as int,
    );
  }
  final String? zones;
  final int distance;
}

class DeliveryModel {
  DeliveryModel({required this.time});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      time: TimeModel.fromJson(json['time'] as Map<String, dynamic>),
    );
  }
  final TimeModel time;
}

class PickUpModel {
  PickUpModel({required this.time});

  factory PickUpModel.fromJson(Map<String, dynamic> json) {
    return PickUpModel(
      time: TimeModel.fromJson(json['time'] as Map<String, dynamic>),
    );
  }
  final TimeModel time;
}

class TimeModel {
  TimeModel({required this.time});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      time: json['time'] as String,
    );
  }
  final String time;
}
