rpiboot: main.c boot/bootcode.h boot/start.h
	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0

%.h: %.bin ./bin2c
	./bin2c $< $@

%.h: %.elf ./bin2c
	./bin2c $< $@

bin2c: bin2c.c
	$(CC) -Wall -Wextra -g -o $@ $<

clean:
	rm -f rpiboot boot/*.h bin2c

.PHONY: uninstall clean
