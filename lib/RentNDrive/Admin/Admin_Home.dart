import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( leading:Padding(
      padding: const EdgeInsets.only(left: 20),
      child: CircleAvatar(child: Icon( Icons.person),radius: 50,),
    )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(children: [
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.person),
            ],
          ),*/
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                DashboardCard(
                  icon: Icons.directions_car,
                  label: 'Total Cars',
                  value: '20',
                ),
                DashboardCard(
                  icon: Icons.person,
                  label: 'Total Users',
                  value: '20',
                ),
                DashboardCard(
                  icon: Icons.account_balance_wallet,
                  label: 'Payment',
                  value: '300',
                ),
                DashboardCard(
                  icon: Icons.people,
                  label: 'Owners',
                  value: '15',
                ),
                DashboardCard(
                  icon: Icons.verified_user,
                  label: 'Verify User',
                  value: '30',
                ),
                DashboardCard(
                  icon: Icons.verified_user,
                  label: 'VerifyOwner ',
                  value: '12',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  DashboardCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF4C7746),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
