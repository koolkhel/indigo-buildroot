#############################################################
#
# libedbus
#
#############################################################

LIBEDBUS_VERSION = 1.7.7
LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
LIBEDBUS_SITE = http://download.enlightenment.org/releases/
LIBEDBUS_INSTALL_STAGING = YES

LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina libecore

$(eval $(call AUTOTARGETS,package,libedbus))
