import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:app_autenticador_fechadura/provider/theme_provider.dart';


class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListTileSwitch(
      value: themeProvider.isDarkMode,
      leading: const Icon(
        Icons.nightlight,
        color: Color(0xFF43237D),
      ),
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      switchActiveColor: Color(0xFF43237D),
      switchInactiveColor: Colors.grey,
      switchScale: 0.9,
      switchType: SwitchType.cupertino,
      title: const Text(
        'Modo Escuro',
      ),
    );
  }
}