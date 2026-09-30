// C header sample
#ifndef SAMPLE_H
#define SAMPLE_H

#define SAMPLE_VERSION "1.0"
#define SAMPLE_LIMIT 0x40

/* A simple record */
typedef struct Record {
    int id;
    const char *name;
    unsigned short flags;
} Record;

extern int record_count;

void record_init(Record *record, int id);
static inline int record_is_valid(const Record *record) {
    return record != 0 && record->id > 0;
}

#endif
