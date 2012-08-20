################################################################################
#
# libethumb
#
################################################################################

LIBETHUMB_VERSION = 1.0.1
LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
LIBETHUMB_INSTALL_STAGING = YES

LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje

LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc

$(eval $(call AUTOTARGETS))
