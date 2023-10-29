import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedTabIndex = 0;
  void logout() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wassermenschen'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              indicatorColor: Theme.of(context).colorScheme.inversePrimary,
              labelColor: Theme.of(context).colorScheme.inversePrimary,
              unselectedLabelColor: Theme.of(context).colorScheme.background,
              tabs: [
                const Tab(text: 'Aktuelle Kurs'),
                Tab(text: 'Massage ($_anzahlUngeleseneNachrichten ungeöffnet)'),
                const Tab(text: 'Profile'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildDateView(),
            _buildMassageListe(),
            _buildProfilePage_(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateView() {
    // Dummy-Daten für die Termine
    final List<Map<String, dynamic>> termine = [
      {
        'name': 'Lina',
        'termine': ['10. Nov 2023', '17. Nov 2023', '24. Nov 2023'],
        'farbe': Colors.green
      },
      {
        'name': 'Ziad',
        'termine': ['11. Nov 2023', '18. Nov 2023', '25. Nov 2023'],
        'farbe': Colors.blue
      },
    ];

    // Umwandeln der Termine in eine flache Liste von Maps
    final List<Map<String, dynamic>> flacheTermine = [];
    for (var kind in termine) {
      for (var termin in kind['termine']) {
        flacheTermine.add({
          'name': kind['name'],
          'termin': termin,
          'farbe': kind['farbe'],
        });
      }
    }

    // Sortieren der Termine
    flacheTermine.sort((a, b) => a['termin'].compareTo(b['termin']));

    return ListView.builder(
      itemCount: flacheTermine.length,
      itemBuilder: (context, index) {
        final terminItem = flacheTermine[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: terminItem['farbe'],
              child: Text(
                terminItem['name'][0], // Erster Buchstabe des Namens
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              terminItem['name'],
              style: TextStyle(color: terminItem['farbe']),
            ),
            subtitle: Text(terminItem['termin']),
          ),
        );
      },
    );
  }

  Widget _buildProfilePage() {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 50.0, color: Colors.grey[700]),
        ),
        const SizedBox(height: 10.0),
        const Text('Name: Max'),
        const Text('Vorname: Mustermann'),
        const Text('Adresse: Musterstraße 123, 12345 Musterstadt'),
        const Text('Telefonnummer: +49 123 4567890'),
        const Text('E-Mail: max.mustermann@example.com'),
        SizedBox(height: 20.0),
        Text('Kinder:', style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView(
            children: [
              ListTile(title: Text('Anna Mustermann')),
              ListTile(title: Text('Lukas Mustermann')),
            ],
          ),
        ),
      ],
    );
  }

  int _anzahlUngeleseneNachrichten = 0;

  Widget _buildMassageListe() {
    // Dummy-Daten für die Nachrichten
    final List<Map<String, dynamic>> nachrichten = [
      {
        'absender': 'Lehrer 1',
        'nachricht': 'Neues Update zum Kurs.',
        'gelesen': false,
      },
      {
        'absender': 'Lehrer 2',
        'nachricht': 'Erinnerung an die Hausaufgaben.',
        'gelesen': true,
      },
      {
        'absender': 'Lehrer 3',
        'nachricht': 'Infos zur nächsten Klasse.',
        'gelesen': false,
      },
    ];

    // Zählen der ungelesenen Nachrichten
    _anzahlUngeleseneNachrichten = nachrichten.where((n) => !n['gelesen']).length;

    return ListView.builder(
      itemCount: nachrichten.length,
      itemBuilder: (context, index) {
        final nachricht = nachrichten[index];
        return ListTile(
          leading: Icon(
            nachricht['gelesen'] ? Icons.mail_outline : Icons.mail,
            color: nachricht['gelesen'] ? Colors.grey : Theme.of(context).primaryColor,
          ),
          title: Text(nachricht['absender']),
          subtitle: Text(nachricht['nachricht']),
          onTap: () {
            // Aktion beim Tippen auf eine Nachricht
          },
        );
      },
    );
  }


  Widget _buildMursListe() {
    // Dummy-Daten
    List<Map<String, dynamic>> kurse = [
      {'name': 'Kurs 1', 'status': 'bestanden'},
      {'name': 'Kurs 2', 'status': 'nicht bestanden'},
      {'name': 'Kurs 3', 'status': 'teilbestanden'},
      {'name': 'Kurs 4', 'status': 'bestanden'},
      // Weitere Dummy-Daten können hier hinzugefügt werden...
    ];

    return ListView.builder(
      itemCount: kurse.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.circle,
            color: _getIconColor(kurse[index]['status']),
          ),
          title: Text(kurse[index]['name']),
          subtitle: Text(kurse[index]['status']),
        );
      },
    );
  }

  Color _getIconColor(String status) {
    switch (status) {
      case 'bestanden':
        return Colors.green;
      case 'nicht bestanden':
        return Colors.red;
      case 'teilbestanden':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}

class EntwicklungsSchritt {
  String titel;
  String beschreibung;
  bool abgeschlossen;

  EntwicklungsSchritt({required this.titel, required this.beschreibung, this.abgeschlossen = false});
}

class KindEntwicklung {
  String name;
  List<EntwicklungsSchritt> schritte;

  KindEntwicklung({required this.name, required this.schritte});
}

Widget _buildProfilePage_() {
  // Liste von Kindern und ihren Entwicklungsschritten
  List<KindEntwicklung> kinderEntwicklung = [
    KindEntwicklung(
      name: 'Lina',
      schritte: [
        EntwicklungsSchritt(titel: 'Schwimmstufe 1', beschreibung: 'Grundlagen des Schwimmens', abgeschlossen: true),
        EntwicklungsSchritt(titel: 'Schwimmstufe 2', beschreibung: 'Fortgeschrittene Techniken', abgeschlossen: false),
        // Fügen Sie hier weitere Schritte hinzu
      ],
    ),
    KindEntwicklung(
      name: 'Ziad',
      schritte: [
        EntwicklungsSchritt(titel: 'Schwimmstufe 1', beschreibung: 'Grundlagen des Schwimmens', abgeschlossen: true),
        EntwicklungsSchritt(titel: 'Schwimmstufe 2', beschreibung: 'Tauchen lernen', abgeschlossen: true),
        // Fügen Sie hier weitere Schritte hinzu
      ],
    ),
    // Fügen Sie hier weitere Kinder hinzu
  ];

  return ListView.builder(
    itemCount: kinderEntwicklung.length,
    itemBuilder: (context, index) {
      final kind = kinderEntwicklung[index];

      // Bestimme den aktuellen Schritt
      int aktuellerSchritt = kind.schritte.indexWhere((s) => !s.abgeschlossen);
      // Stelle sicher, dass aktuellerSchritt innerhalb des gültigen Bereichs bleibt
      if (aktuellerSchritt < 0 || aktuellerSchritt >= kind.schritte.length) {
        aktuellerSchritt = max(0, kind.schritte.length - 1);
      }

      return Card(
        margin: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(kind.name),
          children: [
            Stepper(
              physics: const ClampingScrollPhysics(),
              steps: kind.schritte.map((schritt) {
                return Step(
                  title: Text(schritt.titel),
                  content: Text(schritt.beschreibung),
                  state: schritt.abgeschlossen ? StepState.complete : StepState.indexed,
                  isActive: schritt.abgeschlossen,
                );
              }).toList(),
              currentStep: aktuellerSchritt,
            ),
          ],
        ),
      );
    },
  );
}

