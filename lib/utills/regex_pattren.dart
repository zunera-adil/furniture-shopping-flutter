/// regular exp for email
const String emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
RegExp emailRegex = RegExp(emailPattern);

/// regular exp for password (for letters and num)
const String letterAndNumber = r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$';

/// regular exp for password (for special characters)
const String specialCharacter = r'^(?=.*?[!@#\$&*~]).{6,}$';
RegExp letterAndNumberRegex = RegExp(letterAndNumber);
RegExp specialCharacterRegex = RegExp(specialCharacter);
