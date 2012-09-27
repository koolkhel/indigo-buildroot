#############################################################
#
# libmodbus
#
#############################################################

LIBMODBUS_VERSION_MAJOR:=3.0
LIBMODBUS_VERSION_MINOR:=3
LIBMODBUS_VERSION:=$(LIBMODBUS_VERSION_MAJOR).$(LIBMODBUS_VERSION_MINOR)
LIBMODBUS_SOURCE:=libmodbus-$(LIBMODBUS_VERSION).tar.gz
LIBMODBUS_SITE:=http://github.com/downloads/stephane/libmodbus/libmodbus-$(LIBMODBUS_VERSION_MAJOR).tar.gz
LIBMODBUS_INSTALL_STAGING = YES
LIBMODBUS_INSTALL_TARGET = YES
LIBMODBUS_CONF_OPT =
LIBMODBUS_DEPENDENCIES =

$(eval $(call AUTOTARGETS,package,libmodbus))
