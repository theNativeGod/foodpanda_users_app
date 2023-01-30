import 'package:flutter/material.dart';
import '../screens/main_screens/item_screen.dart';
import '../models/menus.dart';

class MenuDesignWidget extends StatefulWidget {
  String? id;
  Menus? model;
  BuildContext? context;

  MenuDesignWidget({
    this.model,
    this.context,
    this.id,
  });

  @override
  _MenuDesignWidgetState createState() => _MenuDesignWidgetState();
}

class _MenuDesignWidgetState extends State<MenuDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => ItemsScreen(
              widget.model!,
              widget.id!,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1.0,
              ),
              Text(
                widget.model!.menuTitle!,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.menuInfo!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
