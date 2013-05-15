#ifndef RADIOTOLEDS_H
#define RADIOTOLEDS_H

enum {
  AM_MSGCODE = 17,
};

typedef nx_struct Msg {
  nx_uint16_t data;
} Msg;

#endif
