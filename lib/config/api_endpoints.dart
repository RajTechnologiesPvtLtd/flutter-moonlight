class ApiEndpoint {
  // Server Links
  // static const baseUrl = '';
  static const baseUrl = 'http://10.0.2.2:8000';
  static const api = '$baseUrl/api/';
  static const login = '${api}login';
  static const loadMoreUrl = 'https://jsonplaceholder.typicode.com/posts';

  static const commanHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}
