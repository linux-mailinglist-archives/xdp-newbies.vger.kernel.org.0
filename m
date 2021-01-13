Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169F32F541D
	for <lists+xdp-newbies@lfdr.de>; Wed, 13 Jan 2021 21:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbhAMU3G (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 13 Jan 2021 15:29:06 -0500
Received: from mail-am6eur05on2064.outbound.protection.outlook.com ([40.107.22.64]:42624
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728842AbhAMU3F (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 13 Jan 2021 15:29:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8zBASox4nAvyMrLHhtLF1r9Ig3kEJ8QM4h9LtzmS0vzjO4LKs2UwsZVGTMrM81w50ItNHCpikDHI02noddTlovneAswArvJZxAyOxI8x5L2rWkx+b1lxmsEOmFRtObLWQAPA6uUVVkozHg7f2YGUmE3waT+yiSZhhlWrikJoCIAeqXGztPlEOIPYBHhAICOV44VQZ5Z1gzwaDXOVTw2U50bm6YFc9tLNbZxI9Raw0hgefU8fqCPwJUSWL1RGouDQzPZiSQ1c8ZXKyeH9ozIqKqL+5WvPdvTA5QFys8rEkU6gAcJ5ukMDpOyNYMrnGV6rt0koFq0rTlL4l9WVjZTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06ml+HTTrSlM+Rb8iz0v6pjJ6WyKvsNWm3brwnCe1JE=;
 b=LpcMkdopQBsXSK9o6Ht0Pbz15DkDsLEYTwh6QoKcWBHeZ1jWm5DRPi6tOjUFHrMC7IWUhoKu+U841kHQ0Wy6E8vYurmGyVrMobL8QilsfG46E/oKDfueWCFL958fLsGwHkg3H9XuU3LGhL34HeQHLhLBVdwDdJi5T0Fme2PctkhxuBXC0AmCD33YumuxqCm7zwFNh4mo7uDzXtOm1/DYPBRvVjGIdPx3jwmhULbbMLHmjtQ20oV98jZ3lPpnvrpwON9kDjRm4nERCmpKbmwPjxBQkSl0XcPvWF4vNNsrE2o1bqGlCx088YCP1lWVQC7GZyXvlTNaU743V9VHs69b/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inf.elte.hu; dmarc=pass action=none header.from=inf.elte.hu;
 dkim=pass header.d=inf.elte.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ikelte.onmicrosoft.com; s=selector2-ikelte-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06ml+HTTrSlM+Rb8iz0v6pjJ6WyKvsNWm3brwnCe1JE=;
 b=WkNw/ZuSmhp288NvGM3gdw1+8xxQBVE28VDyYw/0cROIa2ZpHQSTBsuQUNKP3cgk2PUCVi7XEdcqlKfrJ2qOm7qb9tdOWBXzAN/rOEwa8oVtmAJuOkRIr/r+wxQ9tlghYVhcjTJQOpSoPisvJbR21mklkmKMOdKLoqrP60jOLMQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=inf.elte.hu;
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ab::20)
 by DBAPR10MB4122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 20:28:16 +0000
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8d0:ce1b:db24:3835]) by DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8d0:ce1b:db24:3835%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 20:28:16 +0000
X-Gm-Message-State: AOAM530qBFJhe4F488D5aagrziYEXDhSwpNgJ6iwJxWo1FA7Wf3zQnej
        8B5/DCVVk47E3zHGRWAcVgV66Vq8II8GMEMpnG0=
X-Google-Smtp-Source: ABdhPJzsj38BKLNx3rsDCPuJJ2TExOWDsaZ2zLl32fLZZXYMl6l951sNAdnxlpBr2xSh0qgMZYdpzKDR2ComtN6yifA=
X-Received: by 2002:a05:620a:544:: with SMTP id o4mr3891632qko.19.1610569691461;
 Wed, 13 Jan 2021 12:28:11 -0800 (PST)
From:   Ferenc Fejes <fejes@inf.elte.hu>
Date:   Wed, 13 Jan 2021 21:28:00 +0100
X-Gmail-Original-Message-ID: <CAAej5NbWT3zMxTQ-UbOAOVP6Zoyk-w=Pg9B+nFCU9SKziXRPJQ@mail.gmail.com>
Message-ID: <CAAej5NbWT3zMxTQ-UbOAOVP6Zoyk-w=Pg9B+nFCU9SKziXRPJQ@mail.gmail.com>
Subject: xsk_fwd.c usage
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [209.85.222.176]
X-ClientProxiedBy: MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26)
 To DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ab::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qk1-f176.google.com (209.85.222.176) by MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 20:28:16 +0000
Received: by mail-qk1-f176.google.com with SMTP id z11so3873604qkj.7        for <xdp-newbies@vger.kernel.org>; Wed, 13 Jan 2021 12:28:16 -0800 (PST)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cadea24-a5b0-4342-2f13-08d8b801c24f
X-MS-TrafficTypeDiagnostic: DBAPR10MB4122:
X-Microsoft-Antispam-PRVS: <DBAPR10MB41220F28F1B4064799EF3D1CE1A90@DBAPR10MB4122.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dv+uC1oGcszxN3Zh+o7BrxwXa2WMFtPfHGuifIPkOJQv3LSIPVoBwjY5fGcvODsXAZv+OLbPGcv0b1aWkeP0axZPnPYBQnkPuFDVkVJ4aVAj79SC7Kw+vyiK5wB2E/oMPr32+mPMS8kHWCHRnEebQ4V3wiOknYEVy0XYTKb7mJ8E/9m9ghqKbPWQj7OcO/lqGLncEfnuUpWhgHPurzBTHkt5DWq41S/YKlxLnxwxNihsQ4tR24pI9h+n3zDK/NuHThNZCXNkiRjWpOd5PB+2ZkUCy6C3yklB//0ecXifVufym3zBx/wzOc3gnESrLqcwvn8Tf7C1Qz388uFmCjHNCSxmXSWModKoOdzJMk8C1WN7pDdwzdTm9t4UEdKeVn7mnX7FwvvvnLnppAnU0V5fTZ5YSCf4QF92V5M1SlHgrTuLO7xwc/d6DPM0OXd6Eh4LjeF0TNgJrPFL7IAoT9r+wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(39850400004)(136003)(396003)(346002)(8936002)(6916009)(786003)(42186006)(316002)(966005)(66476007)(66946007)(2906002)(66556008)(6666004)(52116002)(9686003)(8676002)(5660300002)(478600001)(26005)(55446002)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFpDcVpOemROeUZ4b2g1VThVQzJOUUFJcVBqQVAvYmdvcjVuQUNnNk10WGpa?=
 =?utf-8?B?bTlZSHRIMzkxMGpqeURaL2Z6RS9BK1ZSc3NXMTJYT1JRS3A2TWYzTXFhUGZR?=
 =?utf-8?B?dXBTNjVQVTRuZ21TcWFCOE92QmxwRXpaZ3BLSnVMdGNFbEVyaHhnbURVUmFH?=
 =?utf-8?B?dVRLVm96ZnY5K0F0YnJHYklKcFhxMDJURS9EMUVXbXpJL00zb2dZdHB1Unhj?=
 =?utf-8?B?c0NsSlFrM09ReGZFWUlTWnFjT2RZelp4bllIQXF5SkgyVWNaQnZoV0IrYWFU?=
 =?utf-8?B?OWpwWE5QblJTVGxwTEhvMVFLQzZNNHZTOHdUY1lVa3dia2I1Mk8yWm1oVTA1?=
 =?utf-8?B?UWhMcURib2pTRmJBWkRTSXZCK081Zzh1SVRhUHVMQk9SNG5EYTJmb1FOaFhW?=
 =?utf-8?B?Ym95TXlxZGxXVHRlZkFoL0tjMjlPeGR1SXF3MURWYlZ6NS9XblFpREMyRTZm?=
 =?utf-8?B?QTRuMHh6UGJuWFRLU3RSSko3RFdpTkE5YjYwUlBnNGora2tlcFBzSisyMFlp?=
 =?utf-8?B?RHI2SEtRemU5VVIvcnlSRW53eVd0ZWx4WTJRd1NHdURqTFlBYUlWVURMbFlw?=
 =?utf-8?B?Y1NOVUJOOFZyYy9WZnhTc054T1NjNXJzeDlnNUo2WEhVcm1ldkdmM1dYci9H?=
 =?utf-8?B?Q2syNVhrUjBGQ0FPYTlqOWlNWlRDRUp1M3VyTlhuaStxREZla0QvK3JKa2tB?=
 =?utf-8?B?UVB5SmtWQ0Y3SHJiREU3anNyKzVBUG9TcnFGdjNIR1hrUXBaT2toaGQ0RXQx?=
 =?utf-8?B?a0RvZm04Wld2RmVBZDRLYlVScFJEcUFsd3ZuOGhFbDVlbElwSW8ySk16anB1?=
 =?utf-8?B?TlZjQ0hGT05xdkpXeGNyblhxa2szR0JGa1JTRHNoQVA4YTh3OEg5Ti9BZ2x4?=
 =?utf-8?B?YkovSk5pSXBmTzhqc0wzd0dwTzliTkpoek1XY0I4SzA5RkNsZ1ozREY1Y1Yv?=
 =?utf-8?B?OVo4anlxQml1OVNyOUVmRGVxYUxoOW84aWJsMTZKaEJERTZTdGE1Uzl1TTdo?=
 =?utf-8?B?NEkxRWZTT2prQXRWUEhwTXhmeVpubzF4SmE2cHV6eVZWMTN3eU5WaHdKOE5O?=
 =?utf-8?B?bk1ld1lBQ3FyNXZPb094WG5ZZHdqNGppTUQzaDdyMHRIY25Za2gxaFFlNkpk?=
 =?utf-8?B?cDJSRE5ncTMzNVlCWE45WEZWUzlqU2M4WUxGM1pRSWFwNFdlUExPMUR4SWZI?=
 =?utf-8?B?L1lPV1FIeldBMWZSekJ1QmtmVlNQSSt0Vis3VnFEOUtWVy9HZndUZytHaC9q?=
 =?utf-8?B?RjhwR3c0anNXUUNwT3UrWndMR3B5SVB0UitZQ0tRZ21nZDdZL3lHNy9iRlhl?=
 =?utf-8?Q?MDks5GQwQ7Flhkq4WPiJOicNg+2qjali2M?=
X-OriginatorOrg: inf.elte.hu
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 20:28:16.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0133bb48-f790-4560-a64d-ac46a472fbbc
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cadea24-a5b0-4342-2f13-08d8b801c24f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaRdwfUeP1rcufxkKLE6brn5+/4Flv0mAIS3xgy1IkrWHDffhrPidjV2w56PozZugNxocKxd0erJYo3ZbGR8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4122
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi!

I wanted to try out the xsk_fwd.c [0] sample with Mininet. This sample
is capable of forwarding between network interfaces with AF_XDP. My
topology is very simple:
host1 <-----> switch <-----> host2
sudo mn --switch=lxbr
I started the xsk_fwd to forward between the two veth interface of the switch:
sudo ./xsk_fwd -i s1-eth1 -q0 -i s1-eth2 -q0 -c 0

This is failed with EOPNOTSUPP error first. Then I looked into the
xsk_bind function and soon after I found this (at there [1]):
if (force_copy)
    /* For copy-mode, we are done. */
    return 0;

if (!netdev->netdev_ops->ndo_bpf ||
    !netdev->netdev_ops->ndo_xsk_wakeup) {
    err = -EOPNOTSUPP;
    goto err_unreg_pool;
}

After that just like the code said, I removed the XDP_ZEROCOPY from
the bind flags [2] at the xsk_fwd.c which solved the problem and the
program started successfully, but without any traffic between host1
and host2.

My main question: removing XDP_ZEROCOPY requires any semantical
modification in the forwarding code? For example I should have to
memcopy the xdp buffer manually? Or the kernel do the copy
automatically and I have to look for the problem elsewhere? I have
5.10.5 kernel version which supports shared UMEMs.

[0] https://elixir.bootlin.com/linux/v5.11-rc3/source/samples/bpf/xsk_fwd.c
[1] https://elixir.bootlin.com/linux/v5.10.5/source/net/xdp/xsk_buff_pool.c#L158
[2] https://elixir.bootlin.com/linux/v5.11-rc3/source/samples/bpf/xsk_fwd.c#L732

Thanks for the help!
Ferenc
