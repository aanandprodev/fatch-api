# simple_curd_api

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


if Data is Started with List like 

[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  ] 

  [0]    is the solution 


    Future<ModelOne> getUsers() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return ModelOne.fromJson(result[0]);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  
