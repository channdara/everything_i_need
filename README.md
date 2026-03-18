# Initialize

Wrap your app initial point with `EinWrapperWidget` to ensure some functionality work accordingly. Also
`EinWrapperWidget` provide you some possibility to override some default widget or behavior too. The application initial
point always the one that appears at the `runApp()` function, see example below.

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget(context: context, child: const MaterialApp());
  }
}
```

# Sub-Dependencies

We have use multiple dependencies inside this core plugin and also expose those plugin to user too.

```yaml
dependencies:
  collection: ^1.19.1
  dio: ^5.9.2
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1
  flutter_localization: ^0.3.3
  intl: ^0.20.2
  pretty_dio_logger: ^1.4.0
```