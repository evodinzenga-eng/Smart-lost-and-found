import 'package:flutter/material.dart';

/// Claims page
class ClaimsPage extends StatefulWidget {
  const ClaimsPage({Key? key}) : super(key: key);

  @override
  State<ClaimsPage> createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Claims'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Approved'),
            Tab(text: 'Rejected'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildClaimsTab(context, 'Pending'),
          _buildClaimsTab(context, 'Approved'),
          _buildClaimsTab(context, 'Rejected'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to new claim form
        },
      ),
    );
  }

  Widget _buildClaimsTab(BuildContext context, String status) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildClaimCard(context, status);
      },
    );
  }

  Widget _buildClaimCard(BuildContext context, String status) {
    final statusColors = {
      'Pending': Colors.orange,
      'Approved': Colors.green,
      'Rejected': Colors.red,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'iPhone 13 Pro',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Claim ID: CLM-001234',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: (statusColors[status] ?? Colors.grey)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: statusColors[status],
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Claimed on',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'March 15, 2025',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                if (status == 'Pending')
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Cancel claim
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // View details
                        },
                        child: const Text('View'),
                      ),
                    ],
                  )
                else if (status == 'Approved')
                  ElevatedButton(
                    onPressed: () {
                      // View item details
                    },
                    child: const Text('View Item'),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      // Reclaim
                    },
                    child: const Text('Reclaim'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
