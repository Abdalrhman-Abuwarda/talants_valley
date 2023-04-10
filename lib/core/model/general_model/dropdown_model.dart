import 'package:country_phone_code_picker/constants/country_codes.dart';

class DropdownModel{
   final List<String> countriesName = countries.map((country) => country.name).toList();
   final List<String> idDocumentType = ['passport', 'driving_license', 'national_id'];
   final List<String> addressDocumentType = ['water_bill', 'phone_bill', 'bank_statement', 'electricity_bill', 'other'];
}