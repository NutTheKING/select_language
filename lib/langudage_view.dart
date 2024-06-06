import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale currentLocale = context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'language',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ).tr(),
        ListTile(
          leading: _icons('assets/image/english_flag.jpg'),
          title: const Text('english').tr(),
          trailing: _buildSelectedIndicator(
            currentLocale,
            const Locale('en', 'US'),
          ),
          onTap: () {
            context.setLocale(const Locale('en', 'US'));
            context.pop(context);
          },
        ),
        ListTile(
          title: const Text('ភាសាខ្មែរ').tr(),
          leading: _icons('assets/image/cambodia_flag.jpg'),
          trailing: _buildSelectedIndicator(
            currentLocale,
            const Locale('km', 'KH'),
          ),
          onTap: () {
            context.setLocale(
              const Locale('km', 'KH'),
            );
            context.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildSelectedIndicator(Locale currentLocale, Locale targetLocale) {
    if (currentLocale == targetLocale) {
      return CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 8,
        child: Container(
          padding: const EdgeInsets.all(2),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 8,
        child: Container(
          padding: const EdgeInsets.all(2),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
      );
    }
  }

  Widget _icons(String? img) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: SizedBox(
          width: 35, // Set width and height to twice the radius
          height: 35,
          child: Image.asset(
            img ?? "",
            fit: BoxFit.cover, // Adjust the fit property as needed
          ),
        ),
      ),
    );
  }
}
