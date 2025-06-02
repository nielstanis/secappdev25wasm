(module
  ;; Define the add function
  (func $add (param $a i32) (param $b i32) (result i32)
    ;; Load the first parameter onto the stack
    local.get $a
    ;; Load the second parameter onto the stack
    local.get $b
    ;; Add the two values on the stack
    i32.add
  )
  
  ;; Export the add function so it can be called from JavaScript
  (export "add" (func $add))
) 