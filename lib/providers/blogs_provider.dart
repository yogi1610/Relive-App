import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class BlogsProvider extends ChangeNotifier {
  bool _isSortOpen = false;

  bool get isSortOpen => _isSortOpen;

  String _selectedSort = AppString.mostRecent;

  String get selectedSort => _selectedSort;

  List<String> sortList = [AppString.mostRecent, AppString.mostPopular];
  List<BlogsList> blogsList = [];

  late PaginationHelper paginationHelper;
  Timer? _debounce;
  String? searchQuery;
  String? filterQuery;
  int? totalPage;

  BlogsProvider() {
    paginationHelper = PaginationHelper(
      onFetchData: (page) async {
        // Only fetch if we have more pages
        if (totalPage == null || page <= totalPage!) {
          final newItems = await _getAllBlogsApi(
            page: page,
            perPage: 5,
            search: searchQuery,
            filter: filterQuery,
          );

          if (newItems.isNotEmpty) {
            paginationHelper.currentPage++; // Next page increment
          }
        }
      },
    )..init();
  }

  // Manual first page load (for WellnessProvider)
  Future<void> getAllBlogsApi({
    required BuildContext context,
    int page = 1,
    int perPage = 5,
    String? search,
    String? filter,
  }) async {
    final newItems = await _getAllBlogsApi(
      page: page,
      perPage: perPage,
      search: search,
      filter: filter,
    );

    if (page == 1) blogsList.clear();

    blogsList.addAll(newItems);

    // Update pagination helper info
    if (totalPage != null) {
      paginationHelper.updateHasMoreData(page < totalPage!);
      paginationHelper.currentPage = page + 1; // Next page
    }

    notifyListeners();
  }

  void onTapSortItem(int index) {
    _selectedSort = sortList[index];
    _isSortOpen = false;

    filterQuery = _selectedSort == AppString.mostPopular
        ? "most_popular"
        : "most_recent";

    blogsList.clear();
    paginationHelper.reset();

    _getAllBlogsApi(page: 1, perPage: 5, filter: filterQuery).then((newItems) {
      if (newItems.isNotEmpty) {
        blogsList.addAll(newItems);
        paginationHelper.currentPage = 2;
      }
      notifyListeners();
    });
  }

  void onTapSort() {
    _isSortOpen = true;
    notifyListeners();
  }

  void searchBlogs({required String query}) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      searchQuery = query.isEmpty ? null : query;
      blogsList.clear();
      paginationHelper.reset();

      // Fetch first page based on search
      final newItems = await _getAllBlogsApi(
        page: 1,
        perPage: 5,
        search: searchQuery,
        filter: filterQuery,
      );

      if (newItems.isNotEmpty) {
        blogsList.addAll(newItems);
        paginationHelper.currentPage = 2; // next page ready
      }

      notifyListeners();
    });
  }

  Future<List<BlogsList>> _getAllBlogsApi({
    required int page,
    required int perPage,
    String? search,
    String? filter,
  }) async {
    Map<String, String> body = {
      ApiKeys.page: page.toString(),
      ApiKeys.perPage: perPage.toString(),
    };
    if (search != null) body[ApiKeys.searchKey] = search;
    if (filter != null) body[ApiKeys.filter] = filter;

    final response = await Apis.getAllBlogs(body: body);

    if (response != null && response.status) {
      totalPage = response.data.totalPages;
      final newItems = response.data.blogs;

      // Only append if not manually handled in getAllBlogsApi
      if (page != 1) blogsList.addAll(newItems);

      paginationHelper.updateHasMoreData(page < totalPage!);

      notifyListeners();
      return newItems;
    } else {
      paginationHelper.updateHasMoreData(false);
      return [];
    }
  }

  void disposeHelper() {
    paginationHelper.dispose();
  }
}
