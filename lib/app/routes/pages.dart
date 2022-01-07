import 'package:fuse_walls/app/modules/category_menu/category_menu.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/binding.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/wallpapers_gallery.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.MENU, page: () => const CategoryMenu()),
    GetPage(
        name: Routes.GALLERY,
        page: () => const WallpapersGallery(),
        binding: WallpapersGalleryBinding())
  ];
}
