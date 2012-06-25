#############################################################
#
# Socket CAN
#
#############################################################
PROGRAMS_ISOTP = isotpdump,isotprecv,isotpsend,isotpsniffer,isotptun,isotpserver
PROGRAMS_CANGW = cangw
PROGRAMS_SLCAN = slcan_attach,slcand
PROGRAMS_CAN_UTILS = can-calc-bit-timing,candump,cansniffer,cansend,canplayer,cangen,canbusload,log2long,log2asc,asc2log,canlogserver,bcmserver,slcanpty,canfdtest
PROGRAMS = {$(PROGRAMS_ISOTP),$(PROGRAMS_CANGW),$(PROGRAMS_SLCAN),$(PROGRAMS_CAN_UTILS)}
SOCKETCAN_VERSION = 1235
SOCKETCAN_SOURCE = socketcan-svn-rev$(SOCKETCAN_VERSION).tar.gz
SOCKETCAN_SITE = http://svn.berlios.de/svnroot/repos/socketcan/trunk/
SOCKETCAN_SITE_METHOD = svn

define SOCKETCAN_BUILD_CMDS
	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils CC="$(TARGET_CC)"
endef

define SOCKETCAN_INSTALL_TARGET_CMDS
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(SOCKETCAN_DIR)/can-utils install
	$(TARGET_STRIP) $(TARGET_DIR)/usr/local/bin/$(PROGRAMS)
endef

define SOCKETCAN_CLEAN_CMDS
	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils clean
endef

define SOCKETCAN_UNINSTALL_TARGET_CMDS
	rm -rf $(SOCKETCAN_DIR)
endef

$(eval $(call GENTARGETS,package,socketcan))
