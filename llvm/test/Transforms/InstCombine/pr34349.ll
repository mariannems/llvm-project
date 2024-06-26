; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
;RUN: opt -passes=instcombine -S %s | FileCheck %s

define i8 @fast_div_201(i8 %p) {
; CHECK-LABEL: @fast_div_201(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[V3:%.*]] = zext i8 [[P:%.*]] to i16
; CHECK-NEXT:    [[V4:%.*]] = mul nuw nsw i16 [[V3]], 71
; CHECK-NEXT:    [[V5:%.*]] = lshr i16 [[V4]], 8
; CHECK-NEXT:    [[V6:%.*]] = trunc nuw nsw i16 [[V5]] to i8
; CHECK-NEXT:    [[V7:%.*]] = sub i8 [[P]], [[V6]]
; CHECK-NEXT:    [[V8:%.*]] = lshr i8 [[V7]], 1
; CHECK-NEXT:    [[V13:%.*]] = add nuw i8 [[V8]], [[V6]]
; CHECK-NEXT:    [[V14:%.*]] = lshr i8 [[V13]], 7
; CHECK-NEXT:    ret i8 [[V14]]
;
entry:
  %v3 = zext i8 %p to i16
  %v4 = mul i16 %v3, 71
  %v5 = lshr i16 %v4, 8
  %v6 = trunc i16 %v5 to i8
  %v7 = sub i8 %p, %v6
  %v8 = lshr i8 %v7, 1
  %v13 = add i8 %v6, %v8
  %v14 = lshr i8 %v13, 7
  ret i8 %v14
}
