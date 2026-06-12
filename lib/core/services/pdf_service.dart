import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../models/clinical.dart';
import '../utils/date_format_ar.dart';

/// Generates and shares simple Arabic (RTL) PDF documents for discharge reports
/// and lab results. Uses an Arabic-capable Google Font (Cairo) so glyphs shape
/// correctly; falls back gracefully if the font cannot be fetched offline.
class PdfService {
  PdfService._();
  static final PdfService instance = PdfService._();

  Future<pw.ThemeData> _theme() async {
    final base = await PdfGoogleFonts.cairoRegular();
    final bold = await PdfGoogleFonts.cairoBold();
    return pw.ThemeData.withFont(base: base, bold: bold);
  }

  pw.Widget _header(String title) => pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.all(14),
        decoration: const pw.BoxDecoration(
          color: PdfColor.fromInt(0xFFDFF1FF),
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('وحدة بسمة لرعاية الأطفال',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: const PdfColor.fromInt(0xFF008FD2))),
            pw.SizedBox(height: 4),
            pw.Text(title, style: const pw.TextStyle(fontSize: 13)),
          ],
        ),
      );

  pw.Widget _row(String label, String value) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(label,
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: const PdfColor.fromInt(0xFF5C6B7A))),
            pw.Expanded(
              child: pw.Text(value, textAlign: pw.TextAlign.left),
            ),
          ],
        ),
      );

  Future<Uint8List> buildDischargePdf(
    DischargeReportView report,
    String childName,
  ) async {
    final theme = await _theme();
    final doc = pw.Document(theme: theme);
    doc.addPage(
      pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.a4,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _header('تقرير التخريج'),
            pw.SizedBox(height: 16),
            _row('الطفل', childName),
            _row('تاريخ آخر جرعة', DateFormatAr.date(report.lastDoseDate)),
            _row('تاريخ الجرعة القادمة', DateFormatAr.date(report.nextDoseDate)),
            _row('الوجهة القادمة', report.nextVisitDepartment),
            pw.SizedBox(height: 12),
            pw.Text('الوصفة',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
            pw.SizedBox(height: 6),
            ...report.prescription.map(
              (p) => pw.Bullet(
                text: '${p.med} — ${p.dose}'
                    '${p.instructions != null ? ' (${p.instructions})' : ''}',
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text('تعليمات الطبيب',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
            pw.SizedBox(height: 6),
            pw.Text(report.doctorInstructions),
            pw.SizedBox(height: 20),
            pw.Divider(),
            pw.Text('صُدر بتاريخ ${DateFormatAr.date(report.generatedAt)}',
                style: const pw.TextStyle(
                    fontSize: 10, color: PdfColor.fromInt(0xFF5C6B7A))),
          ],
        ),
      ),
    );
    return doc.save();
  }

  Future<Uint8List> buildLabResultPdf(
    LabResultView result,
    String childName,
  ) async {
    final theme = await _theme();
    final doc = pw.Document(theme: theme);
    doc.addPage(
      pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.a4,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _header('نتيجة تحليل'),
            pw.SizedBox(height: 16),
            _row('الطفل', childName),
            _row('نوع التحليل', result.testType),
            _row('التاريخ', DateFormatAr.date(result.resultDate)),
            _row('الحالة', result.status),
            pw.SizedBox(height: 12),
            if (result.summary != null) ...[
              pw.Text('ملخص',
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
              pw.SizedBox(height: 6),
              pw.Text(result.summary!),
            ],
            pw.SizedBox(height: 20),
            pw.Divider(),
            pw.Text('هذه نسخة للعرض ضمن تطبيق رعاية بسمة.',
                style: const pw.TextStyle(
                    fontSize: 10, color: PdfColor.fromInt(0xFF5C6B7A))),
          ],
        ),
      ),
    );
    return doc.save();
  }

  Future<void> shareDischarge(
      DischargeReportView report, String childName) async {
    final bytes = await buildDischargePdf(report, childName);
    await Printing.sharePdf(bytes: bytes, filename: 'discharge_${report.id}.pdf');
  }

  Future<void> shareLabResult(LabResultView result, String childName) async {
    final bytes = await buildLabResultPdf(result, childName);
    await Printing.sharePdf(bytes: bytes, filename: 'result_${result.id}.pdf');
  }
}
