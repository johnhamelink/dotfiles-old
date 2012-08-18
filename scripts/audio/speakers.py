#!/usr/bin/env python

import os
import struct
from fcntl import ioctl

def __ioctl_val(val):
  # workaround for OverFlow bug in python 2.4
  if val & 0x80000000:
    return -((val^0xffffffff)+1)
  return val

IOCTL_INFO = __ioctl_val(0x80dc4801)
IOCTL_PVERSION = __ioctl_val(0x80044810)
IOCTL_VERB_WRITE = __ioctl_val(0xc0084811)

def set(nid, verb, param):
  verb = (nid << 24) | (verb << 8) | param
  res = ioctl(FD, IOCTL_VERB_WRITE, struct.pack('II', verb, 0))  

FD = os.open("/dev/snd/hwC0D0", os.O_RDONLY)
info = struct.pack('Ii64s80si64s', 0, 0, '', '', 0, '')
res = ioctl(FD, IOCTL_INFO, info)
name = struct.unpack('Ii64s80si64s', res)[3]
if not name.startswith('HDA Codec'):
  raise IOError, "unknown HDA hwdep interface"
res = ioctl(FD, IOCTL_PVERSION, struct.pack('I', 0))
version = struct.unpack('I', res)
if version < 0x00010000:	# 1.0.0
  raise IOError, "unknown HDA hwdep version"

# initialization sequence starts here...

set(0x01, 0x715,   0x08) # 0x01071508 (SET_GPIO_DATA)
set(0x01, 0x716,   0x08) # 0x01071608 (SET_GPIO_MASK)
set(0x01, 0x717,   0x08) # 0x01071708 (SET_GPIO_DIRECTION)
set(0x02, 0x300, 0xa041) # 0x0203a041 (SET_AMP_GAIN_MUTE)
set(0x02, 0x300, 0x9041) # 0x02039041 (SET_AMP_GAIN_MUTE)
set(0x03, 0x300, 0xa000) # 0x0303a000 (SET_AMP_GAIN_MUTE)
set(0x03, 0x300, 0x9000) # 0x03039000 (SET_AMP_GAIN_MUTE)
set(0x04, 0x300, 0xa05a) # 0x0403a05a (SET_AMP_GAIN_MUTE)
set(0x04, 0x300, 0x905a) # 0x0403905a (SET_AMP_GAIN_MUTE)

os.close(FD)
