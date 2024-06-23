// ignore_for_file: constant_identifier_names

class UserEndpoint {
  static String getEndpoint(
    UserEndpointEnum endpoint, {
    String? id,
  }) {
    return switch (endpoint) {
      UserEndpointEnum.GET_USER_BY_ID => '/users/$id',
      UserEndpointEnum.GET_USER_LIST => '/users',
    };
  }
}

enum UserEndpointEnum {
  GET_USER_BY_ID,
  GET_USER_LIST,
}
