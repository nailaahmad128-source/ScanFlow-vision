import 'package:flutter/material.dart';
import '../../../core/constants/tools_catalog.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_background.dart';
import 'tool_router.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(title: const Text('All Tools'), backgroundColor: Colors.transparent),
    body: AppBackground(child: ListView(padding: const EdgeInsets.fromLTRB(18, 4, 18, 30), children: [
      _Category(title: 'PDF Tools', children: [
        _Tool('PDF to Word', Icons.description_rounded, AppColors.toolConvertWord, () => openTool(context, ToolId.pdfToWord)),
        _Tool('PDF to Excel', Icons.table_chart_rounded, AppColors.toolConvertExcel, () => openTool(context, ToolId.pdfToExcel)),
        _Tool('PDF to PPT', Icons.slideshow_rounded, AppColors.toolConvertPpt, () => openTool(context, ToolId.pdfToPpt)),
        _Tool('PDF to Images', Icons.photo_library_rounded, AppColors.toolPdfToImage, () => openTool(context, ToolId.pdfToImage)),
        _Tool('Long Image', Icons.view_agenda_rounded, AppColors.toolPdfToImage, () => openTool(context, ToolId.pdfToLongImage)),
        _Tool('Merge PDF', Icons.merge_type_rounded, AppColors.toolMerge, () => openTool(context, ToolId.merge)),
        _Tool('Extract Text', Icons.text_fields_rounded, AppColors.toolOcr, () => openTool(context, ToolId.extractText)),
        _Tool('Reorder Pages', Icons.reorder_rounded, AppColors.toolReorder, () => openTool(context, ToolId.reorder)),
        _Tool('Compress PDF', Icons.compress_rounded, AppColors.toolCompress, () => openTool(context, ToolId.compress)),
        _Tool('Protect PDF', Icons.lock_rounded, AppColors.toolSecurity, () => openTool(context, ToolId.security)),
      ]),
      _Category(title: 'Image Tools', children: [
        _Tool('Image to PDF', Icons.image_rounded, AppColors.toolImageToPdf, () => openTool(context, ToolId.imageToPdf)),
        _Tool('OCR', Icons.document_scanner_rounded, AppColors.toolOcr, () => openTool(context, ToolId.ocrImageToText)),
      ]),
      _Category(title: 'Edit & Sign', children: [
        _Tool('Sign', Icons.draw_rounded, AppColors.toolSign, () => openTool(context, ToolId.fillSign)),
        _Tool('Watermark', Icons.branding_watermark_rounded, AppColors.toolSecurity, () => openTool(context, ToolId.watermark)),
        _Tool('Rotate PDF', Icons.rotate_90_degrees_ccw_rounded, AppColors.toolRotate, () => openTool(context, ToolId.rotate)),
      ]),
    ])),
  );
}

class _Category extends StatelessWidget { final String title; final List<Widget> children; const _Category({required this.title, required this.children}); @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)), const SizedBox(height: 10), GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.02, children: children)])); }
class _Tool extends StatelessWidget { final String title; final IconData icon; final Color color; final VoidCallback onTap; const _Tool(this.title, this.icon, this.color, this.onTap); @override Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: Container(padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: Colors.white.withValues(alpha: .94), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.lightBorder)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 42, height: 42, decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: color, size: 23)), const Spacer(), Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12))]))); }
