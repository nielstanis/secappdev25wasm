(module
  ;; Define the multiply function
  (func $multiply (param $a i32) (param $b i32) (result i32)
    ;; Load the first parameter onto the stack
    local.get $a
    ;; Load the second parameter onto the stack
    local.get $b
    ;; Multiply the two values on the stack
    i32.mul
  )
  
  ;; Export the multiply function so it can be called from outside the module
  (export "multiply" (func $multiply))
) 