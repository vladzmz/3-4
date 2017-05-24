CC = gcc
CFLAGS = -g -Wall
LFLAGS = -lm

.PHONY: all clean

all: render

render: main.o tga.o model.o
	$(CC) -o $@ $^ $(LFLAGS)

main.o: main.c tga.h model.h
	$(CC) -c $(CFLAGS) -o $@ $<

tga.o:tga.c tga.h
	$(CC) -c $(CFLAGS) -o $@ $<

model.o:model.c model.h tga.h
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -rf render
	rm -rf *.o

