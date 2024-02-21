# Variables
INCDIR := $(DESTDIR)/usr/include
BINDIR := $(DESTDIR)/usr/bin
LIBDIR := $(DESTDIR)/usr/lib
LUADIR := $(DESTDIR)/usr/lib/lua/5.1
CONDIR := $(DESTDIR)/etc/config

install:
	mkdir -p $(BINDIR) $(INCDIR) $(LUADIR) $(CONDIR)
	cp --preserve=timestamps uci*.h $(INCDIR)
	cp --preserve=timestamps uci $(BINDIR)
	cp --preserve=timestamps uci.sh $(LIBDIR)
	cp --preserve=timestamps libuci.so $(LIBDIR)
	cp --preserve=timestamps libubox.so $(LIBDIR)
	cp --preserve=timestamps uci.so $(LUADIR)
	cp --preserve=timestamps "test" $(CONDIR)

clean:
	rm -f $(INCDIR)/uci*.h $(BINDIR)/uci $(LIBDIR)/uci.sh $(LIBDIR)/libuci.so $(LIBDIR)/libubox.so $(LIBDIR)/uci.so $(CONDIR)/test

.PHONY: install clean