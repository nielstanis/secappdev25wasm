(module
  ;; Define a memory instance with 1 page (64KB)
  ;; Each page is 64KB, so this gives us 65536 bytes of memory
  (memory $mem 1)
  
  ;; Export the memory so it can be accessed from JavaScript
  (export "memory" (memory $mem)) 
  
  ;; Function to store an integer value at a specific offset
  ;; Parameters: offset (byte position), value (i32 to store)
  (func $store_int (param $offset i32) (param $value i32)
    ;; Get the offset parameter
    local.get $offset
    ;; Get the value parameter
    local.get $value
    ;; Store the 32-bit integer at the memory location (offset)
    ;; i32.store takes: [address] [value] -> []
    i32.store
  )
  
  ;; Function to load an integer value from a specific offset
  ;; Parameters: offset (byte position)
  ;; Returns: the i32 value stored at that location
  (func $load_int (param $offset i32) (result i32)
    ;; Get the offset parameter
    local.get $offset
    ;; Load the 32-bit integer from the memory location (offset)
    ;; i32.load takes: [address] -> [value]
    i32.load
  )

    ;; Function to store an integer value at a specific offset
  ;; Parameters: offset (byte position), value (i32 to store)
    ;; Returns: the i32 value stored at that location
  (func $store_load_int (param $offset i32) (param $value i32) (result i32)
    ;; Get the offset parameter
    local.get $offset
    ;; Get the value parameter
    local.get $value
    ;; Store the 32-bit integer at the memory location with help of the store_int function
    call $store_int
     ;; Get the offset parameter
    local.get $offset
    ;; Load the 32-bit integer from the memory location with help of the load_int function
    call $load_int
  )
  
  ;; Export the functions so they can be called from JavaScript
  (export "store_int" (func $store_int))
  (export "load_int" (func $load_int))
  (export "store_load_int" (func $store_load_int))
)
