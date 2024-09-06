import 'package:get/get.dart';
import 'package:get_my_properties/data/models/response/search_suggestion_model.dart';
import 'package:get_my_properties/data/repo/search_repo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class PropertySearchController extends GetxController implements GetxService {
  final SearchRepo searchRepo;

  PropertySearchController({required this.searchRepo});


  List<String> propertyPurposeList = ['Buy', 'Rent'];
  String _propertyPurposeId = 'Buy';
  String get propertyPurposeId => _propertyPurposeId;

  void setPropertyPurpose(String val) {
    _propertyPurposeId = val;
    update();
  }


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<SuggestLocality>? _suggestedLocality;
  List<SuggestLocality>? get suggestedLocality => _suggestedLocality;
  List<SuggestLocality>? _suggestedCity;
  List<SuggestLocality>? get suggestedCity => _suggestedCity;
  List<SuggestLocality>? _suggestedType;
  List<SuggestLocality>? get suggestedType => _suggestedType;
  List<SuggestLocality>? _suggestedPurpose;
  List<SuggestLocality>? get suggestedPurpose => _suggestedPurpose;


  var suggestions = <String>[].obs;
  Future<void> fetchSuggestions(String? query) async {
    final fetchedSuggestions = await getSearchSuggestionList(query);
    suggestions.assignAll(fetchedSuggestions);
  }

  Future<List<String>> getSearchSuggestionList(String? query) async {
    final String apiUrl = 'https://dev.invoidea.in/gmp/api/user/property/search/suggestion'; // Replace with your API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode({'query': query}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> typeData = responseData['data']['type'];
        List<dynamic> purposeData = responseData['data']['purpose'];
        List<dynamic> cityData = responseData['data']['city'];
        List<dynamic> localityData = responseData['data']['locality'];

        List<String> suggestions = [];

        for (var type in typeData) {
          for (var purpose in purposeData) {
            for (var city in cityData) {
              for (var locality in localityData) {
                suggestions.add('${type['name']} for ${purpose['name']} in ${locality['name']}');
                suggestions.add('${type['name']} for ${purpose['name']} in ${city['name']}');
              }
            }
          }
        }

        return suggestions;
      } else {
        print("Error in API call: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      print("Error while fetching suggestions: $error");
      return [];
    }
  }
}