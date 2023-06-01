import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/presentation/home/bloc/home_cubit.dart';
import 'package:drift_project/utils/view_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getUsers() {
    context.read<HomeCubit>().getUsers();
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a name',
                label: Text("Name"),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().saveUser(UserModel(name: controller.text));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Daftar Nama",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final status = state.homeState.status;
                  if (status.isLoading) {
                    return const Text("Loading");
                  }
                  if (status.isError) {
                    return const Text("error");
                  }
                  if (status.isHasData) {
                    final datas = state.homeState.data;
                    if (datas == null) return const Text("No Data");
                    return ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        final data = datas[index];
                        return Text(data.name);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
