# Android device tree for huawei-agassi with mainline kernel

## Kernel repository

|               Path               |                    URL                    |         Branch         |
|----------------------------------|-------------------------------------------|------------------------|
| kernel/mainline/msm89x7-mainline | https://github.com/msm89x7-mainline/linux | msm89x7/6.19-develop   |

## Kernel edits

- After applying kernel patches specified below, on `mm/Kconfig`, on config option `MEMFD_ASHMEM_SHIM`, remove the dependency on `ASHMEM_C`.

## Kernel patches

| Commit name | Purpose | Source |
|-------------|---------|--------|
| `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` | Fixes USB in normal mode | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-usb-gadget-configfs-Add-Uevent-to-notify-userspace.patch |
| `ANDROID: mm/memfd-ashmem-shim: Introduce shim layer` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-memfd-ashmem-shim-Introduce-shim-layer.patch |
| `ANDROID: mm: shmem: Use memfd-ashmem-shim ioctl handler"` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-shmem-Use-memfd-ashmem-shim-ioctl-handler.patch |
