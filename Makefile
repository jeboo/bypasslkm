SRC_INJ := bypasslkm.c
OBJ_INJ = $(SRC_INJ:.c=.o)
MODULE_INJ := bypasslkm

ALL_MODULES := $(MODULE_INJ)

CC := /home/none/android/toolchains/prebuilts-gcc-linux-x86-arm-arm-eabi-4.6/bin/arm-linux-androideabi-gcc
CC_STRIP := /home/none/android/toolchains/prebuilts-gcc-linux-x86-arm-arm-eabi-4.6/bin/arm-linux-androideabi-strip

CFLAGS += -g -static -Wall
#$(LDFLAGS) +=


all: $(ALL_MODULES)

$(MODULE_INJ): $(OBJ_INJ)
	$(CC) $(CFLAGS) -o $(MODULE_INJ) $(OBJ_INJ) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

strip:
	$(CC_STRIP) --strip-unneeded $(ALL_MODULES)
	$(CC_STRIP) --strip-debug $(ALL_MODULES)

clean:
	rm -f *.o
	rm -f bypasslkm
