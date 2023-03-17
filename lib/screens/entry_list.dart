import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/screens/entry_detail.dart';
import 'package:wasteagram/widgets/new_entry_fab.dart';

class EntryListScreen extends StatefulWidget {
  const EntryListScreen({super.key});

  @override
  State<EntryListScreen> createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram')),
      body: StreamBuilder(
        stream: FirebaseFirestore
                  .instance
                  .collection('posts')
                  .orderBy('date', descending: true)
                  .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return _itemBuilder(snapshot.data!.docs[index]);
              }
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: const NewEntryButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _itemBuilder(QueryDocumentSnapshot<Map<String, dynamic>> item) {
    final timestamp = item['date'].toDate();
    final formattedDate = DateFormat('EEEE, MMMM d, y').format(timestamp);
    return ListTile(
      title: Text(formattedDate),
      trailing: Text('${item['quantity']}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => EntryDetailScreen(item: item))
        );
      },
    );
  }
}