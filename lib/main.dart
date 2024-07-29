import 'package:flutter/material.dart';
import 'package:groceries_app/config/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeConfig.primaryColor),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(),
          bodyMedium: GoogleFonts.poppins(),
          labelLarge: GoogleFonts.poppins(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
