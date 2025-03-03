
# Pocket C Emulator

![Pocket C Banner](https://i.ibb.co/21VbZzdJ/20250304-015540.jpg)  
*A lightweight C programming tool for Termux, designed for learning and coding on the go.*

---

## Overview

**Pocket C Emulator** is a Bash script that provides a simple, interactive environment for writing, compiling, and running C programs directly in Termux on Android. With a colorful, user-friendly interface, it’s perfect for beginners and experienced coders alike who want to practice C programming anywhere.

### Features
- **Create**: Write new C programs with custom code.
- **Compile & Run**: Build and execute C programs, with on-the-fly file creation if needed.
- **View Code**: Inspect your source files.
- **Examples**: Learn from a built-in C program sample.
- **Modern UI**: Colorful, organized menus and prompts.

---

## Prerequisites

- **Termux**: Installed from [F-Droid](https://f-droid.org/packages/com.termux/) (Google Play version is outdated).
- **Clang**: C compiler for Termux.
- **Git**: To clone the repository.
- An Android device with basic storage access.

---

## Installation

1. **Install Termux**:
   - Download and install Termux from F-Droid.
   - Open Termux and grant storage access:
     ```bash
     termux-setup-storage
     ```

2. **Update Termux and Install Dependencies**:
   ```bash
   pkg update && pkg upgrade -y
   pkg install git clang -y
   ```

3. **Clone the Pocket C Emulator Repository**:
   - Clone the repository from GitHub:
     ```bash
     git clone https://github.com/SafwanGanz/Pocket_C.git
     ```
   - Move into the project directory:
     ```bash
     cd Pocket_C
     ```

4. **Make the Script Executable**:
   - Assuming the script is named `pocketc.sh`:
     ```bash
     chmod +x pocketc.sh
     ```

5. **Run Pocket C Emulator**:
   ```bash
   ./pocketc.sh
   ```

---

## Usage

Launch the script with `./pocketc.sh` to access the main menu:

### Main Menu
![Main Menu Screenshot](https://i.ibb.co/s96SrJxT/Screenshot-2025-03-04-01-58-45-528-com-termux.jpg)  
*Screenshot: Shows the "Pocket C Emulator" title, options 1-5 in green, and the yellow "Enter your choice" prompt.*

#### 1. Create New C Program
- Enter a filename (e.g., `test`).
- Type your C code, press `Ctrl+D` to finish.
- Overwrites existing files if confirmed.

#### 2. Compile and Run Program
- Enter a filename.
- If the file doesn’t exist, opt to create it with your code.
- Compiles with `clang` and runs the program if successful.
- Displays output between blue separators.

![Compile and Run Screenshot](https://i.ibb.co/dwTt8wpx/Screenshot-2025-03-04-02-03-08-516-com-termux.jpg)  
*Screenshot: Shows entering "test", code input prompt, compilation message, and "Hello, World!" output.*

#### 3. View Source Code
- Enter a filename to display its contents.
- Shows code between blue separators.

#### 4. Show Example C Program
- Displays a sample program that takes a number input and echoes it.


#### 5. Exit
- Quits with a "Goodbye from Pocket C!" message.

---

## Example Workflow

1. **Start**: Run `./pocketc.sh`.
2. **Create**: Choose 1, enter `hello`, type:
   ```c
   #include <stdio.h>
   int main() {
       printf("Hello, Pocket C!\n");
       return 0;
   }
   ```
   Press `Ctrl+D`.
3. **Run**: Choose 2, enter `hello`, see "Hello, Pocket C!" output.
4. **View**: Choose 3, enter `hello`, review your code.

---

## Screenshots

*Note: Replace placeholder links with actual screenshots captured from Termux.*

- **Main Menu**: Displays the colorful menu with options.
- **Compile and Run**: Shows compiling and running a simple program.
- **Example Program**: Displays the sample C code.

---

## Troubleshooting

- **"Repository not found"**: Ensure the URL is correct (`https://github.com/SafwanGanz/Pocket_C.git`) and the repo is public, or use credentials if private.
- **"command not found"**: Verify `clang` and `git` are installed (`pkg install clang git`).
- **No output**: Check your C code for syntax errors.
- **Permission denied**: Run `chmod +x pocketc.sh` again.

---

## Contributing

Feel free to fork this project on [GitHub](https://github.com/SafwanGanz/Pocket_C), enhance the UI, or add features like multi-file support or debugging tools. Submit pull requests or open issues!

---

## License

This project is open-source under the [MIT License](LICENSE). Use it freely and share the love for coding!

---

*Built with ❤️ by SafwanGanz for C programmers on the go.*

---
