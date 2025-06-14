# SecAppDev 2025 

## Using WebAssembly to run, extend, and secure your application

WebAssembly (WASM) has come a long way since its first release in 2017. As a technology stack running inside the web browser, it even allows products like Adobe Photoshop to run in that context, and with Blazor WebAssembly .NET runs inside of the browser as well. Now, WASM is expanding beyond the browser to run in a server-based context. With the introduction of WebAssembly System Interface (WASI), the technology leverages a standardised API that allows it to run on any system that supports it, for example to support cloud-based workloads.
Had WASM and WASI been around in 2009, Docker would not have existed according to one of its founders, Solomon Hykes. WASM has a strong security posture given how it works with linear memory space and how it supports a sandboxed-based environment called “nano-process”, which uses a capabilities-based security model. Users can even take .NET and, with the help of WASI, run it on a Trusted Execution Environment (TEE) to add an additional layer of security.
In this session we'll start out with going through some of the basic security features of WASM and then move to running and extending an .NET application it with WASM. After that we'll focus on the security features and run .NET on a TEE and use the sandbox and the capabilities based security model to limit what it's allowed to do.

## Installation 

If you want to run or participate in the demo's consider installing the following tools:

- WasmTime Runtime - https://docs.wasmtime.dev/cli-install.html
- WasmEdge Runtime - https://wasmedge.org/docs/start/install/
- WABT: The WebAssembly Binary Toolkit - https://github.com/WebAssembly/wabt?tab=readme-ov-file#installing-prebuilt-binaries
- WebAssembly for VS Code - https://marketplace.visualstudio.com/items?itemName=dtsvet.vscode-wasm

## Demo's

- WASM-101 - Intro to WASM modules
- BlazorApp - Running .NET on WASM in Browser
- ConsoleAppWasi - WASI SDK demo + ACL on files
- Extend - ConsoleApp that runs Rust WASM module with WasmTime
- Isolator - Microsoft Experimental WASM Isolator
- Python - Running Python on WASM+WASI
- Virtualize - Rust based WASIp2 component + extension using WASI HTTP