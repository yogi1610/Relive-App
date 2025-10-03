import 'dart:async';
import 'package:flutter/material.dart';
class PaginationHelper {
  final ScrollController scrollController = ScrollController();
  final Future<void> Function(int page) onFetchData;
  bool isLoading = false;
  bool hasMoreData = true;
  int currentPage = 1;

  PaginationHelper({required this.onFetchData});

  void init() {
    scrollController.addListener(_onScroll);
  }

  void dispose() {
    scrollController.dispose();
  }

  void reset() {
    currentPage = 1;
    hasMoreData = true;
  }

  Future<void> _loadNextPage() async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;

    try {
      await onFetchData(currentPage);
    } catch (e) {
      debugPrint('Pagination error: $e');
    } finally {
      isLoading = false;
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      _loadNextPage();
    }
  }

  void updateHasMoreData(bool hasMore) {
    hasMoreData = hasMore;
  }
}






