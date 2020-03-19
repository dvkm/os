#include "../drivers/screen.h"
#include "util.h"

void main() {
    clear_screen();

    /* Fill up the screen */
    int i = 0;
    for (i = 0; i < 24; i++) {
        char str[255];
        int_to_ascii(i, str);
        kprint(str);
        kprint("\n");
    }

    kprint("Testing printing a line that is long enough to cause an overflow to the next line.");   
}
