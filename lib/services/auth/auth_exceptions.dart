//login exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPassAuthException implements Exception {}

//register exceptions
class WeakPasswordException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
