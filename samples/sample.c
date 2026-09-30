// C sample
/* block comment */
#include <stdio.h>
#include "sample.h"
#define MAX_ITEMS 16

typedef struct {
    int id;
    double weight;
} Item;

static unsigned long total(const Item *items, int count) {
    unsigned long sum = 0;
    for (int i = 0; i < count; i++) {
        sum += items[i].id * 2u;
    }
    return sum;
}

int main(void) {
    Item items[MAX_ITEMS] = {{1, 2.5f}, {0xFF, 1000.0}};
    char mark = '\n';
    if (sizeof(items) > 0)
        printf("total: %lu%c", total(items, 2), mark);
    return 0;
}
