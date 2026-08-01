import 'package:flutter_test/flutter_test.dart';

import 'package:basma_patient/models/child.dart';
import 'package:basma_patient/core/utils/masking.dart';

void main() {
  test('ChildSummary.fullName joins first and family name', () {
    const child = ChildSummary(
      fileNoBasma: 'B-1001',
      firstName: 'تالا',
      familyName: 'الحلبي',
      age: 7,
      gender: 'أنثى',
      currentPhase: 'مرحلة الحث',
    );
    expect(child.fullName, 'تالا الحلبي');
  });

  test('Masking.maskId keeps only the last visible digits', () {
    expect(Masking.maskId('0123456789'), '••••••6789');
    expect(Masking.maskId(null), '—');
  });
}
