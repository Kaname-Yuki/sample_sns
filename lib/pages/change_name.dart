import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/user.dart';
import 'package:sample_sns/providers/user.dart';
import 'package:sample_sns/repositories/user.dart';
import 'package:sample_sns/common_parts.dart';

class ChangeNamePage extends ConsumerWidget {
  const ChangeNamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ名を変更'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'ユーザ名'),
                  onSaved: (value) {
                    final valueStr = value.toString();
                    setUserName(valueStr);
                    ref
                        .read(usernameProvider.state)
                        .update((state) => valueStr);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ユーザ名を入力してください ';
                    } else if (value.length > 20) {
                      return 'ユーザ名は20文字以内で入力してください';
                    }
                  },
                ),
              ),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('ユーザー名を変更'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
