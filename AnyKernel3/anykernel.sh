# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Cherry Kernel - by @AkiraNoSushi & @SimplyJoel
do.devicecheck=1
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=pine
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel install
split_boot;
flash_boot;
flash_dtbo;

# lmkd props
ui_print "Mounting /system to patch build.prop..."
mount -o rw,remount /system
ui_print "Patching system's build.prop..."
# These are lmkd defaults
patch_prop /system/build.prop "ro.lmk.kill_heaviest_task" "true"
patch_prop /system/build.prop "ro.lmk.use_minfree_levels" "true"
patch_prop /system/build.prop "ro.lmk.use_psi" "true"
patch_prop /system/build.prop "ro.lmk.kill_timeout_ms" "100"
## end install
## end install

