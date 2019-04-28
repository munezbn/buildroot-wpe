################################################################################
#
# cog
#
################################################################################

COG_VERSION = 0.3.0
COG_SITE = https://github.com/Igalia/cog/releases/download/v$(COG_VERSION)
COG_SOURCE = cog-$(COG_VERSION).tar.xz
COG_DEPENDENCIES = libglib2 libwpe wpewebkit
COG_LICENSE = MIT
COG_LICENSE_FILES = COPYING
COG_CONF_OPTS = \
	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'

ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
COG_DEPENDENCIES += libegl libgles wayland wpebackend-fdo
COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
else
COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
endif

ifeq ($(BR2_PACKAGE_COG_PROGRAMS),y)
COG_CONF_OPTS += -DCOG_BUILD_PROGRAMS=ON
else
COG_CONF_OPTS += -DCOG_BUILD_PROGRAMS=OFF
endif

ifeq ($(BR2_PACKAGE_COG_PROGRAMS_DBUS_SYSTEM_BUS),y)
COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
else
COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
endif

$(eval $(cmake-package))
