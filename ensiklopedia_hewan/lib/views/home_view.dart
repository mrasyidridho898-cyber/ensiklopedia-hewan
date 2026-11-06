
import 'package:flutter/material.dart';
import '../models/hewan.dart';
import '../controllers/hewan_controller.dart';
import '../widgets/hewan_card.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HewanController controller = HewanController();
  final TextEditingController searchController =
      TextEditingController();

  late Future<List<Hewan>> futureHewan;
  String keyword = '';

  @override
  void initState() {
    super.initState();
    futureHewan = controller.ambilDataHewan();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF244C38),
        foregroundColor: Colors.white,
        title: const Text(
          'Ensiklopedia Hewan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Hewan>>(
        future: futureHewan,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Gagal memuat data: ${snapshot.error}'),
            );
          }

          final semuaHewan = snapshot.data ?? [];

          final daftarHewan = controller.cariHewan(
            semuaHewan,
            keyword,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: const BoxDecoration(
                  color: Color(0xFF244C38),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jelajahi Dunia Hewan!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kenali berbagai hewan dan temukan '
                      'fakta menarik di dalamnya.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          keyword = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari nama hewan...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF244C38),
                        ),
                        suffixIcon: keyword.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  searchController.clear();
                                  setState(() {
                                    keyword = '';
                                  });
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20, 22, 20, 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daftar Hewan',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF243C30),
                      ),
                    ),
                    Text(
                      '${daftarHewan.length} Hewan',
                      style: const TextStyle(
                        color: Color(0xFF52715E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: daftarHewan.isEmpty
                    ? const Center(
                        child: Text('Hewan tidak ditemukan.'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        itemCount: daftarHewan.length,
                        itemBuilder: (context, index) {
                          final hewan = daftarHewan[index];

                          return HewanCard(
                            hewan: hewan,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailView(hewan: hewan),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
