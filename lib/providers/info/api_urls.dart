class APIURLs {
  static const String _serverUrl = 'https://jsonplaceholder.typicode.com/';

  static get refreshToken => _serverUrl + '/refreshToken';

  // User URLs [is not Working]
  static get todosUrl => _serverUrl + 'todos/';

  // User URLs [is not Working]
  static get _userUrl => _serverUrl + 'users/';

  static get usersSendVerificationCodeURL => _userUrl + 'sendVerificationCode';
  static get usersVerfiyRegisterCodeURL => _userUrl + 'verfiyRegisterCode';
}
