#############################################################
#
# libeet
#
#############################################################

LIBEET_VERSION = 1.7.0
LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
LIBEET_SITE = http://download.enlightenment.org/releases/
LIBEET_INSTALL_STAGING = YES

LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina host-libeina

$(eval $(call AUTOTARGETS,package,libeet))
$(eval $(call AUTOTARGETS,pakcage,libeet,host))
