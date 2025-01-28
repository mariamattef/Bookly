import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomBookImageItem extends StatefulWidget {
 const  CustomBookImageItem({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  State<CustomBookImageItem> createState() => _CustomBookImageItemState();
}

class _CustomBookImageItemState extends State<CustomBookImageItem>  with SingleTickerProviderStateMixin {
     late AnimationController _controller;
      @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  Widget build(BuildContext context) {
    
  final spinkit =SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,
      controller: _controller,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: widget.imgUrl,
            placeholder: (context, url) =>
                 spinkit,
            errorWidget: (context, url, error) {
              return const Icon(Icons.error_outline);
            },
          )),
    );
  }
    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


