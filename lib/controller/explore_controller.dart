import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class ExploreController extends GetxController implements GetxService {
  ExploreController();

  int _selectedButton = 0;
  int get selectedButton => _selectedButton;

  void selectButton(int index) {
    _selectedButton = index;
    update();
  }

  int _propertyTypeIndex = 0;
  int get propertyTypeIndex => _propertyTypeIndex;

  void selectPropertyType(int index) {
    _propertyTypeIndex = index;
    update();
  }

  static final List<String> _propertyFor = ['Rent',"Buy"];
  List<String> get propertyFor => _propertyFor;

  static final List<String> _propertyType = ['Apartment',"House","Multi-family","PG","Plot/ Land","Multi Story"];
  List<String> get propertyType => _propertyType;

  int _spaceTypeIndex = 0;
  int get spaceTypeIndex => _spaceTypeIndex;

  void selectSpaceType(int index) {
    _spaceTypeIndex = index;
    update();
  }

  static final List<String> _spaceType = ['1 BHK','2 BHK','3 BHK','4 BHK',];
  List<String> get spaceType => _spaceType;


  int _budgetTypeMin = 0;
  int get budgetTypeMin => _budgetTypeMin;

  void selectBudgetTypeMin(int index) {
    _budgetTypeMin = index;
    update();
  }

  int _budgetTypeMax = 0;
  int get budgetTypeMax => _budgetTypeMax;

  void selectBudgetTypeMax(int index) {
    _budgetTypeMax = index;
    update();
  }

  int _sqfeetmin = 0;
  int get sqftMin => _sqfeetmin;

  void selectsqFtMin(int index) {
    _sqfeetmin = index;
    update();
  }

  int _sqfeetMax = 0;
  int get sqFitMax => _sqfeetMax;

  void selectsqFtMax(int index) {
    _sqfeetMax = index;
    update();
  }


  static final List<String> _budgetTypeList = ['1 BHK','2 BHK','3 BHK','4 BHK',];
  List<String> get budgetTypeList => _budgetTypeList;

  static final List<String> _bathroomTypeList = ['1','2','3','4',];
  List<String> get bathroomTypeList => _bathroomTypeList;

  int _bathroomTypeIndex = 0;
  int get bathroomTypeIndex => _bathroomTypeIndex;

  void selectBathRoomTypeIndex(int index) {
    _bathroomTypeIndex = index;
    update();
  }

  int _otherOptionIndex = 0;
  int get otherOptionIndex => _otherOptionIndex;

  void SelectOptionIndex(int index) {
    _otherOptionIndex = index;
    update();
  }


}