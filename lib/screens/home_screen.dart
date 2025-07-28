import 'package:flutter/material.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';
import 'package:optronix_assignment/utils/themes/app_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _bussinessData = SharePreference.instance.bussinessDetails;
    return Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        title:  AppFonts().appBarHeading('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.red,size: 22,),
            onPressed: () async {
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFonts().heading(
              'Welcome, ${_bussinessData!.contactPerson.fullName}!',
                  ),
            const SizedBox(height: 32),
            _buildInfoCard('Business Details', [
              'Name: ${_bussinessData.name}',
              'Email: ${_bussinessData.email}',
              'Phone: ${_bussinessData.phoneNumber}',
              'Address: ${_bussinessData.address}',
              'Location: ${_bussinessData.location}',
              'Customer Count: ${_bussinessData.customerCount}',
            ],context),
            const SizedBox(height: 16),
            _buildInfoCard('Contact Person Details', [
              'Name: ${_bussinessData.contactPerson.fullName}',
              'Email: ${_bussinessData.contactPerson.email}',
              'Phone: ${_bussinessData.contactPerson.phoneNumber}',
              'Designation: ${_bussinessData.contactPerson.designation}',
              'Date of Birth: ${_formatDate(_bussinessData.contactPerson.dateOfBirth)}',
            ],context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items,BuildContext context) {
    print(items);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        // color: AppColors().secondaryColor.withValues(alpha: 0.5),
        elevation: 0.2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFonts().heading(
                title,
              ),
              const SizedBox(height: 16),
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppFonts().subHeading(item),
                      Divider()
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
