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

set(0x01, 0x715,   0x04) # 0x01071504 (SET_GPIO_DATA)
set(0x01, 0x716,   0x04) # 0x01071604 (SET_GPIO_MASK)
set(0x01, 0x717,   0x04) # 0x01071704 (SET_GPIO_DIRECTION)
set(0x02, 0x300, 0xa0c1) # 0x0203a0c1 (SET_AMP_GAIN_MUTE)
set(0x02, 0x300, 0x90c1) # 0x020390c1 (SET_AMP_GAIN_MUTE)
set(0x03, 0x300, 0xa05a) # 0x0303a05a (SET_AMP_GAIN_MUTE)
set(0x03, 0x300, 0x905a) # 0x0303905a (SET_AMP_GAIN_MUTE)
set(0x04, 0x300, 0xa0da) # 0x0403a0da (SET_AMP_GAIN_MUTE)
set(0x04, 0x300, 0x90da) # 0x040390da (SET_AMP_GAIN_MUTE)
set(0x07, 0x70d,   0x19) # 0x07070d19 (SET_DIGI_CONVERT_1)

os.close(FD)
