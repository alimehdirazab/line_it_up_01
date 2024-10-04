import 'package:formz/formz.dart';

part 'empty_validator.dart';
part 'invalid_validator.dart';
part 'identical_validator.dart';
part 'invalid_identical_validator.dart';

const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

const String passwordPattern = r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$';
