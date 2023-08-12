import 'package:flutter/material.dart';

class PaginationInfo {
  int currentPage;
  int rowsPerPage;
  int lastPage;
  PaginationInfo({
    required this.currentPage,
    required this.rowsPerPage,
    required this.lastPage,
  });
}

class PaginationControls extends StatelessWidget {
  final PaginationInfo paginationInfo;
  final ValueChanged<int> onPageChanged;

  PaginationControls(
      {required this.paginationInfo, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.08),
      child: (paginationInfo.lastPage == 1)
          ? const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: paginationInfo.currentPage > 1
                      ? () => onPageChanged(paginationInfo.currentPage - 1)
                      : null,
                ),
                Text(
                    'Page ${paginationInfo.currentPage} / ${paginationInfo.lastPage}'),
                IconButton(
                  icon: const Icon(Icons.navigate_next),
                  // onPressed: () => onPageChanged(paginationInfo.currentPage + 1),
                  onPressed:
                      paginationInfo.currentPage < paginationInfo.lastPage
                          ? () => onPageChanged(paginationInfo.currentPage + 1)
                          : null,
                ),
              ],
            ),
    );
  }
}
