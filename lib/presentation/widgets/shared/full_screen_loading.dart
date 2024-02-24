import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getStreamLoading() {
      final message = <String>[
        'Espera un momento!',
        'Aun esta cargando',
        'Ya casi!!',
        'Ten paciencia',
        'Esta demorando mas de lo normal :(',
      ];

      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return message[step];
      }).take(message.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espera por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getStreamLoading(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data);
            },
          ),
        ],
      ),
    );
  }
}
