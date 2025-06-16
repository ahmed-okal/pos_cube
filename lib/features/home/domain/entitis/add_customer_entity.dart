import '../../../../core/services/use_case.dart';

class AddCustomerEntity extends Param {
  String arName,
      enName,
      // adressName,
      // city,
      // region,
      // street,
      // desc,
      email,
      mobileNumber,
      // buildingNumber,
      // apartmentNumber,
      // zipCode,
      customerType,
      listPriceId,
      tenantId,
      companyId,
      branchId;
  List<String> customerGroupsId;

  List<Map<String, String>> address;
  AddCustomerEntity(
      {required super.loading,
      required this.arName,
      required this.enName,
      // required this.adressName,
      // required this.desc,
      // required this.city,
      // required this.region,
      // required this.street,
      required this.email,
      required this.mobileNumber,
      // required this.apartmentNumber,
      // required this.buildingNumber,
      // required this.zipCode,
      required this.customerType,
      required this.customerGroupsId,
      required this.listPriceId,
      required this.tenantId,
      required this.companyId,
      required this.branchId,
      required this.address});
  Map<String, dynamic> toJson() {
    return {
      "fullname": [
        {
          "text": arName,
          "lang": "ar",
        },
        {
          "text": enName,
          "lang": "en",
        },
      ],
      "customerAddresses": address,
      "customerGroupsIds": customerGroupsId,
      "listPriceId": listPriceId,
      "customerType": customerType,
      "email": email,
      "mobileNo": mobileNumber,
      "tenantId": tenantId,
      "companyId": companyId,
      "branchId": branchId,
    };
  }
}
