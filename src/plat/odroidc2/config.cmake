#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: GPL-2.0-only
#

declare_platform(odroidc2 KernelPlatformOdroidc2 PLAT_ODROIDC2 KernelSel4ArchAarch64)

if(KernelPlatformOdroidc2)
    declare_seL4_arch(aarch64)
    set(KernelArmCortexA53 ON)
    set(KernelArchArmV8a ON)
    config_set(KernelARMPlatform ARM_PLAT odroidc2)
    set(KernelArmMachFeatureModifiers "+crc" CACHE INTERNAL "")
    list(APPEND KernelDTSList "tools/dts/odroidc2.dts")
    list(APPEND KernelDTSList "src/plat/odroidc2/overlay-odroidc2.dts")
    declare_default_headers(
        TIMER_FREQUENCY 24000000
        MAX_IRQ 250
        NUM_PPI 32
        TIMER drivers/timer/arm_generic.h
        INTERRUPT_CONTROLLER arch/machine/gic_v2.h
        CLK_MAGIC 375299969u
        CLK_SHIFT 53u
        KERNEL_WCET 10u
        TIMER_PRECISION 1u
    )
endif()

add_sources(
    DEP "KernelPlatformOdroidc2"
    CFILES src/arch/arm/machine/gic_v2.c src/arch/arm/machine/l2c_nop.c
)
