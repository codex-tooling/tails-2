; ModuleID = 'tests.generics_id_annotations'
source_filename = "tests.generics_id_annotations"

@string_literal = private unnamed_addr constant [5 x i8] c"test\00", align 1

define private void @tests_generics_id_annotations.tests() {
fn.entry:
  %object.alloca = alloca { i32 }, align 8
  %call = call i32 @tests_generics_id_annotations.id(i32 123)
  %call1 = call float @tests_generics_id_annotations.id.1(float 3.140000e+02)
  %call2 = call ptr @tests_generics_id_annotations.id.2(ptr @string_literal)
  %object.alloca.field.gep = getelementptr inbounds { i32 }, ptr %object.alloca, i32 0, i32 0
  store i32 123, ptr %object.alloca.field.gep, align 4
  %access.object = load { i32 }, ptr %object.alloca, align 4
  %call3 = call { i32 } @tests_generics_id_annotations.id.3({ i32 } %access.object)
  ret void
}

define private i32 @tests_generics_id_annotations.id(i32 %parameter.x) {
fn.entry:
  ret i32 %parameter.x
}

define private float @tests_generics_id_annotations.id.1(float %parameter.x) {
fn.entry:
  ret float %parameter.x
}

define private ptr @tests_generics_id_annotations.id.2(ptr %parameter.x) {
fn.entry:
  ret ptr %parameter.x
}

define private { i32 } @tests_generics_id_annotations.id.3({ i32 } %parameter.x) {
fn.entry:
  ret { i32 } %parameter.x
}
