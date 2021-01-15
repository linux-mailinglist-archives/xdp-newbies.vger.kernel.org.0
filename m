Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1566C2F75AA
	for <lists+xdp-newbies@lfdr.de>; Fri, 15 Jan 2021 10:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbhAOJmN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 15 Jan 2021 04:42:13 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:8966
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725910AbhAOJmK (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 15 Jan 2021 04:42:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB/EFr4dHRTJXMPS3JI2pz0MX5YUR8G9DnTRxd3Mko9GKp6hnNsyuuWNGYcrU8cvFZgsiycVN4bfvM4IR+VPkHhGG8YFkfm4xgYS5EmCHQ+oXw5iOYEpOppwJfpnwCK9OjPUwt2i4qw+LN68i8zq7aPVYHp0WJ/p8YCPWmZDP+zH+uxMlrkM92A5GEn9446D0Nm8w3nukRXwGV3LpNOgBC5jvCQhwLREs6Axy/NIzxIXirH607jLe7y39/zMADG47xqTpVN9qzW15e5fdwLf/PW23ohnD129ltebzOEjhx7UUp3VI2UZD0IPqE3Jk/QJCLvn6egnm1OHGzWdmoKQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZSSWpJBVSNBGe0nTBGZWqVFEdQOqj2O0qIgCzG4oOw=;
 b=N93vShfIFWyN0gF/dXCDuRP0XjxHOvnvx2AfJjRbgFbUTyXYqJqS9GTXc8FzncevpWHNoh39iDcUkOj3f81RLlitxEJZLWyD6N+bUDI/huO+QC2QpJRmj1snWTyMBdOHDSW9an6ciCVtSsiaGyoJgi4VqAzNW7kcfe/akvPvnlgxjdYOfVoUQentjijfK9fMJsr4Vh02SNvVMgcJrce/TMbemYSLotlsEg+qCcVSC3ogQlSPsCzeLi68N5ugJ9HdpXjhslxAYyiuMTTR21jP0u6kUKSllc7FNGyDYiFn3fHNondJZ7gKwb3hd+fc0g661s5/eCcFHjizWk+vbXyj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inf.elte.hu; dmarc=pass action=none header.from=inf.elte.hu;
 dkim=pass header.d=inf.elte.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ikelte.onmicrosoft.com; s=selector2-ikelte-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZSSWpJBVSNBGe0nTBGZWqVFEdQOqj2O0qIgCzG4oOw=;
 b=fn9QHulyvbzxgw/zjGwUYm0P5yhx4M0gVkqZ3LS2n8hlNUvfysHJySJs0jtxnEl/I/fWDClKhOpECJJLkV2wEiweO6tTQdTrJm+/jx5eX1TtxDoQLv+rgoU3u2zZO4mcRnZQPJ3YN+edrrEB334VxSyxYU6ch74zO4QtCZ+25qU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=inf.elte.hu;
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ab::20)
 by DB8PR10MB3941.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:162::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 09:41:29 +0000
Received: from DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8d0:ce1b:db24:3835]) by DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8d0:ce1b:db24:3835%6]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 09:41:29 +0000
X-Gm-Message-State: AOAM532jG/E776F+YIxnA7i1ZJvMlxRLzU/YSupecyDz+785itoHVmln
        KLGoRWH8arbqr2iJSSzMpzSK9AbS8zlmvwCgZEk=
X-Google-Smtp-Source: ABdhPJxHZma/GjB/xfk0uvi1+vUt7Clh9ufYztH9rxciXNU+tYmTju1gWsOfYu5uHvgw5nW4YQLL0TM8y1xY7E/b1Jo=
X-Received: by 2002:a05:620a:4ef:: with SMTP id b15mr10969274qkh.267.1610703684883;
 Fri, 15 Jan 2021 01:41:24 -0800 (PST)
References: <CAAej5NbWT3zMxTQ-UbOAOVP6Zoyk-w=Pg9B+nFCU9SKziXRPJQ@mail.gmail.com>
 <CAJ8uoz1EF-U4Lk2UZ=eKO-CqTzJssV0GS5UcYdezF-yriM63zg@mail.gmail.com>
In-Reply-To: <CAJ8uoz1EF-U4Lk2UZ=eKO-CqTzJssV0GS5UcYdezF-yriM63zg@mail.gmail.com>
From:   Ferenc Fejes <fejes@inf.elte.hu>
Date:   Fri, 15 Jan 2021 10:41:13 +0100
X-Gmail-Original-Message-ID: <CAAej5Nb+aSsX42eFPmeNZcasuuuXAepcO3M2wHJWffzmJBPmYw@mail.gmail.com>
Message-ID: <CAAej5Nb+aSsX42eFPmeNZcasuuuXAepcO3M2wHJWffzmJBPmYw@mail.gmail.com>
Subject: Re: xsk_fwd.c usage
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [209.85.222.175]
X-ClientProxiedBy: MN2PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:208:120::29) To DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:ab::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qk1-f175.google.com (209.85.222.175) by MN2PR10CA0016.namprd10.prod.outlook.com (2603:10b6:208:120::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 09:41:28 +0000
Received: by mail-qk1-f175.google.com with SMTP id 143so11031158qke.10        for <xdp-newbies@vger.kernel.org>; Fri, 15 Jan 2021 01:41:28 -0800 (PST)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ad7607a-d279-479d-eaaf-08d8b939bbb3
X-MS-TrafficTypeDiagnostic: DB8PR10MB3941:
X-Microsoft-Antispam-PRVS: <DB8PR10MB39415B4C54DAD87BCB32E45BE1A70@DB8PR10MB3941.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yi8D1sA/vXaCyGvMiP74LxONcJjckuJgNzumB/uoRTqtWJbz4m4epPP+d+BRFoIq20HETUQduxD5TKEL4c/oZclf5vINpj5Yk3R5AhdAtUgGsr7J1TQTcIVYcoFnqBOVQtU/P2oaSVwHx5oOpcL8kaaLpiZiUNQHsFGI2srwSZo8tRjNym2B4zqqF7BF4SsuIdlZ7idRt0mwa5lA3+m1exiEX883LXkG8A90TpJkiEcPJE1sd0elCSu75k+PtyFj1uzXyVgJWmshiymBrz822U+9wEh/oOd8s7SRkavONEHEnYwprIYDy+iNYb8Mmc+ISYb6mNWOXlGH7Te0xyO/IRxnhXrDR2YmcNibF+MYl2kU05EKUY+cP2HbdEA8hk7aiKudxBU07HRw9nHTH2PJB9mAec1da+xlL/ZxbbbfJ41hAnv/96IjJJzOMv2TEK6cHNn38jZzf4jboz6CLF4mWAuz9W0yltKjbjFhXEsQ5Cp+dAvO7HajmJS9Hr5mdBSYnRoB0zwwDgviUfjt8Z3B7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(396003)(39850400004)(8676002)(66476007)(66556008)(9686003)(53546011)(186003)(6862004)(42186006)(8936002)(66946007)(66574015)(316002)(6666004)(966005)(5660300002)(86362001)(786003)(52116002)(4326008)(26005)(55446002)(478600001)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTViN0RHMlNuMVBiK1A3ZXVmOGFyMzU0VUNIM3VGSTcyL0d0WWVqY3BUQjlv?=
 =?utf-8?B?NkNvOUtBcXZ1NDh6M3V2dHYrMGZaMkxINFdGbUFSdFN1ajNEaWpER0g3aGNC?=
 =?utf-8?B?L1BOUHFZdEh4YVBVbVNCaTVmcitKc1BPcEVBeW5vTU1nTTlPRUN5eE00T0xC?=
 =?utf-8?B?eC9seHhRbkJlSEpYYTd0bFJjOUN2endVcjJxdXdFUUtJRlRvUjhURzJtVi95?=
 =?utf-8?B?VVY0Tyt5WENGYU1jZitzVzdUaGJadkowK3doSUxiaW1hUzF5MUNSL1duNU0w?=
 =?utf-8?B?RWZTa2xlbGdaUXZDcEFaK3B2bWpIMmo3U3k0UzRuU0w2aXJpOXp3R0pvY3hn?=
 =?utf-8?B?aHlGT1FUUklKWXJqeTYzWHp4RldzenNoOVhicGpTUmIyNTAzdm5hbVpROElC?=
 =?utf-8?B?NkthMVEva1Q0ZXRnbHhaV25ITzlEK3hPWVFnR2xUVzVNMUtGUDFyKzVNaHNN?=
 =?utf-8?B?bkIxVGNYRkVNVGpHNmxicFhnVVBUYzNuYU41NnhUVlZZNWVrTmhGWmdQRFQ1?=
 =?utf-8?B?Y2N0T3RmT1BtcEtLRU9YV2RwWXN5bXVHVTlodDludTMxRjBLN0ppdStJVnFn?=
 =?utf-8?B?M3JDRGxLdHkzdFRkMlNHNWpuRDU1REc2K01lNi9EY2ppa09aSVY3R2ZPZGRJ?=
 =?utf-8?B?c1V2OGFwTWZISlI5TFQ4b2wwb0VvamRLNTZha20xYXh6WGROMFZvMUhqekVy?=
 =?utf-8?B?RXpwN2k5azVEV25neGVpWWdzN1I2UStOb092M2c2WURqMTl6OHBKUGh6VnUw?=
 =?utf-8?B?Q2RWaUdYY3FOY254WnJTZm93ZnQ3WHl0aWxnYUc3N1R4MzFzM3l1ejFkRW1j?=
 =?utf-8?B?TmRoMXVMdmdHVDBHWWtXZ2pxWHZvUHdOT1JzTmJ2N2l3MFk5K2hiVitObFdv?=
 =?utf-8?B?OFJlTzlJWlhMVXZwQk91Yk4zUXhURXV1RnpXMzUyNTg4dklQSnU0MmFabHRF?=
 =?utf-8?B?MGxncE1hWk5USkF1RzdFWVZSWXpadStsYUlDekFmWnJWc3RCdjdrV1R2b05Z?=
 =?utf-8?B?emQyOUVsd0g1R2FPV3BUQXgzUDZHWkVmblBuaFMrNC84Ukp6L3ZZdm9lZGI0?=
 =?utf-8?B?M05MTlFTMWZPRHhaam1NWGJDb1RYY09uUXBCdXRyRkx2TTNtbE5kUFVqK3lR?=
 =?utf-8?B?eEYwTjJ3M1Bic0JRdDFFMDd0VlhMcGNtem9rMWo3WGp3V3JZTTU2ZnlQQTY1?=
 =?utf-8?B?eHZPblQ5QktpZmRSckVRRi9OS2pkSlFtOTIrcEk2K3gra005Q2lLWm5ONHhn?=
 =?utf-8?B?MDIxeHp2d2hIYkNYMU1KSi9udysxUFJMdS9VVEhKT3ZUZzh2bFU0d2tzcCtX?=
 =?utf-8?Q?mg+xJLkcoydqikN6EyYN9wZzfXoiHQCqGn?=
X-OriginatorOrg: inf.elte.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad7607a-d279-479d-eaaf-08d8b939bbb3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB2652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:41:29.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0133bb48-f790-4560-a64d-ac46a472fbbc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSAa20DBCIz6bEKYUah59t/BUtq9WYSGDtMBzIIE2ufy99AMQp7U9p16/a9syK62bKvLrd8JY7dkHuvy6ExuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3941
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Magnus Karlsson <magnus.karlsson@gmail.com> ezt =C3=ADrta (id=C5=91pont: 20=
21.
jan. 14., Cs, 15:28):
>
>
>
> On Wed, Jan 13, 2021 at 9:32 PM Ferenc Fejes <fejes@inf.elte.hu> wrote:
>>
>> Hi!
>>
>> I wanted to try out the xsk_fwd.c [0] sample with Mininet. This sample
>> is capable of forwarding between network interfaces with AF_XDP. My
>> topology is very simple:
>> host1 <-----> switch <-----> host2
>> sudo mn --switch=3Dlxbr
>> I started the xsk_fwd to forward between the two veth interface of the s=
witch:
>> sudo ./xsk_fwd -i s1-eth1 -q0 -i s1-eth2 -q0 -c 0
>>
>> This is failed with EOPNOTSUPP error first. Then I looked into the
>> xsk_bind function and soon after I found this (at there [1]):
>> if (force_copy)
>>     /* For copy-mode, we are done. */
>>     return 0;
>>
>> if (!netdev->netdev_ops->ndo_bpf ||
>>     !netdev->netdev_ops->ndo_xsk_wakeup) {
>>     err =3D -EOPNOTSUPP;
>>     goto err_unreg_pool;
>> }
>>
>> After that just like the code said, I removed the XDP_ZEROCOPY from
>> the bind flags [2] at the xsk_fwd.c which solved the problem and the
>> program started successfully, but without any traffic between host1
>> and host2.
>>
>
> The xsk_fwd app was written with zero-copy in mind. We should probably ad=
d an "-S" option to it to start it in skb mode that should work with all ne=
tdev drivers. You need to change both these lines:
>
>                 .xdp_flags =3D XDP_FLAGS_DRV_MODE,
>                 .bind_flags =3D XDP_USE_NEED_WAKEUP | XDP_ZEROCOPY,
>
> XDP_FLAGS_DRV_MODE -> XDP_FLAGS_SKB_MODE
> XDP_ZEROCOPY -> XDP_COPY
>
> Please try this. If not, try simpler programs first and see if they work =
to get some hints.

Thank you for the quick answer! It turned out both SKB and DRV mode
works very well with veth devices. The XDP_COPY required however.

I finally managed to forward traffic between the namespaces: there is
a MAX_BURST_TX 64 define and I simply tested with ping (not some
traffic generator) and it required 64 sec to catch the first TX
transmission because of that. If I set MAX_BURST_RX and MAX_BURST_TX
to 1, ping works well (but TCP dont for some reason).

I working with DPDK for a while and I would like to do a migration to
AF_XDP because I love the fact that's already in the kernel and I only
have to install libbpf for make it work.

>
>>
>> My main question: removing XDP_ZEROCOPY requires any semantical
>> modification in the forwarding code? For example I should have to
>> memcopy the xdp buffer manually? Or the kernel do the copy
>> automatically and I have to look for the problem elsewhere? I have
>> 5.10.5 kernel version which supports shared UMEMs.
>
>
> From a programmatic perspective, it does not matter if you are using zero=
-copy or not. It will work the same way in both cases. The performance will=
 be different of course.
>
Thank you for the answer, this is very convenient.
>>
>>
>> [0] https://elixir.bootlin.com/linux/v5.11-rc3/source/samples/bpf/xsk_fw=
d.c
>> [1] https://elixir.bootlin.com/linux/v5.10.5/source/net/xdp/xsk_buff_poo=
l.c#L158
>> [2] https://elixir.bootlin.com/linux/v5.11-rc3/source/samples/bpf/xsk_fw=
d.c#L732
>>
>> Thanks for the help!
>> Ferenc
