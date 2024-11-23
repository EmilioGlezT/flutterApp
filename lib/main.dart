import 'package:flutter/material.dart';

// Pantalla de Inicio
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          child: Text('Crear perfil'),
          onPressed: () {
            // Navegar a la pantalla de crear perfil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateProfileScreen()),
            );
          },
        ),
      ),
    );
  }
}

// Pantalla de Crear Perfil
class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  // Controladores de texto para los TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            TextField(
              controller: _occupationController,
              decoration: InputDecoration(labelText: 'Ocupación'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Guardar y Ver Perfil'),
              onPressed: () {
                // Navegar a la pantalla de perfil y pasar los datos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      name: _nameController.text,
                      age: _ageController.text,
                      occupation: _occupationController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de Perfil
class ProfileScreen extends StatelessWidget {
  final String name;
  final String age;
  final String occupation;

  ProfileScreen({
    required this.name,
    required this.age,
    required this.occupation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: $name', style: TextStyle(fontSize: 18)),
            Text('Edad: $age', style: TextStyle(fontSize: 18)),
            Text('Ocupación: $occupation', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Regresar a Inicio'),
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla de inicio
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
