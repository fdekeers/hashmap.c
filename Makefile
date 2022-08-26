CFLAGS = -Wall -Werror

.PHONY: all static shared

all: static shared

static:
	gcc -c hashmap.c -o hashmap.o $(CFLAGS)
	ar -rsv /usr/local/lib/libhashmap.a hashmap.o
	cp hashmap.h /usr/local/include/

shared:
	gcc -c -fPIC hashmap.c -o hashmap.o $(CFLAGS)
	gcc -shared -o /usr/local/lib/libhashmap.so hashmap.o
