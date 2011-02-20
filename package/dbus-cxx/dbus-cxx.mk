#############################################################
#
# gpsd
#
#############################################################
DBUS_CXX_VERSION:=0.7.0
DBUS_CXX_SOURCE:=dbus-cxx-0.7.0.tar.bz2
DBUS_CXX_SITE:=http://citylan.dl.sourceforge.net/sourceforge/dbus-cxx
DBUS_CXX_INSTALL_TARGET = YES
DBUS_CXX_INSTALL_STAGING = YES
DBUS_CXX_CONF_OPT= --disable-python --host=arm-indigo-linux-uclibcgnueabi --without-x
DBUS_CXX_LIBTOOL_PATCH = NO

DBUS_CXX_DEPENDENCIES= host-pkg-config dbus libsigc popt

$(eval $(call AUTOTARGETS,package,dbus-cxx))
