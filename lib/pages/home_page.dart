import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/router/route_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Home Page",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //go to profile button
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNameClass.profile);
            },
            child: const Text("Go to profile Page"),
          ),
          const SizedBox(
            height: 10,
          ),

          //go to child button
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            },
            child: const Text("Go to Child Page"),
          ),
          const SizedBox(
            height: 10,
          ),

          //go to user button
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go(
              //   "/user",
              //   extra: {
              //     "name": "Sandeep",
              //     "age": 24,
              //   },
              // );

              String names = "Shehan Sandeep";
              GoRouter.of(context).go("/user/$names");
            },
            child: const Text("Go to User Page"),
          ),
          const SizedBox(
            height: 10,
          ),
          //go to user button
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(
                RouteNameClass.age,
                queryParameters: {"age": "24"},
              );
            },
            child: const Text("Go to Age Page"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/back");
            },
            child: const Text("Go to Back Page"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNameClass.products);
            },
            child: const Text("Go to All Products Page"),
          ),
        ],
      ),
    );
  }
}
