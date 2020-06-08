# Recite mobile

A mobile app for [re-cite](https://recite.netlify.app/) - a website for collecting citations. The app is written in [`flutter`](https://flutter.dev/) using a [`hasura`](https://hasura.io/) `GraphQL` api and auto-generating domain types from `GraphQL` queries.

The website is written with `ReasonML`, `React`, `GraphQL` and can be found on [github](https://github.com/MargaretKrutikova/re-cite).

## Features

This is a work-in-progress, following features are implemented:

- fetching citations by the name of the collection,
- infinite scroll pagination,
- adding citations with automatic refresh via `GraphQL` subscriptions,
- adding authors.

Here is how it looks (the citations are completely made-up, any resemblance with reality is purely accidental):

<div>
  <image alt="citations list" src="./citations_list.jpg" width="300"/>
</div>

To be continued 😅

## Generate GraphQL types

```sh
flutter pub run build_runner build
```

## Build for android

```sh
flutter build appbundle
```

Release bundle will end up at <app dir>/build/app/outputs/bundle/release/app.aab.
