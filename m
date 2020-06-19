Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF6C201ABE
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Jun 2020 20:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388625AbgFSSv1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 19 Jun 2020 14:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388528AbgFSSv0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 19 Jun 2020 14:51:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532F6C06174E
        for <xdp-newbies@vger.kernel.org>; Fri, 19 Jun 2020 11:51:26 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m26so6129452lfo.13
        for <xdp-newbies@vger.kernel.org>; Fri, 19 Jun 2020 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Tid3qdJWuZm4n3XRmY/H1z+xVfmFGo5uy1GlvwzmeC8=;
        b=lughr17eURXuEadXb1eAPWk1ujlL+5WqzYf1iNpZOkSqzAPcnCZRG4139QYJnXAWz1
         BadgDmY+5FGiGdPn5k6TQcmPoMNKKmXso1iip0N7yXs4bTnXCnie3UdaTehZVHMvHeJF
         90odBeGhQZwysKiF84kVUCHyrEGYvAiGdSGmeDS6BLew5grDt1gXHShISlfVNsIkMTYh
         cc3afBw3mLaROlYXja8lhbPldz/K3m5HBEN7gt3TM1Tb/TRUbtu2S1Tm/Z1XqTSY803e
         nIbH5+lcjxZsL0pO/bRCoTWNVx2PbpLOn5dgTElYXJWhDYvTsdYL56Im4Ag/1Tb5Xuk/
         M0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Tid3qdJWuZm4n3XRmY/H1z+xVfmFGo5uy1GlvwzmeC8=;
        b=JzUy9dKCPis5CAz6UlmopSsfzjXfjGdcYH2W/2zHxjk7dKKYGb+Rwz4XCG4XkKvXTg
         m/LurcAp9f5+cVGJqHKNl6tyc4BqBb2623AjWZDnZZJgJ537pISeW4fHnD2pQDNWqFK6
         te/nRLdJnVRBxtWl3V/ubC+tb9MC/Gho7Hwa3/KbcXxSS7S3HQZ4Ua4mJs6lzZK8gkyB
         CE55VPp7i65BjhQ49sloWUW7Ecoo0oU0J+mSjImBtN9G7jKpBj/GGOMK93PdYuV+QQZK
         C/ZIgHK6e+1MM3sdV7Q+wS+4Ruo+miF/jCB1OdztWlQ1pK08/7NnGomYkTtgQDxPtJsr
         osTg==
X-Gm-Message-State: AOAM532EBGAtEAOg8rpK09+CdNz2pMX+K6Jf0n97ITkcNiwcTz57ACGB
        KOcBX0EGnvNZ2DHnLJhARRFS3yDWNhiyrHTL8hT3uXEbXiE=
X-Google-Smtp-Source: ABdhPJz/JIdNIy7hZEREl6tIZGclcEgViSJ02x2ILForMfhbKMQK6KYfGEqQmXXOEM5KwpqAUCyPvzBCeMthAzUxG6c=
X-Received: by 2002:a19:385a:: with SMTP id d26mr2717278lfj.211.1592592684097;
 Fri, 19 Jun 2020 11:51:24 -0700 (PDT)
MIME-Version: 1.0
From:   Saddique A S <saddique.picasa@gmail.com>
Date:   Fri, 19 Jun 2020 11:51:13 -0700
Message-ID: <CAFqFp6EL0xUsmTK3yRa01C40+FZr6Dh+5W8Ek759wxbF96knPw@mail.gmail.com>
Subject: CQ error on CQN 0x43e, syndrome 0x1
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,
I am running the AF_XDP application in zero copy in a  VM(with kernel
5.7.2) . At around 4.2Mpps ( 650 byte packets), the following message
starts appearing in dmesg

[ 1772.647659] mlx5_core 0000:00:06.0: cq_err_event_notifier:492:(pid
0): CQ error on CQN 0x43e, syndrome 0x1
[ 1772.647666] mlx5_core 0000:00:06.0 ens6np0: mlx5e_cq_error_event:
cqn=0x00043e event=0x04

Can you please let me know what does this error mean?. Here are the
system details.

[ubuntu@lmg-vm2 ~]$ uname -a
Linux lmg-vm2.ncse.io 5.7.2-1.el8.elrepo.x86_64 #1 SMP Tue Jun 9
15:21:08 EDT 2020 x86_64 x86_64 x86_64 GNU/Linux



[ubuntu@lmg-vm2 ~]$ ethtool -i ens8np0

driver: mlx5_core

version: 5.0-0

firmware-version: 16.27.2008 (MT_0000000013)

expansion-rom-version:

bus-info: 0000:00:08.0

supports-statistics: yes

supports-test: yes

supports-eeprom-access: no

supports-register-dump: no

supports-priv-flags: yes





[ubuntu@lmg-vm2 ~]$ modinfo mlx5_core

filename:
/lib/modules/5.7.2-1.el8.elrepo.x86_64/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko.xz

version:        5.0-0

license:        Dual BSD/GPL

description:    Mellanox 5th generation network adapters (ConnectX
series) core driver

author:         Eli Cohen <eli@mellanox.com>

srcversion:     FE61933130A0F0255BCDE1E

alias:          pci:v000015B3d0000A2D6sv*sd*bc*sc*i*

alias:          pci:v000015B3d0000A2D3sv*sd*bc*sc*i*

alias:          pci:v000015B3d0000A2D2sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001021sv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Fsv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Esv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Dsv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Csv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Bsv*sd*bc*sc*i*

alias:          pci:v000015B3d0000101Asv*sd*bc*sc*i*

alias:          pci:v000015B3d00001019sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001018sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001017sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001016sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001015sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001014sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001013sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001012sv*sd*bc*sc*i*

alias:          pci:v000015B3d00001011sv*sd*bc*sc*i*

depends:        nf_flow_table,pci-hyperv-intf,mlxfw,act_ct

retpoline:      Y

intree:         Y

name:           mlx5_core

vermagic:       5.7.2-1.el8.elrepo.x86_64 SMP mod_unload modversions

parm:           debug_mask:debug mask: 1 = dump cmd data, 2 = dump cmd
exec time, 3 = both. Default=0 (uint)

parm:           prof_sel:profile selector. Valid range 0 - 2 (uint)







On the hypervisor:



root@daytona3:/home/cse# mlxconfig -d /dev/mst/mt4121_pciconf0 q



Device #1:

----------



Device type:    ConnectX5

Name:           MCX516A-CDA_Ax

Description:    ConnectX-5 Ex EN network interface card; 100GbE
dual-port QSFP28; PCIe4.0 x16; tall bracket; ROHS R6

Device:         /dev/mst/mt4121_pciconf0



Configurations:                              Next Boot

         MEMIC_BAR_SIZE                      0

         MEMIC_SIZE_LIMIT                    _256KB(1)

         HOST_CHAINING_MODE                  DISABLED(0)

         HOST_CHAINING_DESCRIPTORS           Array[0..7]

         HOST_CHAINING_TOTAL_BUFFER_SIZE     Array[0..7]

         FLEX_PARSER_PROFILE_ENABLE          0

         FLEX_IPV4_OVER_VXLAN_PORT           0

         ROCE_NEXT_PROTOCOL                  254

         ESWITCH_HAIRPIN_DESCRIPTORS         Array[0..7]

         ESWITCH_HAIRPIN_TOT_BUFFER_SIZE     Array[0..7]

         PF_BAR2_SIZE                        0

         NON_PREFETCHABLE_PF_BAR             False(0)

         VF_VPD_ENABLE                       False(0)

         STRICT_VF_MSIX_NUM                  False(0)

         VF_NODNIC_ENABLE                    False(0)

         NUM_OF_VFS                          6

         PF_BAR2_ENABLE                      False(0)

         SRIOV_EN                            True(1)

         PF_LOG_BAR_SIZE                     5

         VF_LOG_BAR_SIZE                     1

         NUM_PF_MSIX                         63

         NUM_VF_MSIX                         11

         INT_LOG_MAX_PAYLOAD_SIZE            AUTOMATIC(0)

         PCIE_CREDIT_TOKEN_TIMEOUT           0

         PARTIAL_RESET_EN                    False(0)

         SW_RECOVERY_ON_ERRORS               False(0)

         RESET_WITH_HOST_ON_ERRORS           False(0)

         ADVANCED_POWER_SETTINGS             False(0)

         CQE_COMPRESSION                     BALANCED(0)

         IP_OVER_VXLAN_EN                    False(0)

         MKEY_BY_NAME                        False(0)

         ESWITCH_IPV4_TTL_MODIFY_ENABLE      False(0)

         PRIO_TAG_REQUIRED_EN                False(0)

         UCTX_EN                             False(0)

         PCI_ATOMIC_MODE
PCI_ATOMIC_DISABLED_EXT_ATOMIC_ENABLED(0)

         TUNNEL_ECN_COPY_DISABLE             False(0)

         LRO_LOG_TIMEOUT0                    6

         LRO_LOG_TIMEOUT1                    7

         LRO_LOG_TIMEOUT2                    8

         LRO_LOG_TIMEOUT3                    13

         LOG_DCR_HASH_TABLE_SIZE             11

         DCR_LIFO_SIZE                       16384

         ROCE_CC_PRIO_MASK_P1                255

         ROCE_CC_ALGORITHM_P1                ECN(0)

         ROCE_CC_PRIO_MASK_P2                255

         ROCE_CC_ALGORITHM_P2                ECN(0)

         CLAMP_TGT_RATE_AFTER_TIME_INC_P1    True(1)

         CLAMP_TGT_RATE_P1                   False(0)

         RPG_TIME_RESET_P1                   300

         RPG_BYTE_RESET_P1                   32767

         RPG_THRESHOLD_P1                    1

         RPG_MAX_RATE_P1                     0

         RPG_AI_RATE_P1                      5

         RPG_HAI_RATE_P1                     50

         RPG_GD_P1                           11

         RPG_MIN_DEC_FAC_P1                  50

         RPG_MIN_RATE_P1                     1

         RATE_TO_SET_ON_FIRST_CNP_P1         0

         DCE_TCP_G_P1                        1019

         DCE_TCP_RTT_P1                      1

         RATE_REDUCE_MONITOR_PERIOD_P1       4

         INITIAL_ALPHA_VALUE_P1              1023

         MIN_TIME_BETWEEN_CNPS_P1            2

         CNP_802P_PRIO_P1                    6

         CNP_DSCP_P1                         48

         CLAMP_TGT_RATE_AFTER_TIME_INC_P2    True(1)

         CLAMP_TGT_RATE_P2                   False(0)

         RPG_TIME_RESET_P2                   300

         RPG_BYTE_RESET_P2                   32767

         RPG_THRESHOLD_P2                    1

         RPG_MAX_RATE_P2                     0

         RPG_AI_RATE_P2                      5

         RPG_HAI_RATE_P2                     50

         RPG_GD_P2                           11

         RPG_MIN_DEC_FAC_P2                  50

         RPG_MIN_RATE_P2                     1

         RATE_TO_SET_ON_FIRST_CNP_P2         0

         DCE_TCP_G_P2                        1019

         DCE_TCP_RTT_P2                      1

         RATE_REDUCE_MONITOR_PERIOD_P2       4

         INITIAL_ALPHA_VALUE_P2              1023

         MIN_TIME_BETWEEN_CNPS_P2            2

         CNP_802P_PRIO_P2                    6

         CNP_DSCP_P2                         48

         LLDP_NB_DCBX_P1                     False(0)

         LLDP_NB_RX_MODE_P1                  OFF(0)

         LLDP_NB_TX_MODE_P1                  OFF(0)

         LLDP_NB_DCBX_P2                     False(0)

         LLDP_NB_RX_MODE_P2                  OFF(0)

         LLDP_NB_TX_MODE_P2                  OFF(0)

         DCBX_IEEE_P1                        True(1)

         DCBX_CEE_P1                         True(1)

         DCBX_WILLING_P1                     True(1)

         DCBX_IEEE_P2                        True(1)

         DCBX_CEE_P2                         True(1)

         DCBX_WILLING_P2                     True(1)

         KEEP_ETH_LINK_UP_P1                 True(1)

         KEEP_IB_LINK_UP_P1                  False(0)

         KEEP_LINK_UP_ON_BOOT_P1             False(0)

         KEEP_LINK_UP_ON_STANDBY_P1          False(0)

         KEEP_ETH_LINK_UP_P2                 True(1)

         KEEP_IB_LINK_UP_P2                  False(0)

         KEEP_LINK_UP_ON_BOOT_P2             False(0)

         KEEP_LINK_UP_ON_STANDBY_P2          False(0)

         NUM_OF_VL_P1                        _4_VLs(3)

         NUM_OF_TC_P1                        _8_TCs(0)

         NUM_OF_PFC_P1                       8

         NUM_OF_VL_P2                        _4_VLs(3)

         NUM_OF_TC_P2                        _8_TCs(0)

         NUM_OF_PFC_P2                       8

         DUP_MAC_ACTION_P1                   LAST_CFG(0)

         SRIOV_IB_ROUTING_MODE_P1            LID(1)

         IB_ROUTING_MODE_P1                  LID(1)

         DUP_MAC_ACTION_P2                   LAST_CFG(0)

         SRIOV_IB_ROUTING_MODE_P2            LID(1)

         IB_ROUTING_MODE_P2                  LID(1)

         PCI_WR_ORDERING                     per_mkey(0)

         MULTI_PORT_VHCA_EN                  False(0)

         PORT_OWNER                          True(1)

         ALLOW_RD_COUNTERS                   True(1)

         RENEG_ON_CHANGE                     True(1)

         TRACER_ENABLE                       True(1)

         IP_VER                              IPv4(0)

         BOOT_UNDI_NETWORK_WAIT              0

         UEFI_HII_EN                         False(0)

         BOOT_DBG_LOG                        False(0)

         UEFI_LOGS                           DISABLED(0)

         BOOT_VLAN                           1

         LEGACY_BOOT_PROTOCOL                PXE(1)

         BOOT_INTERRUPT_DIS                  False(0)

         BOOT_LACP_DIS                       True(1)

         BOOT_VLAN_EN                        False(0)

         BOOT_PKEY                           0

         ATS_ENABLED                         False(0)

         DYNAMIC_VF_MSIX_TABLE               False(0)

         EXP_ROM_UEFI_x86_ENABLE             False(0)

         EXP_ROM_PXE_ENABLE                  True(1)

         ADVANCED_PCI_SETTINGS               False(0)

         SAFE_MODE_THRESHOLD                 10

         SAFE_MODE_ENABLE                    True(1)

root@daytona3:/home/cse#


Thanks

Saddique
