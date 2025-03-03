RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

show_menu() {
    clear
    echo -e "${BLUE}====================================${NC}"
    echo -e "${YELLOW}         Pocket C Emulator${NC}"
    echo -e "${BLUE}====================================${NC}"
    echo -e "  ${GREEN}1.${NC} Create new C program"
    echo -e "  ${GREEN}2.${NC} Compile and run program"
    echo -e "  ${GREEN}3.${NC} View source code"
    echo -e "  ${GREEN}4.${NC} Show example C program"
    echo -e "  ${GREEN}5.${NC} Exit"
    echo -e "${BLUE}====================================${NC}"
    echo -n -e "${YELLOW}Enter your choice (1-5): ${NC}"
    read -r choice
}

create_program() {
    clear
    echo -e "${BLUE}=== Pocket C Emulator: Create New Program ===${NC}"
    echo -n -e "${GREEN}Enter filename (without .c): ${NC}"
    read -r filename
    
    if [ -z "$filename" ]; then
        echo -e "${RED}Error: Filename cannot be empty!${NC}"
        sleep 2
        return
    fi
    
    if [ -f "$filename.c" ]; then
        echo -e "${YELLOW}Warning: $filename.c already exists!${NC}"
        echo -n -e "${GREEN}Overwrite? (y/n): ${NC}"
        read -r answer
        if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
            echo -e "${BLUE}Returning to menu...${NC}"
            sleep 2
            return
        fi
    fi

    echo -e "${GREEN}Enter your C code (press Ctrl+D when finished):${NC}"
    if cat > "$filename.c"; then
        echo -e "${GREEN}Success: Created $filename.c!${NC}"
    else
        echo -e "${RED}Error: Failed to create file!${NC}"
    fi
    sleep 2
}

compile_run_program() {
    clear
    echo -e "${BLUE}=== Pocket C Emulator: Compile and Run ===${NC}"
    echo -n -e "${GREEN}Enter filename (without .c): ${NC}"
    read -r filename
    
    if [ -z "$filename" ]; then
        echo -e "${RED}Error: Filename cannot be empty!${NC}"
        sleep 2
        return
    fi
    
    if [ ! -f "$filename.c" ]; then
        echo -e "${YELLOW}Warning: $filename.c not found!${NC}"
        echo -n -e "${GREEN}Create it now? (y/n): ${NC}"
        read -r answer
        if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
            echo -e "${GREEN}Enter your C code (press Ctrl+D when finished):${NC}"
            if cat > "$filename.c"; then
                echo -e "${GREEN}Success: Created $filename.c!${NC}"
            else
                echo -e "${RED}Error: Failed to create file!${NC}"
                sleep 2
                return
            fi
        else
            echo -e "${BLUE}Returning to menu...${NC}"
            sleep 2
            return
        fi
    fi
    
    echo -e "${BLUE}Compiling...${NC}"
    if clang "$filename.c" -o "$filename"; then
        echo -e "${GREEN}Compilation successful!${NC}"
        echo -e "${BLUE}Running program...${NC}"
        echo -e "${BLUE}-------------------${NC}"
        ./"$filename"
        echo -e "${BLUE}-------------------${NC}"
    else
        echo -e "${RED}Compilation failed!${NC}"
    fi
    echo -e "\n${YELLOW}Press Enter to continue...${NC}"
    read -r
}

view_code() {
    clear
    echo -e "${BLUE}=== Pocket C Emulator: View Source Code ===${NC}"
    echo -n -e "${GREEN}Enter filename (without .c): ${NC}"
    read -r filename
    
    if [ -z "$filename" ]; then
        echo -e "${RED}Error: Filename cannot be empty!${NC}"
        sleep 2
        return
    fi
    
    if [ ! -f "$filename.c" ]; then
        echo -e "${RED}Error: $filename.c not found!${NC}"
        sleep 2
        return
    fi
    
    echo -e "${BLUE}Contents of $filename.c:${NC}"
    echo -e "${BLUE}-------------------${NC}"
    cat "$filename.c"
    echo -e "${BLUE}-------------------${NC}"
    echo -e "\n${YELLOW}Press Enter to continue...${NC}"
    read -r
}

show_example() {
    clear
    echo -e "${BLUE}=== Pocket C Emulator: Example Program ===${NC}"
    echo -e "${GREEN}Sample C Program:${NC}"
    echo -e "${BLUE}-------------------${NC}"
    cat << EOL
#include <stdio.h>

int main() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);
    printf("You entered: %d\\n", num);
    return 0;
}
EOL
    echo -e "${BLUE}-------------------${NC}"
    echo -e "\n${YELLOW}Press Enter to continue...${NC}"
    read -r
}

while true; do
    show_menu
    case $choice in
        1) create_program;;
        2) compile_run_program;;
        3) view_code;;
        4) show_example;;
        5) echo -e "${BLUE}Goodbye from Pocket C Emulator!${NC}"; exit 0;;
        *) echo -e "${RED}Invalid choice!${NC}"; sleep 2;;
    esac
done
