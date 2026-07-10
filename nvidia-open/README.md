## modeset
```
# /etc/modprobe.d/nvidia.conf

options nvidia_drm modeset=1
```

## Early KMS
```
# /etc/mkinitcpio.conf

# i915 Mdoule for Intel iGPU with Nvidia dGPU
MODULES=(... i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
```

Don't forget to rebuild initramfs with `mkinitcpio -P`
