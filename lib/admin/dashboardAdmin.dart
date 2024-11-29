import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      body: Row(
        children: [
          // Sidebar
          _buildSidebar(),
          // Main Content
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }

  // Membuat AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.brown,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Dashboard", style: TextStyle(fontSize: 20)),
          _buildAppBarActions(),
        ],
      ),
    );
  }

  // Membuat dropdown dan tanggal di AppBar
  Row _buildAppBarActions() {
    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, color: Colors.white),
        const SizedBox(width: 8),
        const Text(
          "Oct 25, 2024 - Nov 25, 2024",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(width: 16),
        DropdownButton<String>(
          underline: const SizedBox(),
          dropdownColor: Colors.brown[300],
          icon: const Icon(Icons.account_circle, color: Colors.white),
          items: const [
            DropdownMenuItem(
              value: "admin",
              child: Text("Admin", style: TextStyle(color: Colors.white)),
            ),
          ],
          onChanged: (value) {
            // Logika jika diperlukan
          },
        ),
      ],
    );
  }

  // Sidebar
  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: Colors.brown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Aisyah Thrift",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Divider(color: Colors.white70),
          _SidebarItem(title: "Dashboard", icon: Icons.dashboard),
          _SidebarItem(title: "Data Pesanan", icon: Icons.shopping_cart),
          _SidebarItem(title: "Data Produk Keluar", icon: Icons.exit_to_app),
          _SidebarItem(title: "Stok Produk", icon: Icons.inventory),
        ],
      ),
    );
  }

  // Menampilkan konten utama
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Home > Dashboard",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildDashboardCards(),
            const SizedBox(height: 32),
            _buildTableCard(
              title: "Tabel Data Pesanan",
              dataTable: _buildPesananDataTable(),
              onPrint: () {},
            ),
            const SizedBox(height: 16),
            _buildDataRows(),
          ],
        ),
      ),
    );
  }

  // Menampilkan kartu dashboard
  Widget _buildDashboardCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DashboardCard(
          title: "Data Pesanan",
          subtitle: "Total Pesanan",
          details: "↑ 80 Pesanan Baru",
          width: 400,
        ),
        DashboardCard(
          title: "Data Produk Keluar",
          subtitle: "Produk Terjual",
          details: "↑ 200 Produk Terjual",
          width: 400,
        ),
        DashboardCard(
          title: "Stok Produk",
          subtitle: "Jumlah Stok",
          details: "↑ 100 Produk Tersedia",
          width: 400,
        ),
      ],
    );
  }

  // Menampilkan tabel Data Pesanan
  DataTable _buildPesananDataTable() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID Pesanan')),
        DataColumn(label: Text('UID')),
        DataColumn(label: Text('Nama Pelanggan')),
        DataColumn(label: Text('Tanggal Pesanan')),
        DataColumn(label: Text('Status Pengiriman')),
        DataColumn(label: Text('Total Harga')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('12345')),
          DataCell(Text('uid123')),
          DataCell(Text('John Doe')),
          DataCell(Text('2024-11-25')),
          DataCell(Text('Delivered')),
          DataCell(Text('Rp 250,000')),
        ]),
        DataRow(cells: [
          DataCell(Text('12346')),
          DataCell(Text('uid124')),
          DataCell(Text('Jane Doe')),
          DataCell(Text('2024-11-26')),
          DataCell(Text('In Process')),
          DataCell(Text('Rp 150,000')),
        ]),
      ],
    );
  }

  // Menampilkan tabel data produk keluar dan stok produk
  Widget _buildDataRows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildTableCard(
            title: "Tabel Data Produk Keluar",
            onPrint: () {},
            dataTable: _buildProdukKeluarDataTable(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildTableCard(
            title: "Tabel Stok Produk",
            onPrint: () {},
            dataTable: _buildStokProdukDataTable(),
          ),
        ),
      ],
    );
  }

  // Tabel Data Produk Keluar
  DataTable _buildProdukKeluarDataTable() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID Produk')),
        DataColumn(label: Text('Nama Produk')),
        DataColumn(label: Text('Tanggal Pesanan')),
        DataColumn(label: Text('Aksi')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('p001')),
          DataCell(Text('Produk A')),
          DataCell(Text('2024-11-25')),
          DataCell(IconButton(
            icon: Icon(Icons.delivery_dining, color: Colors.blue),
            onPressed: null,
          )),
        ]),
        DataRow(cells: [
          DataCell(Text('p002')),
          DataCell(Text('Produk B')),
          DataCell(Text('2024-11-26')),
          DataCell(IconButton(
            icon: Icon(Icons.refresh, color: Colors.green),
            onPressed: null,
          )),
        ]),
      ],
    );
  }

  // Tabel Stok Produk
  DataTable _buildStokProdukDataTable() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID Produk')),
        DataColumn(label: Text('Nama Barang')),
        DataColumn(label: Text('Merk')),
        DataColumn(label: Text('Stok')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('p001')),
          DataCell(Text('Produk A')),
          DataCell(Text('Merk A')),
          DataCell(Text('50')),
        ]),
        DataRow(cells: [
          DataCell(Text('p002')),
          DataCell(Text('Produk B')),
          DataCell(Text('Merk B')),
          DataCell(Text('100')),
        ]),
      ],
    );
  }

  // Membuat Card untuk tabel
  Widget _buildTableCard({
    required String title,
    required VoidCallback onPrint,
    required DataTable dataTable,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTableCardHeader(title, onPrint),
            const SizedBox(height: 10),
            dataTable,
          ],
        ),
      ),
    );
  }

  // Header Card untuk tabel
  Row _buildTableCardHeader(String title, VoidCallback onPrint) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.print, color: Colors.brown),
          onPressed: onPrint,
        ),
      ],
    );
  }
}

// Sidebar Item widget
class _SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SidebarItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}

// Dashboard Card untuk menampilkan data statistik
class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String details;
  final double width;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Text(subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
              const SizedBox(height: 8),
              Text(details,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
