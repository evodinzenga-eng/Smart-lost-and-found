import 'package:flutter/material.dart';

/// Notifications page
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'Item Match Found',
      description: 'Your lost iPhone 13 Pro might be found!',
      icon: Icons.match_circle,
      color: Colors.blue,
      timestamp: 'Now',
      read: false,
    ),
    NotificationItem(
      title: 'Claim Approved',
      description: 'Your claim for Red Backpack has been approved.',
      icon: Icons.check_circle,
      color: Colors.green,
      timestamp: '2 hours ago',
      read: false,
    ),
    NotificationItem(
      title: 'Status Update',
      description: 'Your lost item status changed to "Verified"',
      icon: Icons.update,
      color: Colors.orange,
      timestamp: '5 hours ago',
      read: true,
    ),
    NotificationItem(
      title: 'New Claim Request',
      description: 'Someone claimed your found item.',
      icon: Icons.person_add,
      color: Colors.purple,
      timestamp: '1 day ago',
      read: true,
    ),
    NotificationItem(
      title: 'Claim Rejected',
      description: 'Your claim for Electronics item was rejected.',
      icon: Icons.cancel,
      color: Colors.red,
      timestamp: '2 days ago',
      read: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              // Mark all as read
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationCard(context, _notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, NotificationItem notification) {
    return Dismissible(
      key: Key(notification.title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        // Handle delete
      },
      child: Container(
        color: notification.read ? Colors.transparent : Colors.blue.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: notification.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: notification.read
                                      ? FontWeight.w400
                                      : FontWeight.w600,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (!notification.read)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2563EB),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.timestamp,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String timestamp;
  final bool read;

  NotificationItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.timestamp,
    required this.read,
  });
}
