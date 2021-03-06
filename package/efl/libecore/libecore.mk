#############################################################
#
# libecore
#
#############################################################

LIBECORE_VERSION = 1.7.7
LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
LIBECORE_SITE = http://download.enlightenment.org/releases/
LIBECORE_INSTALL_STAGING = YES

LIBECORE_DEPENDENCIES = host-pkg-config libeina

HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina host-libevas
HOST_LIBECORE_CONF_OPT += --enable-ecore-evas

# default options
LIBECORE_CONF_OPT = --disable-simple-x11 --disable-openssl --disable-gnutls --disable-glib

# libecore
ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
LIBECORE_CONF_OPT += --enable-ecore-directfb
else
LIBECORE_CONF_OPT += --disable-ecore-directfb
endif

ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
LIBECORE_CONF_OPT += --enable-ecore-fb
LIBECORE_DEPENDENCIES += directfb
else
LIBECORE_CONF_OPT += --disable-ecore-fb
endif

ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
LIBECORE_CONF_OPT += --enable-ecore-sdl
LIBECORE_DEPENDENCIES += sdl
else
LIBECORE_CONF_OPT += --disable-ecore-sdl
endif

ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
LIBECORE_CONF_OPT += --enable-ecore-x
LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
else
LIBECORE_CONF_OPT += --disable-ecore-x
endif

ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
LIBECORE_CONF_OPT += --enable-ecore-x-xcb
LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util

# src/util/makekeys is executed at build time to generate
# ecore_xcb_keysym_table.h, so it should get compiled for the host.
# The ecore makefile unfortunately doesn't know about cross
# compilation so this doesn't work.  Long term, we should probably
# teach it about CC_FOR_BUILD, but for now simply build makekeys by
# hand in advance
define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
		-o makekeys makekeys.c
endef

LIBECORE_POST_CONFIGURE_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
else
LIBECORE_CONF_OPT += --disable-ecore-x-xcb
endif

# libecore-evas
ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
LIBECORE_CONF_OPT += --enable-ecore-evas
LIBECORE_DEPENDENCIES += libevas
else
LIBECORE_CONF_OPT += --disable-ecore-evas
endif

$(eval $(call AUTOTARGETS,package,libecore))
$(eval $(call AUTOTARGETS,package,libecore,host))
