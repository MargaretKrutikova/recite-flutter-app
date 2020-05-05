# recite_flutter

A new Flutter project.

## Generate GraphQL types

```sh
flutter pub run build_runner build
```

## Build for android

flutter build appbundle

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generating GraphQL types

[Artemis](https://github.com/comigor/artemis) is used for generating types based on the GraphQL schema. Run the following command after adding new queries or mutations:

```sh
flutter pub run build_runner build
```
