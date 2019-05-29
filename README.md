# Flutter Widget Ticket

[![pub package](https://img.shields.io/pub/v/fw_ticket.svg)](https://pub.dartlang.org/packages/fw_ticket)

A new Flutter package project.

![preview](preview.png)

## Getting Started

### Add dependency to pubspec.yaml

```yaml
[...]
dependencies:
  fw_ticket: any
[...]
```

### Install the package using Terminal

```bash
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

### import

```dart
import 'package:fw_ticket/fw_ticket.dart';
```

```dart
new Ticket(
  innerRadius: new BorderRadius(...),
  outerRadius: new BorderRadius(...),
  child: new Container(...),
  boxShadow: [
    new BoxShadow(...)
  ]
)
```

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
