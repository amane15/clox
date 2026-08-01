#include "memory.h"
#include <stdlib.h>

/*
   Based on arguments reallocate performs these operations:
   old_size     new_size                operation
   0            non-zero                Allocated new block
   Non-zero     0                       Free allocation
   Non-zero     Smaller than old_size   Shrink existing block
   Non-zeor     Larger than old_size    Grow existing block
   */
void *reallocate(void *pointer, size_t old_size, size_t new_size) {
    if (new_size == 0) {
        free(pointer);
        return NULL;
    }

    void *result = realloc(pointer, new_size);
    if (result == NULL)
        exit(1);
    return result;
}
