
import 'package:flutter/material.dart';
import '../models/hewan.dart';

class HewanCard extends StatelessWidget {
  final Hewan hewan;
  final VoidCallback onTap;

  const HewanCard({
    super.key,
    required this.hewan,
    required this.onTap,
  });

  IconData get ikon {
    switch (hewan.nama.toLowerCase()) {
      case 'singa':
        return Icons.pets;
      case 'gajah':
        return Icons.park;
      case 'jerapah':
        return Icons.nature;
      case 'panda':
      case 'kelinci':
        return Icons.cruelty_free;
      case 'harimau':
        return Icons.pets;
      default:
        return Icons.pets;
    }
  }

  Color get warna {
    switch (hewan.nama.toLowerCase()) {
      case 'singa':
        return const Color(0xFFFFE8C2);
      case 'gajah':
        return const Color(0xFFE0E7FF);
      case 'jerapah':
        return const Color(0xFFFFE5B4);
      case 'panda':
        return const Color(0xFFE0F2E9);
      case 'harimau':
        return const Color(0xFFFFDDD2);
      case 'kelinci':
        return const Color(0xFFF3E8FF);
      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: warna,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  ikon,
                  size: 34,
                  color: const Color(0xFF355C45),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hewan.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF243C30),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      hewan.habitat,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
