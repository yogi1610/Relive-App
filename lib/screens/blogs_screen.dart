import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../utils/app_files_imports.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  List<bool> expanded = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BlogsProvider>(context);
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.blogs,
      bottomSafeArea: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          controller: provider.paginationHelper.scrollController, // only added
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppString.healthTipsDescription,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                onChanged: (val) => provider.searchBlogs(query: val),
                decoration: InputDecoration().suffixIconTextField(
                  contentPadding: const EdgeInsets.all(15),
                  suffix: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AppImage(
                      imagePath: 'assets/images/svg/ic_search_icon.svg',
                    ),
                  ),
                  hintText: AppString.search,
                  context: context,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  AppString.sortBy,
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 18).poppinsRegular,
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    spacing: 15,
                    children: [
                      TextFormField(
                        readOnly: true,
                        textAlign: TextAlign.right,
                        controller: TextEditingController(
                          text: provider.selectedSort.tr(),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.onSecondaryFixedVariant,
                        ).poppinsRegular,
                        decoration: InputDecoration().suffixIconTextField(
                          contentPadding: const EdgeInsets.all(15),
                          borderRadius: 14,
                          suffix: Icon(
                            provider.isSortOpen
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_sharp,
                            size: 30,
                          ),
                          hintText: AppString.search,
                          context: context,
                        ),
                        onTap: provider.onTapSort,
                      ),
                      ListView.separated(
                        itemCount: provider.blogsList.length + (provider.paginationHelper.isLoading ? 1 : 0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          if (index < provider.blogsList.length) {
                            final item = provider.blogsList[index];
                            return ArticleCard(
                              blog: item,
                              isExpanded: item.expanded ?? false,
                              onToggle: () {
                                setState(() => item.expanded = !(item.expanded ?? false));
                              },
                            );
                          } else {
                            // Bottom loader
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  if (provider.isSortOpen)
                    Positioned(
                      top: 55,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: provider.sortList.map((e) {
                            final isSelected = e == provider.selectedSort;
                            return AppGestures(
                              onTap: () {
                                provider.onTapSortItem(
                                  provider.sortList.indexOf(e),
                                );
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? theme.primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: AppText(
                                  e.tr(),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: isSelected
                                        ? theme.surface
                                        : theme.onSecondaryFixedVariant,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;
  final BlogsList blog;

  const ArticleCard({
    super.key,
    required this.isExpanded,
    required this.onToggle,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.shadow, // shadow color
            offset: Offset(0, 4), // x=0, y=4 (bottom)
            blurRadius: 6, // softness of shadow
            spreadRadius: 0, // only bottom
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AppImage(
              imagePath: blog.image ?? '',
              errorWidget: errorImageWidget(context: context, height: 180),
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          // Meta info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                blog.tags,
                style: TextStyle(
                  fontSize: 10,
                  color: theme.primary,
                ).poppinsMedium,
              ),
              AppText(
                "Published: ${AppDateFormat.formatToHumanReadable(blog.createdAt)}",
                style: TextStyle(
                  fontSize: 10,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Title
          AppText(
            blog.blogTitle,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 14).poppinsSemiBold,
          ),
          const SizedBox(height: 8),

          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: ClipRect(
              child: ConstrainedBox(
                constraints: isExpanded
                    ? const BoxConstraints()
                    : BoxConstraints(maxHeight: 53.h),
                child: HtmlWidget(
                  blog.descriptions,
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsRegular,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Read More / Show Less button
          AppButton(
            onPressed: onToggle,
            btnHeight: 50,
            textStyle: TextStyle(
              fontSize: 14,
              color: theme.surface,
            ).poppinsMedium,
            name: isExpanded ? "Show Less" : "Read More",
          ),
        ],
      ),
    );
  }
}
