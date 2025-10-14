CC_DEFAULT ?= vc
AS_DEFAULT ?= vc
LD_DEFAULT ?= $(CC_DEFAULT)
AR_DEFAULT ?= $(AS_DEFAULT)

include $(MWD)/tc-common.mk

CFLAGS +=
ASFLAGS +=
LDFLAGS +=

# Needed because of using sed on error messages
SHELL = /bin/bash -o pipefail

define include-dir-flag
  -I$1
endef

define asm-include-dir-flag
  -I$1
endef

define library-dir-flag
  -L$1
endef

define library-flag
  -l$1
endef

define link-lib
  $(AR) -x$1 $2
endef

define link-bin
  $(LD) $(LDFLAGS) $2 $(LIBS) -o $1
endef

define compile
  $(CC) -c $(CFLAGS) -o $1 $2 2>&1 | sed -e 's/\(error\|warning\) \([0-9]\+\) in line \([0-9]\+\) of "\([^"]\+\)":/\4:\3:\1 \2:/'
endef

define assemble
  $(AS) $(ASFLAGS) -o=$1 $2
endef
