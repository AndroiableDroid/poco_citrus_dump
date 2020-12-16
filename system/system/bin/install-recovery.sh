#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:770753f1337f9e3abda9b838dd19f6015915ed41; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:bc12531504a5debcb3250690f8af3d9c31bdebac \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:770753f1337f9e3abda9b838dd19f6015915ed41 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
