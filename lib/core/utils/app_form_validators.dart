class AppFormValidators {
  const AppFormValidators._();

  static String? validateId(String? value) {
    final int? id = int.tryParse(value ?? '');
    //regx to check if the input is a number
    final RegExp regExp = RegExp(r'^[0-9]+$');

    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (id == null) {
      return 'Please enter a valid id (e.g. 1)';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid id (e.g. 1)';
    }
    return null;
  }
}
