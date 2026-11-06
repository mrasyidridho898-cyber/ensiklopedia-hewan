
import 'package:flutter/material.dart';
import '../models/hewan.dart';

class DetailView extends StatelessWidget {
  final Hewan hewan;

  const DetailView({
    super.key,
    required this.hewan,
  });

  IconData get ikon {
    switch (hewan.nama.toLowerCase()) {
      case 'gajah':
        return Icons.park;
      case 'jerapah':
        return Icons.nature;
      case 'panda':
      case 'kelinci':
        return Icons.cruelty_free;
      default:
        return Icons.pets;
    }
  }

  Widget informasi(
    IconData icon,
    String judul,
    String isi,
  ) {
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE7F0E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF244C38),
                size: 25,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF244C38),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    isi,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF244C38),
        foregroundColor: Colors.white,
        title: const Text('Detail Hewan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE3EEE5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Icon(
                    ikon,
                    size: 85,
                    color: const Color(0xFF244C38),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    hewan.nama,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF244C38),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Ensiklopedia Hewan Digital',
                    style: TextStyle(
                      color: Color(0xFF66806D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Informasi Hewan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF244C38),
              ),
            ),
            const SizedBox(height: 15),
            informasi(
              Icons.public,
              'Habitat',
              hewan.habitat,
            ),
            informasi(
              Icons.restaurant,
              'Makanan',
              hewan.makanan,
            ),
            informasi(
              Icons.lightbulb_outline,
              'Fakta Unik',
              hewan.faktaUnik,
            ),
          ],
        ),
      ),
    );
  }
}
