#############################################################
#
# gpsd
#
#############################################################
MINICOM_VERSION:=2.5
MINICOM_SOURCE:=minicom-$(MINICOM_VERSION).tar.gz
MINICOM_SITE:=http://mirror.yandex.ru/gentoo-distfiles/distfiles/$(MINICOM_SOURCE)
MINICOM_INSTALL_TARGET = YES
MINICOM_INSTALL_STAGING = YES
MINICOM_LIBTOOL_PATCH = NO

MINICOM_DEPENDENCIES= ncurses

MINICOM_CONF_ENV= CFLAGS="-D_REENTRANT $(TARGET_CFLAGS)"

$(eval $(call AUTOTARGETS,package,minicom))
