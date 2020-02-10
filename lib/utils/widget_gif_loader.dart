import 'package:flutter/material.dart';

loadingAlert(context) {
  return Material(
    type: MaterialType.transparency,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(128),
      child: Container( //
        width: 128,
        height: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(128),
        ),
        child: Center(child: Image.asset("images/loading.gif")),
      ),
    ),
  );
}