import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/data/user.dart';
import 'package:gorouter/models/product_model.dart';
import 'package:gorouter/pages/age.dart';
import 'package:gorouter/pages/back.dart';
import 'package:gorouter/pages/child_page.dart';
import 'package:gorouter/pages/home_page.dart';
import 'package:gorouter/pages/login.dart';
import 'package:gorouter/pages/products_page.dart';
import 'package:gorouter/pages/profile_page.dart';
import 'package:gorouter/pages/single_product_page.dart';
import 'package:gorouter/pages/user_page.dart';
import 'package:gorouter/router/route_name.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage<dynamic>(
        child: Scaffold(
          body: Center(
            child: Text("This page is not found!!!"),
          ),
        ),
      );
    },

    //redirect to login page if user is not logged in

    // redirect: (context, state) {
    //   bool isUserLoggedIn = UserData.isUserLoggedIn;
    //   if (isUserLoggedIn) {
    //     return "/";
    //   } else {
    //     return "/login";
    //   }
    // },

    routes: [
      //Home Page
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return const HomePage();
        },
      ),

      //profile page
      GoRoute(
        name: RouteNameClass.profile,
        path: "/profile",
        builder: (context, state) {
          return const ProfilePage();
        },
        routes: [
          GoRoute(
            name: "child",
            path: "child",
            builder: (context, state) {
              return const ChildPage();
            },
          ),
        ],
      ),

      //User Page extra parameter
      // GoRoute(
      //   name: "User",
      //   path: "/user",
      //   builder: (context, state) {
      //     final name = (state.extra as Map<String, dynamic>)["name"] as String;
      //     final age = (state.extra as Map<String, dynamic>)["age"] as int;
      //     return UserPage(
      //       userName: name,
      //       userAge: age,
      //     );
      //   },
      // ),

      //User Page path parameter
      GoRoute(
        path: "/user/:name",
        builder: (context, state) {
          return UserPage(
            userName: state.pathParameters['name']!,
          );
        },
      ),

      //Age Page path parameter
      GoRoute(
        path: "/age",
        name: RouteNameClass.age,
        builder: (context, state) {
          //
          final int age = state.uri.queryParameters['age'] == null
              ? 0
              : int.parse(state.uri.queryParameters['age']!);
          return AgePage(age: age);
        },
      ),

      //login page
      GoRoute(
        path: "/login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),

      //back page
      GoRoute(
        path: "/back",
        builder: (context, state) {
          return const BackPage();
        },
      ),
      //product page
      GoRoute(
        path: "/products",
        name: RouteNameClass.products,
        builder: (context, state) {
          return const ProductsPage();
        },
      ),

      //single product page
      GoRoute(
        name: RouteNameClass.singleProduct,
        path: "/product",
        builder: (context, state) {
          final Product product = state.extra as Product;
          return SingleProductPage(product: product);
        },
      ),
    ],
  );
}
