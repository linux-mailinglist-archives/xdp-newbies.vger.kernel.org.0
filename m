Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C5F2034C4
	for <lists+xdp-newbies@lfdr.de>; Mon, 22 Jun 2020 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgFVKZ0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 22 Jun 2020 06:25:26 -0400
Received: from mail-vi1eur05on2054.outbound.protection.outlook.com ([40.107.21.54]:41569
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727835AbgFVKZZ (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 22 Jun 2020 06:25:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYlY8Il/zlLWYbQGEyCsfIpJIKn6EnaKTbWxFdBiO6wFaa3D0aLaABXrCg5YdyXHfEX6UzC9w4SBScsxeM8fHpnU9dPunMqdOCo5h9XQ+UJnIBq5a66owR/QJg//Iy9nD/3nXEbN9C6fyIjBXjwV3I3n5LMjiVLDkqMFgSX9QYFUez6s9+VS1st/z2/Co3Eb3GjRhd+uHB+J45C/0+tGffjAc8S4vyVyTtiJvECnA3KM+WK9AApEVuYlimxKxYDBooEemvEN0pMjPnrTEdYwYKFnK1d5JyHBHk75N2Iu/qDRm1LxYBWrBWG7Dlqva86nxBc4z4Loz2Yah024MRAZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLDsMz8MjFoZ9Cn4fRLP6288u3AlvjQti2xvnsffngc=;
 b=W38HDxvJnxFWpcXhbns0XLY2plztDMf6pqZxupxGWjm4tctSDVEiuGz45l29KxF1ts/AFV9OnghP+UQrGMYzU6WfIEuVoheyNYJEjoU4qhy9kKZvvGl+UfuZSIbg17cd5rBgkxRthkZqL/e85Bvq2NPojMPN+JafGd31C//T1TilTSCTPFzHVw4LqWtAJx5B+N7iIkvJHG2YCNszvRKyWD5jNRv5+ITtfzzfF+4ZilQnoGJbgMxsAvtq5vCgmo7If7JIyM+uuqBtzaWxJbufxYKzpQEbg3WOPm1M8av3xVkrV0SKLP4pdYDscWbXH8viny/TPws5JPVzOE9MODNU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLDsMz8MjFoZ9Cn4fRLP6288u3AlvjQti2xvnsffngc=;
 b=LCKbB+x8U3UP6sr2yKEv8lzuNmoKgtUB1uE3ZYsXMLaAJ1XktFoEaf5jIfOwKc7S0GGkjJqfyJ5sM3XuyYWB+Jsg62uOSDNcnxf8dwQlpXeK5EZJu7NEXdvspd8MJEiLq+E504RHr6+ul9PeXKUoUXWuZ3lHL87WzdoMI9+KZTg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mellanox.com;
Received: from AM6PR05MB5974.eurprd05.prod.outlook.com (2603:10a6:20b:a7::12)
 by AM6PR05MB5207.eurprd05.prod.outlook.com (2603:10a6:20b:63::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 10:25:20 +0000
Received: from AM6PR05MB5974.eurprd05.prod.outlook.com
 ([fe80::55:e9a6:86b0:8ba2]) by AM6PR05MB5974.eurprd05.prod.outlook.com
 ([fe80::55:e9a6:86b0:8ba2%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:25:20 +0000
Subject: Re: CQ error on CQN 0x43e, syndrome 0x1
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Saddique A S <saddique.picasa@gmail.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>
Cc:     xdp-newbies@vger.kernel.org, Tariq Toukan <ttoukan.linux@gmail.com>
References: <CAFqFp6EL0xUsmTK3yRa01C40+FZr6Dh+5W8Ek759wxbF96knPw@mail.gmail.com>
 <20200620093914.4c2277d6@carbon>
From:   Maxim Mikityanskiy <maximmi@mellanox.com>
Message-ID: <0177d2ab-db9c-2cea-4114-f360f77921b7@mellanox.com>
Date:   Mon, 22 Jun 2020 13:25:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200620093914.4c2277d6@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0035.eurprd03.prod.outlook.com
 (2603:10a6:205:2::48) To AM6PR05MB5974.eurprd05.prod.outlook.com
 (2603:10a6:20b:a7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.57.1.235] (159.224.90.213) by AM4PR0302CA0035.eurprd03.prod.outlook.com (2603:10a6:205:2::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 10:25:19 +0000
X-Originating-IP: [159.224.90.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a6a7f0f-e0ee-483b-b0e9-08d816969074
X-MS-TrafficTypeDiagnostic: AM6PR05MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR05MB52071D5387DA67E154C761B9D1970@AM6PR05MB5207.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DJkfcb7oFHJygFq+B6T5hjPhX7aV+l/NZu8ocRV1nZoHTPBZSYViwe3X/Tq8HpZtOvElNNFaPlpqL+peKjNR8Qv2xIJcQyRft1dhYhxSgPlLT5fccrMjqgjkXClU7uVJc4bahnXh3cWNpzhFvcgHll0RomDN+2cVJpIZOzdvr3HmiR3HknxlTgxF1uE7L5V+rh8LYpgLufdOH8lK6OVtRH0J4g/pJaVY0zLZFhgIuJIXCQ1Au/Ipdpps2h7A646hpWwZhn4sWMAaTu4o/yppOk4YJMeKP/7YsufZy6EwrJ+FLXTGNELGIDz9tO5mrLmwE4qWdV4v5glGYNCiFIWHfkpAyacqZ0yj/xxV7W+lUIl2pRjo+kW5kSEazGgOerw3+2u/xZ3OYPOKd1fiYhcMfZnZ0Xz5ZzbAjoU5gbZHne5nH/Eu2/VHDTVLniX28kM5SYAi2DR1I64Qrjre0G7dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5974.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(31686004)(86362001)(8936002)(186003)(31696002)(16526019)(966005)(8676002)(5660300002)(66556008)(4326008)(66476007)(36756003)(66946007)(16576012)(316002)(110136005)(478600001)(2906002)(6666004)(55236004)(53546011)(26005)(6486002)(956004)(6636002)(2616005)(52116002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6VEPtdzLb0Sf+O+WoYL0UYe4PxnivUiHM2IwC3WAomBI4ngRDhF2f0jTIuaK+4QefFhE0ZmJSwLnWJbMHuDGBGTuDo/8D9XBRAmrUOnxrb83w469aW1VHvNhGLillbBQ4WlqkWPo7FszDGNmrp3ESFK/UtDWBwbj5TW1IjuCon6RNO0FVlRyXoYXTb4Kg5QN7kgjnaVlzRTOcinNgDTLhc6AXezuXr0zagKwki4tnXZ/5STWN+4aDo6jlwO4xOXBXbrjbMvUsL96ZEFfSiO7RQ1AYdW5c0iFEbHajR0MzciLbVXDLDYEm6yd0xxmx7MEJQmFOh1/M33DbQX/VaavLXbJgoGe7morQsjKDWl1YUO/G74vUnfCUJ+WSGkWmJnc3YFXEEui6L1lRewa8dJb+c1mMYpsSTKy+6Hshf4rupjbZQyB/baWL0LvlkodEJsAtX3FffcsNtYABT+Jghl4eiT7BA+Ak347c7vTLKZXGt/vDL8KF8+d9PJkFPbMvxJ9
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6a7f0f-e0ee-483b-b0e9-08d816969074
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 10:25:19.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vfz9YC56twz9Tz8czrqM/DSqCjDYZHwx1xHFvpYBbLkLBvYt8YZornOYkQAk1OJcACf1g+w3IA/GreOc2K7KJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5207
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2020-06-20 10:39, Jesper Dangaard Brouer wrote:
> 
> Below looks like a Mellanox specific driver/HW issue.
> Could someone from Mellanox please take a look?
> 
> 
> On Fri, 19 Jun 2020 11:51:13 -0700
> Saddique A S <saddique.picasa@gmail.com> wrote:
> 
>> Hi,
>>
>> I am running the AF_XDP application in zero copy in a  VM(with kernel
>> 5.7.2) . At around 4.2Mpps ( 650 byte packets), the following message
>> starts appearing in dmesg

Do you do TX when this error appears? If yes, it's probably the XSKICOSQ 
overflow issue fixed recently by this patch:

https://patchwork.ozlabs.org/project/netdev/patch/20200420213606.44292-4-saeedm@mellanox.com/

Though it looks like you run kernel 5.7.2 with the upstream driver 
(right?), which should have this fix. Could you please verify that your 
driver does indeed have this patch? If yes, and it still happens, we'll 
have to reproduce and debug it.

Thanks,
Max

>> [ 1772.647659] mlx5_core 0000:00:06.0: cq_err_event_notifier:492:(pid
>> 0): CQ error on CQN 0x43e, syndrome 0x1
>> [ 1772.647666] mlx5_core 0000:00:06.0 ens6np0: mlx5e_cq_error_event:
>> cqn=0x00043e event=0x04
>>
>> Can you please let me know what does this error mean?. Here are the
>> system details.
>>
>> [ubuntu@lmg-vm2 ~]$ uname -a
>> Linux lmg-vm2.ncse.io 5.7.2-1.el8.elrepo.x86_64 #1 SMP Tue Jun 9
>> 15:21:08 EDT 2020 x86_64 x86_64 x86_64 GNU/Linux
>>
>>
>>
>> [ubuntu@lmg-vm2 ~]$ ethtool -i ens8np0
>>
>> driver: mlx5_core
>>
>> version: 5.0-0
>>
>> firmware-version: 16.27.2008 (MT_0000000013)
>>
>> expansion-rom-version:
>>
>> bus-info: 0000:00:08.0
>>
>> supports-statistics: yes
>>
>> supports-test: yes
>>
>> supports-eeprom-access: no
>>
>> supports-register-dump: no
>>
>> supports-priv-flags: yes
>>
>>
>>
>>
>>
>> [ubuntu@lmg-vm2 ~]$ modinfo mlx5_core
>>
>> filename:
>> /lib/modules/5.7.2-1.el8.elrepo.x86_64/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko.xz
>>
>> version:        5.0-0
>>
>> license:        Dual BSD/GPL
>>
>> description:    Mellanox 5th generation network adapters (ConnectX
>> series) core driver
>>
>> author:         Eli Cohen <eli@mellanox.com>
>>
>> srcversion:     FE61933130A0F0255BCDE1E
>>
>> alias:          pci:v000015B3d0000A2D6sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000A2D3sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000A2D2sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001021sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Fsv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Esv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Dsv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Csv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Bsv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d0000101Asv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001019sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001018sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001017sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001016sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001015sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001014sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001013sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001012sv*sd*bc*sc*i*
>>
>> alias:          pci:v000015B3d00001011sv*sd*bc*sc*i*
>>
>> depends:        nf_flow_table,pci-hyperv-intf,mlxfw,act_ct
>>
>> retpoline:      Y
>>
>> intree:         Y
>>
>> name:           mlx5_core
>>
>> vermagic:       5.7.2-1.el8.elrepo.x86_64 SMP mod_unload modversions
>>
>> parm:           debug_mask:debug mask: 1 = dump cmd data, 2 = dump cmd
>> exec time, 3 = both. Default=0 (uint)
>>
>> parm:           prof_sel:profile selector. Valid range 0 - 2 (uint)
>>
>>
>>
>>
>>
>>
>>
>> On the hypervisor:
>>
>>
>>
>> root@daytona3:/home/cse# mlxconfig -d /dev/mst/mt4121_pciconf0 q
>>
>>
>>
>> Device #1:
>>
>> ----------
>>
>>
>>
>> Device type:    ConnectX5
>>
>> Name:           MCX516A-CDA_Ax
>>
>> Description:    ConnectX-5 Ex EN network interface card; 100GbE
>> dual-port QSFP28; PCIe4.0 x16; tall bracket; ROHS R6
>>
>> Device:         /dev/mst/mt4121_pciconf0
>>
>>
>>
>> Configurations:                              Next Boot
>>
>>           MEMIC_BAR_SIZE                      0
>>
>>           MEMIC_SIZE_LIMIT                    _256KB(1)
>>
>>           HOST_CHAINING_MODE                  DISABLED(0)
>>
>>           HOST_CHAINING_DESCRIPTORS           Array[0..7]
>>
>>           HOST_CHAINING_TOTAL_BUFFER_SIZE     Array[0..7]
>>
>>           FLEX_PARSER_PROFILE_ENABLE          0
>>
>>           FLEX_IPV4_OVER_VXLAN_PORT           0
>>
>>           ROCE_NEXT_PROTOCOL                  254
>>
>>           ESWITCH_HAIRPIN_DESCRIPTORS         Array[0..7]
>>
>>           ESWITCH_HAIRPIN_TOT_BUFFER_SIZE     Array[0..7]
>>
>>           PF_BAR2_SIZE                        0
>>
>>           NON_PREFETCHABLE_PF_BAR             False(0)
>>
>>           VF_VPD_ENABLE                       False(0)
>>
>>           STRICT_VF_MSIX_NUM                  False(0)
>>
>>           VF_NODNIC_ENABLE                    False(0)
>>
>>           NUM_OF_VFS                          6
>>
>>           PF_BAR2_ENABLE                      False(0)
>>
>>           SRIOV_EN                            True(1)
>>
>>           PF_LOG_BAR_SIZE                     5
>>
>>           VF_LOG_BAR_SIZE                     1
>>
>>           NUM_PF_MSIX                         63
>>
>>           NUM_VF_MSIX                         11
>>
>>           INT_LOG_MAX_PAYLOAD_SIZE            AUTOMATIC(0)
>>
>>           PCIE_CREDIT_TOKEN_TIMEOUT           0
>>
>>           PARTIAL_RESET_EN                    False(0)
>>
>>           SW_RECOVERY_ON_ERRORS               False(0)
>>
>>           RESET_WITH_HOST_ON_ERRORS           False(0)
>>
>>           ADVANCED_POWER_SETTINGS             False(0)
>>
>>           CQE_COMPRESSION                     BALANCED(0)
>>
>>           IP_OVER_VXLAN_EN                    False(0)
>>
>>           MKEY_BY_NAME                        False(0)
>>
>>           ESWITCH_IPV4_TTL_MODIFY_ENABLE      False(0)
>>
>>           PRIO_TAG_REQUIRED_EN                False(0)
>>
>>           UCTX_EN                             False(0)
>>
>>           PCI_ATOMIC_MODE
>> PCI_ATOMIC_DISABLED_EXT_ATOMIC_ENABLED(0)
>>
>>           TUNNEL_ECN_COPY_DISABLE             False(0)
>>
>>           LRO_LOG_TIMEOUT0                    6
>>
>>           LRO_LOG_TIMEOUT1                    7
>>
>>           LRO_LOG_TIMEOUT2                    8
>>
>>           LRO_LOG_TIMEOUT3                    13
>>
>>           LOG_DCR_HASH_TABLE_SIZE             11
>>
>>           DCR_LIFO_SIZE                       16384
>>
>>           ROCE_CC_PRIO_MASK_P1                255
>>
>>           ROCE_CC_ALGORITHM_P1                ECN(0)
>>
>>           ROCE_CC_PRIO_MASK_P2                255
>>
>>           ROCE_CC_ALGORITHM_P2                ECN(0)
>>
>>           CLAMP_TGT_RATE_AFTER_TIME_INC_P1    True(1)
>>
>>           CLAMP_TGT_RATE_P1                   False(0)
>>
>>           RPG_TIME_RESET_P1                   300
>>
>>           RPG_BYTE_RESET_P1                   32767
>>
>>           RPG_THRESHOLD_P1                    1
>>
>>           RPG_MAX_RATE_P1                     0
>>
>>           RPG_AI_RATE_P1                      5
>>
>>           RPG_HAI_RATE_P1                     50
>>
>>           RPG_GD_P1                           11
>>
>>           RPG_MIN_DEC_FAC_P1                  50
>>
>>           RPG_MIN_RATE_P1                     1
>>
>>           RATE_TO_SET_ON_FIRST_CNP_P1         0
>>
>>           DCE_TCP_G_P1                        1019
>>
>>           DCE_TCP_RTT_P1                      1
>>
>>           RATE_REDUCE_MONITOR_PERIOD_P1       4
>>
>>           INITIAL_ALPHA_VALUE_P1              1023
>>
>>           MIN_TIME_BETWEEN_CNPS_P1            2
>>
>>           CNP_802P_PRIO_P1                    6
>>
>>           CNP_DSCP_P1                         48
>>
>>           CLAMP_TGT_RATE_AFTER_TIME_INC_P2    True(1)
>>
>>           CLAMP_TGT_RATE_P2                   False(0)
>>
>>           RPG_TIME_RESET_P2                   300
>>
>>           RPG_BYTE_RESET_P2                   32767
>>
>>           RPG_THRESHOLD_P2                    1
>>
>>           RPG_MAX_RATE_P2                     0
>>
>>           RPG_AI_RATE_P2                      5
>>
>>           RPG_HAI_RATE_P2                     50
>>
>>           RPG_GD_P2                           11
>>
>>           RPG_MIN_DEC_FAC_P2                  50
>>
>>           RPG_MIN_RATE_P2                     1
>>
>>           RATE_TO_SET_ON_FIRST_CNP_P2         0
>>
>>           DCE_TCP_G_P2                        1019
>>
>>           DCE_TCP_RTT_P2                      1
>>
>>           RATE_REDUCE_MONITOR_PERIOD_P2       4
>>
>>           INITIAL_ALPHA_VALUE_P2              1023
>>
>>           MIN_TIME_BETWEEN_CNPS_P2            2
>>
>>           CNP_802P_PRIO_P2                    6
>>
>>           CNP_DSCP_P2                         48
>>
>>           LLDP_NB_DCBX_P1                     False(0)
>>
>>           LLDP_NB_RX_MODE_P1                  OFF(0)
>>
>>           LLDP_NB_TX_MODE_P1                  OFF(0)
>>
>>           LLDP_NB_DCBX_P2                     False(0)
>>
>>           LLDP_NB_RX_MODE_P2                  OFF(0)
>>
>>           LLDP_NB_TX_MODE_P2                  OFF(0)
>>
>>           DCBX_IEEE_P1                        True(1)
>>
>>           DCBX_CEE_P1                         True(1)
>>
>>           DCBX_WILLING_P1                     True(1)
>>
>>           DCBX_IEEE_P2                        True(1)
>>
>>           DCBX_CEE_P2                         True(1)
>>
>>           DCBX_WILLING_P2                     True(1)
>>
>>           KEEP_ETH_LINK_UP_P1                 True(1)
>>
>>           KEEP_IB_LINK_UP_P1                  False(0)
>>
>>           KEEP_LINK_UP_ON_BOOT_P1             False(0)
>>
>>           KEEP_LINK_UP_ON_STANDBY_P1          False(0)
>>
>>           KEEP_ETH_LINK_UP_P2                 True(1)
>>
>>           KEEP_IB_LINK_UP_P2                  False(0)
>>
>>           KEEP_LINK_UP_ON_BOOT_P2             False(0)
>>
>>           KEEP_LINK_UP_ON_STANDBY_P2          False(0)
>>
>>           NUM_OF_VL_P1                        _4_VLs(3)
>>
>>           NUM_OF_TC_P1                        _8_TCs(0)
>>
>>           NUM_OF_PFC_P1                       8
>>
>>           NUM_OF_VL_P2                        _4_VLs(3)
>>
>>           NUM_OF_TC_P2                        _8_TCs(0)
>>
>>           NUM_OF_PFC_P2                       8
>>
>>           DUP_MAC_ACTION_P1                   LAST_CFG(0)
>>
>>           SRIOV_IB_ROUTING_MODE_P1            LID(1)
>>
>>           IB_ROUTING_MODE_P1                  LID(1)
>>
>>           DUP_MAC_ACTION_P2                   LAST_CFG(0)
>>
>>           SRIOV_IB_ROUTING_MODE_P2            LID(1)
>>
>>           IB_ROUTING_MODE_P2                  LID(1)
>>
>>           PCI_WR_ORDERING                     per_mkey(0)
>>
>>           MULTI_PORT_VHCA_EN                  False(0)
>>
>>           PORT_OWNER                          True(1)
>>
>>           ALLOW_RD_COUNTERS                   True(1)
>>
>>           RENEG_ON_CHANGE                     True(1)
>>
>>           TRACER_ENABLE                       True(1)
>>
>>           IP_VER                              IPv4(0)
>>
>>           BOOT_UNDI_NETWORK_WAIT              0
>>
>>           UEFI_HII_EN                         False(0)
>>
>>           BOOT_DBG_LOG                        False(0)
>>
>>           UEFI_LOGS                           DISABLED(0)
>>
>>           BOOT_VLAN                           1
>>
>>           LEGACY_BOOT_PROTOCOL                PXE(1)
>>
>>           BOOT_INTERRUPT_DIS                  False(0)
>>
>>           BOOT_LACP_DIS                       True(1)
>>
>>           BOOT_VLAN_EN                        False(0)
>>
>>           BOOT_PKEY                           0
>>
>>           ATS_ENABLED                         False(0)
>>
>>           DYNAMIC_VF_MSIX_TABLE               False(0)
>>
>>           EXP_ROM_UEFI_x86_ENABLE             False(0)
>>
>>           EXP_ROM_PXE_ENABLE                  True(1)
>>
>>           ADVANCED_PCI_SETTINGS               False(0)
>>
>>           SAFE_MODE_THRESHOLD                 10
>>
>>           SAFE_MODE_ENABLE                    True(1)
>>
>> root@daytona3:/home/cse#
>>
>>
>> Thanks
>>
>> Saddique
>>
> 
> 
> 

