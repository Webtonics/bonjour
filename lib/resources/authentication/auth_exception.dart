//login exception
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//register exception

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyinUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class MissingPasswordAuthException implements Exception {}

//generic Exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
