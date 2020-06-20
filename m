Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D58202263
	for <lists+xdp-newbies@lfdr.de>; Sat, 20 Jun 2020 09:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgFTHjf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 20 Jun 2020 03:39:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33699 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725880AbgFTHjb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 20 Jun 2020 03:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592638767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9l8bX1JKmS3ZUvy2irnDeee0KT0i3PN0x6DcoxJbiVU=;
        b=CQn4nzKPhsZk4y5ZkQoW1BA8EIw0DOLCr+JuFYez04YNdzvBFhbgX9KxPk7a2jT6CS6cXk
        LGW49flcKxZUvwUz5hbDCV77MEfXIh5I9NE+8VD+B/N5TldSUFWirFIZkb/hnFdx8eKvXs
        LFnuV8c881rk4LI5efRblofxZzqKBBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-mc07k32RNDmkWkcui5E3MQ-1; Sat, 20 Jun 2020 03:39:23 -0400
X-MC-Unique: mc07k32RNDmkWkcui5E3MQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8AC1DB36;
        Sat, 20 Jun 2020 07:39:21 +0000 (UTC)
Received: from carbon (unknown [10.40.208.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4267119C4F;
        Sat, 20 Jun 2020 07:39:16 +0000 (UTC)
Date:   Sat, 20 Jun 2020 09:39:14 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Saddique A S <saddique.picasa@gmail.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org,
        Tariq Toukan <ttoukan.linux@gmail.com>,
        Maxim Mikityanskiy <maximmi@mellanox.com>
Subject: Re: CQ error on CQN 0x43e, syndrome 0x1
Message-ID: <20200620093914.4c2277d6@carbon>
In-Reply-To: <CAFqFp6EL0xUsmTK3yRa01C40+FZr6Dh+5W8Ek759wxbF96knPw@mail.gmail.com>
References: <CAFqFp6EL0xUsmTK3yRa01C40+FZr6Dh+5W8Ek759wxbF96knPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Below looks like a Mellanox specific driver/HW issue.
Could someone from Mellanox please take a look?


On Fri, 19 Jun 2020 11:51:13 -0700
Saddique A S <saddique.picasa@gmail.com> wrote:

> Hi,
>
> I am running the AF_XDP application in zero copy in a  VM(with kernel
> 5.7.2) . At around 4.2Mpps ( 650 byte packets), the following message
> starts appearing in dmesg
> 
> [ 1772.647659] mlx5_core 0000:00:06.0: cq_err_event_notifier:492:(pid
> 0): CQ error on CQN 0x43e, syndrome 0x1
> [ 1772.647666] mlx5_core 0000:00:06.0 ens6np0: mlx5e_cq_error_event:
> cqn=0x00043e event=0x04
> 
> Can you please let me know what does this error mean?. Here are the
> system details.
> 
> [ubuntu@lmg-vm2 ~]$ uname -a
> Linux lmg-vm2.ncse.io 5.7.2-1.el8.elrepo.x86_64 #1 SMP Tue Jun 9
> 15:21:08 EDT 2020 x86_64 x86_64 x86_64 GNU/Linux
> 
> 
> 
> [ubuntu@lmg-vm2 ~]$ ethtool -i ens8np0
> 
> driver: mlx5_core
> 
> version: 5.0-0
> 
> firmware-version: 16.27.2008 (MT_0000000013)
> 
> expansion-rom-version:
> 
> bus-info: 0000:00:08.0
> 
> supports-statistics: yes
> 
> supports-test: yes
> 
> supports-eeprom-access: no
> 
> supports-register-dump: no
> 
> supports-priv-flags: yes
> 
> 
> 
> 
> 
> [ubuntu@lmg-vm2 ~]$ modinfo mlx5_core
> 
> filename:
> /lib/modules/5.7.2-1.el8.elrepo.x86_64/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko.xz
> 
> version:        5.0-0
> 
> license:        Dual BSD/GPL
> 
> description:    Mellanox 5th generation network adapters (ConnectX
> series) core driver
> 
> author:         Eli Cohen <eli@mellanox.com>
> 
> srcversion:     FE61933130A0F0255BCDE1E
> 
> alias:          pci:v000015B3d0000A2D6sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000A2D3sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000A2D2sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001021sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Fsv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Esv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Dsv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Csv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Bsv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d0000101Asv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001019sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001018sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001017sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001016sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001015sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001014sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001013sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001012sv*sd*bc*sc*i*
> 
> alias:          pci:v000015B3d00001011sv*sd*bc*sc*i*
> 
> depends:        nf_flow_table,pci-hyperv-intf,mlxfw,act_ct
> 
> retpoline:      Y
> 
> intree:         Y
> 
> name:           mlx5_core
> 
> vermagic:       5.7.2-1.el8.elrepo.x86_64 SMP mod_unload modversions
> 
> parm:           debug_mask:debug mask: 1 = dump cmd data, 2 = dump cmd
> exec time, 3 = both. Default=0 (uint)
> 
> parm:           prof_sel:profile selector. Valid range 0 - 2 (uint)
> 
> 
> 
> 
> 
> 
> 
> On the hypervisor:
> 
> 
> 
> root@daytona3:/home/cse# mlxconfig -d /dev/mst/mt4121_pciconf0 q
> 
> 
> 
> Device #1:
> 
> ----------
> 
> 
> 
> Device type:    ConnectX5
> 
> Name:           MCX516A-CDA_Ax
> 
> Description:    ConnectX-5 Ex EN network interface card; 100GbE
> dual-port QSFP28; PCIe4.0 x16; tall bracket; ROHS R6
> 
> Device:         /dev/mst/mt4121_pciconf0
> 
> 
> 
> Configurations:                              Next Boot
> 
>          MEMIC_BAR_SIZE                      0
> 
>          MEMIC_SIZE_LIMIT                    _256KB(1)
> 
>          HOST_CHAINING_MODE                  DISABLED(0)
> 
>          HOST_CHAINING_DESCRIPTORS           Array[0..7]
> 
>          HOST_CHAINING_TOTAL_BUFFER_SIZE     Array[0..7]
> 
>          FLEX_PARSER_PROFILE_ENABLE          0
> 
>          FLEX_IPV4_OVER_VXLAN_PORT           0
> 
>          ROCE_NEXT_PROTOCOL                  254
> 
>          ESWITCH_HAIRPIN_DESCRIPTORS         Array[0..7]
> 
>          ESWITCH_HAIRPIN_TOT_BUFFER_SIZE     Array[0..7]
> 
>          PF_BAR2_SIZE                        0
> 
>          NON_PREFETCHABLE_PF_BAR             False(0)
> 
>          VF_VPD_ENABLE                       False(0)
> 
>          STRICT_VF_MSIX_NUM                  False(0)
> 
>          VF_NODNIC_ENABLE                    False(0)
> 
>          NUM_OF_VFS                          6
> 
>          PF_BAR2_ENABLE                      False(0)
> 
>          SRIOV_EN                            True(1)
> 
>          PF_LOG_BAR_SIZE                     5
> 
>          VF_LOG_BAR_SIZE                     1
> 
>          NUM_PF_MSIX                         63
> 
>          NUM_VF_MSIX                         11
> 
>          INT_LOG_MAX_PAYLOAD_SIZE            AUTOMATIC(0)
> 
>          PCIE_CREDIT_TOKEN_TIMEOUT           0
> 
>          PARTIAL_RESET_EN                    False(0)
> 
>          SW_RECOVERY_ON_ERRORS               False(0)
> 
>          RESET_WITH_HOST_ON_ERRORS           False(0)
> 
>          ADVANCED_POWER_SETTINGS             False(0)
> 
>          CQE_COMPRESSION                     BALANCED(0)
> 
>          IP_OVER_VXLAN_EN                    False(0)
> 
>          MKEY_BY_NAME                        False(0)
> 
>          ESWITCH_IPV4_TTL_MODIFY_ENABLE      False(0)
> 
>          PRIO_TAG_REQUIRED_EN                False(0)
> 
>          UCTX_EN                             False(0)
> 
>          PCI_ATOMIC_MODE
> PCI_ATOMIC_DISABLED_EXT_ATOMIC_ENABLED(0)
> 
>          TUNNEL_ECN_COPY_DISABLE             False(0)
> 
>          LRO_LOG_TIMEOUT0                    6
> 
>          LRO_LOG_TIMEOUT1                    7
> 
>          LRO_LOG_TIMEOUT2                    8
> 
>          LRO_LOG_TIMEOUT3                    13
> 
>          LOG_DCR_HASH_TABLE_SIZE             11
> 
>          DCR_LIFO_SIZE                       16384
> 
>          ROCE_CC_PRIO_MASK_P1                255
> 
>          ROCE_CC_ALGORITHM_P1                ECN(0)
> 
>          ROCE_CC_PRIO_MASK_P2                255
> 
>          ROCE_CC_ALGORITHM_P2                ECN(0)
> 
>          CLAMP_TGT_RATE_AFTER_TIME_INC_P1    True(1)
> 
>          CLAMP_TGT_RATE_P1                   False(0)
> 
>          RPG_TIME_RESET_P1                   300
> 
>          RPG_BYTE_RESET_P1                   32767
> 
>          RPG_THRESHOLD_P1                    1
> 
>          RPG_MAX_RATE_P1                     0
> 
>          RPG_AI_RATE_P1                      5
> 
>          RPG_HAI_RATE_P1                     50
> 
>          RPG_GD_P1                           11
> 
>          RPG_MIN_DEC_FAC_P1                  50
> 
>          RPG_MIN_RATE_P1                     1
> 
>          RATE_TO_SET_ON_FIRST_CNP_P1         0
> 
>          DCE_TCP_G_P1                        1019
> 
>          DCE_TCP_RTT_P1                      1
> 
>          RATE_REDUCE_MONITOR_PERIOD_P1       4
> 
>          INITIAL_ALPHA_VALUE_P1              1023
> 
>          MIN_TIME_BETWEEN_CNPS_P1            2
> 
>          CNP_802P_PRIO_P1                    6
> 
>          CNP_DSCP_P1                         48
> 
>          CLAMP_TGT_RATE_AFTER_TIME_INC_P2    True(1)
> 
>          CLAMP_TGT_RATE_P2                   False(0)
> 
>          RPG_TIME_RESET_P2                   300
> 
>          RPG_BYTE_RESET_P2                   32767
> 
>          RPG_THRESHOLD_P2                    1
> 
>          RPG_MAX_RATE_P2                     0
> 
>          RPG_AI_RATE_P2                      5
> 
>          RPG_HAI_RATE_P2                     50
> 
>          RPG_GD_P2                           11
> 
>          RPG_MIN_DEC_FAC_P2                  50
> 
>          RPG_MIN_RATE_P2                     1
> 
>          RATE_TO_SET_ON_FIRST_CNP_P2         0
> 
>          DCE_TCP_G_P2                        1019
> 
>          DCE_TCP_RTT_P2                      1
> 
>          RATE_REDUCE_MONITOR_PERIOD_P2       4
> 
>          INITIAL_ALPHA_VALUE_P2              1023
> 
>          MIN_TIME_BETWEEN_CNPS_P2            2
> 
>          CNP_802P_PRIO_P2                    6
> 
>          CNP_DSCP_P2                         48
> 
>          LLDP_NB_DCBX_P1                     False(0)
> 
>          LLDP_NB_RX_MODE_P1                  OFF(0)
> 
>          LLDP_NB_TX_MODE_P1                  OFF(0)
> 
>          LLDP_NB_DCBX_P2                     False(0)
> 
>          LLDP_NB_RX_MODE_P2                  OFF(0)
> 
>          LLDP_NB_TX_MODE_P2                  OFF(0)
> 
>          DCBX_IEEE_P1                        True(1)
> 
>          DCBX_CEE_P1                         True(1)
> 
>          DCBX_WILLING_P1                     True(1)
> 
>          DCBX_IEEE_P2                        True(1)
> 
>          DCBX_CEE_P2                         True(1)
> 
>          DCBX_WILLING_P2                     True(1)
> 
>          KEEP_ETH_LINK_UP_P1                 True(1)
> 
>          KEEP_IB_LINK_UP_P1                  False(0)
> 
>          KEEP_LINK_UP_ON_BOOT_P1             False(0)
> 
>          KEEP_LINK_UP_ON_STANDBY_P1          False(0)
> 
>          KEEP_ETH_LINK_UP_P2                 True(1)
> 
>          KEEP_IB_LINK_UP_P2                  False(0)
> 
>          KEEP_LINK_UP_ON_BOOT_P2             False(0)
> 
>          KEEP_LINK_UP_ON_STANDBY_P2          False(0)
> 
>          NUM_OF_VL_P1                        _4_VLs(3)
> 
>          NUM_OF_TC_P1                        _8_TCs(0)
> 
>          NUM_OF_PFC_P1                       8
> 
>          NUM_OF_VL_P2                        _4_VLs(3)
> 
>          NUM_OF_TC_P2                        _8_TCs(0)
> 
>          NUM_OF_PFC_P2                       8
> 
>          DUP_MAC_ACTION_P1                   LAST_CFG(0)
> 
>          SRIOV_IB_ROUTING_MODE_P1            LID(1)
> 
>          IB_ROUTING_MODE_P1                  LID(1)
> 
>          DUP_MAC_ACTION_P2                   LAST_CFG(0)
> 
>          SRIOV_IB_ROUTING_MODE_P2            LID(1)
> 
>          IB_ROUTING_MODE_P2                  LID(1)
> 
>          PCI_WR_ORDERING                     per_mkey(0)
> 
>          MULTI_PORT_VHCA_EN                  False(0)
> 
>          PORT_OWNER                          True(1)
> 
>          ALLOW_RD_COUNTERS                   True(1)
> 
>          RENEG_ON_CHANGE                     True(1)
> 
>          TRACER_ENABLE                       True(1)
> 
>          IP_VER                              IPv4(0)
> 
>          BOOT_UNDI_NETWORK_WAIT              0
> 
>          UEFI_HII_EN                         False(0)
> 
>          BOOT_DBG_LOG                        False(0)
> 
>          UEFI_LOGS                           DISABLED(0)
> 
>          BOOT_VLAN                           1
> 
>          LEGACY_BOOT_PROTOCOL                PXE(1)
> 
>          BOOT_INTERRUPT_DIS                  False(0)
> 
>          BOOT_LACP_DIS                       True(1)
> 
>          BOOT_VLAN_EN                        False(0)
> 
>          BOOT_PKEY                           0
> 
>          ATS_ENABLED                         False(0)
> 
>          DYNAMIC_VF_MSIX_TABLE               False(0)
> 
>          EXP_ROM_UEFI_x86_ENABLE             False(0)
> 
>          EXP_ROM_PXE_ENABLE                  True(1)
> 
>          ADVANCED_PCI_SETTINGS               False(0)
> 
>          SAFE_MODE_THRESHOLD                 10
> 
>          SAFE_MODE_ENABLE                    True(1)
> 
> root@daytona3:/home/cse#
> 
> 
> Thanks
> 
> Saddique
> 



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

