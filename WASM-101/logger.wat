(module
  (import "console" "log" (func $log (param i32 i32)))
  (import "js" "mem" (memory 1))
  (data (i32.const 0) "Hello SecAppDev!")
  (func (export "writeHi")
    i32.const 0  ;; pass offset 0 to log
    i32.const 15 ;; pass length 2 to log
    call $log
  )
)