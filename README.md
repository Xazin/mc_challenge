# MC Challenge

This project was created as the solution to a coding challenge.

In this case, I chose to limit the amount of external dependencies, 
and only rely on `http` for the requests.

_Note: I left a few todos amongst the code where I felt a note would be handy._

## Getting Started

To run the project run the following commands:
-   `flutter pub get`
-   `flutter run`

## Tests

The tests uses Mockito to generate the mocks. To run the tests you first 
have to run the build runner:
-   `flutter pub run build_runner build --delete-conflicting-outputs`

Once it has finished you can run tests:
-   `flutter test`
