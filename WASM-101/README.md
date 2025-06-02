# WebAssembly Math & Memory Operations Demo

This project demonstrates WebAssembly modules written in WebAssembly Text format (WAT) that export mathematical operations (`add`, `multiply`) and memory management functions (`store_int`, `load_int`).

## Files

- `add.wat` - WebAssembly Text format source code for addition
- `multiply.wat` - WebAssembly Text format source code for multiplication
- `memory.wat` - WebAssembly Text format source code for memory operations
- `index.html` - HTML demo page that uses all WebAssembly modules with animated visualizations
- `README.md` - This file

## WebAssembly Module Details

### Addition Module (`add.wat`)
The `add.wat` file contains a WebAssembly module with:
- A function named `add` that takes two i32 (32-bit integer) parameters
- Returns the sum of the two parameters as an i32
- Exports the function so it can be called from JavaScript

### Multiplication Module (`multiply.wat`)
The `multiply.wat` file contains a WebAssembly module with:
- A function named `multiply` that takes two i32 (32-bit integer) parameters
- Returns the product of the two parameters as an i32
- Exports the function so it can be called from JavaScript

### Memory Module (`memory.wat`)
The `memory.wat` file contains a WebAssembly module with:
- A memory instance of 1 page (64KB = 65,536 bytes)
- A `store_int` function that stores an i32 value at a specific byte offset
- A `load_int` function that retrieves an i32 value from a specific byte offset
- Exports both the memory instance and functions for JavaScript access

### WAT Code Explanation

**Addition Module:**
```wat
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
```

**Multiplication Module:**
```wat
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
  
  ;; Export the multiply function so it can be called from JavaScript
  (export "multiply" (func $multiply))
)
```

**Memory Module:**
```wat
(module
  ;; Define a memory instance with 1 page (64KB)
  (memory $mem 1)
  
  ;; Export the memory so it can be accessed from JavaScript
  (export "memory" (memory $mem))
  
  ;; Function to store an integer value at a specific offset
  (func $store_int (param $offset i32) (param $value i32)
    local.get $offset
    local.get $value
    i32.store  ;; Store 32-bit integer at memory[offset]
  )
  
  ;; Function to load an integer value from a specific offset
  (func $load_int (param $offset i32) (result i32)
    local.get $offset
    i32.load   ;; Load 32-bit integer from memory[offset]
  )
  
  ;; Export the functions so they can be called from JavaScript
  (export "store_int" (func $store_int))
  (export "load_int" (func $load_int))
)
```

## Prerequisites

To compile the WAT files to WASM, you need the WebAssembly Binary Toolkit (WABT):

### Install WABT

**macOS (using Homebrew):**
```bash
brew install wabt
```

**Ubuntu/Debian:**
```bash
sudo apt-get install wabt
```

**Windows:**
Download from the [WABT releases page](https://github.com/WebAssembly/wabt/releases)

## Compilation

Compile all WAT files to WASM using the `wat2wasm` tool:

```bash
# Compile addition module
wat2wasm add.wat -o add.wasm

# Compile multiplication module
wat2wasm multiply.wat -o multiply.wasm

# Compile memory module
wat2wasm memory.wat -o memory.wasm
```

This will create `add.wasm`, `multiply.wasm`, and `memory.wasm`, the binary WebAssembly modules.

## Running the Demo

1. Compile all WAT files to WASM (see above)
2. Start a local web server in the project directory:

   **Using Python 3:**
   ```bash
   python3 -m http.server 8000
   ```

   **Using Node.js (if you have http-server installed):**
   ```bash
   npx http-server -p 8000
   ```

   **Using PHP:**
   ```bash
   php -S localhost:8000
   ```

3. Open your browser and navigate to `http://localhost:8000`
4. Use the toggle buttons to switch between Addition, Multiplication, and Memory operations
5. Enter values and click the operation button to see the WebAssembly function in action

## Features

### Interactive Operations
- **Math Operations**: Addition (+) and Multiplication (×) with stack visualization
- **Memory Operations**: Store and Load integer values with memory visualization
- **Real-time Input**: Enter any integers or memory offsets
- **Visual Feedback**: Color-coded results and comprehensive error handling

### Animated Visualizations

#### Stack Operations (Math)
The demo shows step-by-step stack operations for mathematical functions:
1. Function call with parameters
2. `local.get $a` - Push first parameter
3. `local.get $b` - Push second parameter
4. `i32.add`/`i32.mul` - Pop, operate, push result

#### Memory Operations
The demo visualizes WebAssembly memory management:
- **Memory Grid**: Visual representation of the first 16 memory locations (64 bytes)
- **Store Animation**: Shows how `i32.store` places values in memory
- **Load Animation**: Shows how `i32.load` retrieves values from memory
- **Memory Tracking**: Persistent visualization of stored values

### Visual Elements
- **Color Coding**: 
  - Addition: Blue/green theme
  - Multiplication: Red/orange theme  
  - Memory: Purple/teal theme
- **Operation Indicators**: Clear labeling of current operation mode
- **Memory Grid**: 4x4 grid showing memory offsets 0-60 (i32-aligned)
- **Highlight Effects**: Interactive highlighting during operations
- **Reset Functionality**: Replay any animation

## How It Works

### Math Operations
1. HTML loads the compiled WASM modules (`add.wasm`, `multiply.wasm`)
2. JavaScript instantiates the modules and makes functions available
3. Animation shows the stack-based execution step by step
4. WebAssembly function is called with input values
5. Result is displayed with the appropriate mathematical symbol

### Memory Operations
1. HTML loads the `memory.wasm` module with its 64KB memory instance
2. JavaScript can call `store_int(offset, value)` and `load_int(offset)`
3. Animation shows memory cells being accessed
4. Memory grid updates to reflect stored values
5. Values persist for the session and can be retrieved later

### Memory Layout
- **Memory Size**: 1 page = 64KB (65,536 bytes)
- **Integer Storage**: Each i32 uses 4 bytes
- **Alignment**: Offsets should be multiples of 4 for optimal performance
- **Visible Range**: Demo shows offsets 0-60 (16 memory locations)
- **Address Space**: Full range is 0-65,532 (accounting for 4-byte integers)

## Browser Compatibility

This demo works in all modern browsers that support WebAssembly:
- Chrome 57+
- Firefox 52+
- Safari 11+
- Edge 16+

## Educational Value

This comprehensive demo illustrates:

### WebAssembly Concepts
- **Text Format (WAT)**: How to write WAT code for different operations
- **Stack-Based Architecture**: Visual representation of the virtual machine
- **Memory Management**: Linear memory model and direct memory access
- **Module System**: Loading and using multiple WebAssembly modules

### Advanced Features
- **Memory Instructions**: `i32.store` and `i32.load` operations
- **Memory Exports**: Sharing memory between WebAssembly and JavaScript
- **Function Exports**: Making WebAssembly functions available to JavaScript
- **Error Handling**: Boundary checking and validation

### Programming Concepts
- **Low-level Memory**: Direct memory manipulation at byte level
- **Data Persistence**: How values are stored and retrieved
- **Memory Alignment**: Importance of proper byte alignment
- **Address Arithmetic**: Working with memory offsets

## Memory Operation Examples

### Storing Values
```javascript
// Store the value 42 at memory offset 0
memoryModule.store_int(0, 42);

// Store the value 100 at memory offset 4  
memoryModule.store_int(4, 100);
```

### Loading Values
```javascript
// Load value from memory offset 0
const value1 = memoryModule.load_int(0); // Returns 42

// Load value from memory offset 4
const value2 = memoryModule.load_int(4); // Returns 100
```

## Notes

- WebAssembly files must be served over HTTP/HTTPS (not file://) due to CORS restrictions
- Memory offsets must be multiples of 4 (i32 alignment) and within range 0-65,532
- The demo includes comprehensive error handling for invalid inputs
- All operations work on 32-bit signed integers (-2,147,483,648 to 2,147,483,647)
- Memory values persist during the session but reset when the page is refreshed
- The visualization accurately represents actual WebAssembly virtual machine behavior
- Color coding helps distinguish between different operation types in animations 