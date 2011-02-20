#############################################################
#
# sox
#
#############################################################
SOX_VERSION:=14.3.1
SOX_SOURCE:=sox-$(SOX_VERSION).tar.gz
SOX_SITE:=http://mirror.yandex.ru/gentoo-distfiles/distfiles/sox-$(SOX_VERSION).tar.gz
SOX_INSTALL_TARGET = YES
SOX_INSTALL_STAGING = YES
SOX_CONF_OPT= --host=arm-indigo-linux-uclibcgnueabi --disable-gomp
SOX_LIBTOOL_PATCH = NO
#SOX_AUTORECONF = YES

$(eval $(call AUTOTARGETS,package/multimedia,sox))
