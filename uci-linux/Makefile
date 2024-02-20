# Variables
INCDIR := $(DESTDIR)/usr/include
BINDIR := $(DESTDIR)/usr/bin
LIBDIR := $(DESTDIR)/usr/lib
LUADIR := $(DESTDIR)/usr/lib/lua/5.1
CONDIR := $(DESTDIR)/etc/config

install:
	mkdir -p $(BINDIR) $(INCDIR) $(LUADIR) $(CONDIR)
	cp uci*.h $(INCDIR)
	cp uci $(BINDIR)
	cp uci.sh $(LIBDIR)
	cp libuci.so $(LIBDIR)
	cp uci.so $(LUADIR)
	cp "test" $(CONDIR)

clean:
	rm -f $(BINDIR)/uci $(BINDIR)/uci.sh $(LIBDIR)/libuci.so $(LIBDIR)/uci.so $(INCDIR)/uci*.h

.PHONY: install clean