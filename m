Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0B11505A0
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Feb 2020 12:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgBCLtW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Feb 2020 06:49:22 -0500
Received: from mail-eopbgr10087.outbound.protection.outlook.com ([40.107.1.87]:11601
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726561AbgBCLtW (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 3 Feb 2020 06:49:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H30HmHgSErz2BW96+kXV90dlZbbhYkU017WMniBKjVpnVYHefLxdh93zI1b9xADlZt4OdFj9faOqMVDG4w6m2XOY1BvPci97TcGBgRVL9c/zf+rrTMtOQ8iGcO7wgIYInYO31eV8NnPEhIunwXpZkEz5NUQxvWtprPBksJyDIaBRw+2M13S7CBs1W7AjXAD88QDc7ug6j9XfActjCErCBJc2WxVvdjWZLulFbh6bTlhhdZZ7Le5oF6PAZmGvFMLVyZgbcnuADD8tfyYn+P2u6JURf43zn9ErkYZNAfyVe9LrA5Sct7vuNNZOgESxHgUZY1n7bDNOWjQtk1/b0HJgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1388kw5uNLX95CnrXPluTmXo+zgb4HLpdw4lL29FmSI=;
 b=EzgFLdpXOeDSjIakt5+42nfR4v5wwLQKLNrasOKxCNZn2BM93+2x4E8puSDj5gnB9h2+U809yg4qb1mV9KfhbzxDngoGwKf/rY3ngGMj2KaxZOZR6AKwaWQABsPhR7vT1Be+PEprbAwB/sCNbOu5HJ3kNewQ0QeqiDRJEtPoP43JnkvaLhxzrE+D7ot0jQC/bseQ9MbQG2WfrfmvIXw/8KvNHx5H073Ds+Y4UL78AZmEyl0vBa55xASWiq0s3kSyehaHZAEr2NTEIzmUrEsZ79w4aKD87gL4YzPudFEGjh9MG8Z1arNeoE5Zke10zc/X4JNrzDZAyaR2/DVqvusqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1388kw5uNLX95CnrXPluTmXo+zgb4HLpdw4lL29FmSI=;
 b=C5mcDXW7Hf5BRpxavWJ4fkPCaQwjGZdY482KaSSn/7yvm2BUOIy4uu7Ly++GSF5BUjXss+P9awZlJFNwDpUB77Na00e7HWsj4A3Y/NNMn7iiZ/HlKSNQ0yyxo53DbbPzeoOZnnARFEgdkxpMwSp0OKCKXuMIzeSYHMzUP5ud65Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=maximmi@mellanox.com; 
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com (10.168.126.17) by
 HE1PR0501MB2186.eurprd05.prod.outlook.com (10.168.33.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Mon, 3 Feb 2020 11:49:14 +0000
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::6131:363b:61b8:680a]) by HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::6131:363b:61b8:680a%11]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 11:49:14 +0000
Subject: Re: Cannot run multiple 'xdpsock' concurrently?
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bjorn.topel@intel.com
References: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
 <CAJ8uoz0btU4L80d2DHv+=ivL3RJmunnAsmetL=2zBo_2xfpgAA@mail.gmail.com>
 <20200203031104.GA19512@ranger.igk.intel.com>
From:   Maxim Mikityanskiy <maximmi@mellanox.com>
Message-ID: <afcf4030-aee3-7e9c-a57f-c5458c285b74@mellanox.com>
Date:   Mon, 3 Feb 2020 13:49:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200203031104.GA19512@ranger.igk.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To HE1PR0501MB2570.eurprd05.prod.outlook.com
 (2603:10a6:3:6c::17)
MIME-Version: 1.0
Received: from [10.112.41.138] (77.75.144.194) by ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.27 via Frontend Transport; Mon, 3 Feb 2020 11:49:13 +0000
X-Originating-IP: [77.75.144.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c25491a7-f081-4beb-02f2-08d7a89f1797
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2186:
X-Microsoft-Antispam-PRVS: <HE1PR0501MB2186C4B83437FCDA7CD50437D1000@HE1PR0501MB2186.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(189003)(199004)(86362001)(36756003)(2616005)(52116002)(5660300002)(31696002)(956004)(316002)(4326008)(26005)(478600001)(16576012)(8936002)(66476007)(16526019)(66556008)(54906003)(186003)(81166006)(81156014)(110136005)(8676002)(66946007)(31686004)(2906002)(6486002)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0501MB2186;H:HE1PR0501MB2570.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:3;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Lv1EzUf1Eh0YwDKfu023cfIcXz4LtdyKPrHlGaqFQUqeAMydJgK5QdgX0UH27uMTaTPTDi43hRYJAws+t+BwbJqOxnf6u6uXu20sr9OzpB6M542wIVnkl+Y0zZmLdx6uxPTsYoiKZz/IFy/qFGfSYjnuzEvO4TDbEjZrWCj3mUhN53s/AQjoXYWQlCbWZC3TqdcVNBxE7yX/RxE19kpT4eDQ5Qr2F7gEYEFTQmjitXS0vT0ytptE6AtZLV6fNd604UTYYwPMlOEjL4xw68JwrCLc2gQEnFitCJkop8kpC4QE3F/7TT9F6A6h2UaGTRxElGwH5cSmlOa8zclr/LyLbzMqPm2ugZM6qLk1BRfsreEFhK5uViPfxVd/03UXIhn2062NrXI64m4tP2ZvZsoCBFCfk06xR6I+Eha+4hkDdpG6V2vbzRo6n/f3B4eF68S
X-MS-Exchange-AntiSpam-MessageData: 6R0Xi/hNgZ5/3IdFzH3NMezb9a7TE53U5cmvp5VIiEzexmqHObBOy4CHrtFl6EzdsxIu159kbFJYXtrpyi7YM742T56tnT1MOGI8bWlNPDkMBsFnizpITNkYXT6+4jRxwYJRL0QHUaxWiNFk3Ewk2g==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25491a7-f081-4beb-02f2-08d7a89f1797
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2020 11:49:14.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygWsjkwa40dE4CphQ7dMKHzlNzY1lG2mJ2HoCHnJ0IqdkkHeMpaP8aLZtGYqILsCNhgL1ELn9M0P9tnmzfWxzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2186
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2020-02-03 05:11, Maciej Fijalkowski wrote:
> On Mon, Feb 03, 2020 at 10:53:40AM +0100, Magnus Karlsson wrote:
>> On Fri, Jan 31, 2020 at 3:14 AM Cameron Elliott
>> <cameron@cameronelliott.com> wrote:
>>>
>>> Hello, I am trying to measure the maximum mpps I can push using AF_XDP on a 40G X710
>>>
>>> I can do 22 mpps  after resolving a few bumbles I made with drivers, etc., (Thanks Magnus!)
>>> when using a single instance of 'xdpsock'
>>>
>>>
>>> Apparently the way to upto 50, 60 or 70? mpps is to use multiple cores...
>>> And apparently the simple way to do that, is multiple instances of xdpsock on different queues.
>>>
>>> But, my attempts with multiple instances fail. :(
>>>
>>>
>>>
>>> First, I checked my channel setup:
>>>
>>> $ sudo ethtool --set-channels enp1s0f0
>>> no channel parameters changed.
>>> current values: rx 0 tx 0 other 1 combined 4
>>>
>>> I presume that is okay...
>>>
>>> Then I run these two commands in two different windows:
>>>
>>> sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 0
>>> sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 1
>>>
>>> With the only difference being the queue id.
>>>
>>> The first will start and show ~22 mpps tx rate.
>>> When I start the second, both instances die:
>>>
>>> The first instace dies with:
>>> /home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno: 100/"Network is down"
>>>
>>> The second instance dies with:
>>> /home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno: 6/"No such device or address"
>>>
>>>
>>> Do I understand correctly I should be able to run two instances like this concurrently?
>>
>> This is probably not supported by the current xdpsock application.
>> What is likely happening is that it tries to load the XDP program
>> multiple times. As the XDP program is per netdev, not per queue, it
>> should only be loaded once. When the second process then fails, it
>> probably removes the XDP program (as it think it has loaded it) which
>> crashes the first process you started.
> 
> Of course it *was* supported. Program is loaded only on the first xdpsock
> instance since libbpf is checking whether xdp resources are there. On the
> removal part you're right, we still haven't figured it out how to properly
> exit the xdpsock when there are other xdpsocks running.
> 
> Actually commit b3873a5be757 ("net/i40e: Fix concurrency issues between
> config flow and XSK") (CCing Maxim, Bjorn) broke the xdpsock multiple
> instances support.

That was surprising, but now that I took a look at that code in the 
context of this issue, it got clear to me why it happens.

> If we drop the check against busy bit in PF state in
> the i40e_xsk_wakeup, then I can run many xdpsocks on same ifindex.
> 
> I'm not really sure that is the right approach since we are explicitly
> setting the __I40E_CONFIG_BUSY bit in i40e_queue_pair_disable which is
> used when ndo_bpf is called with XDP_SETUP_XSK_UMEM command.

Right, we shouldn't drop this check, at least it's needed to sync on 
xsk_wakeup when closing a socket. I think there are two issues here, and 
I suggest this way of solving them:

1. __I40E_CONFIG_BUSY is set while a single QP is being recreated, e.g., 
when opening/closing an XSK. I considered it as a flag for global 
configuration changes, but apparently it's also needed when a single XSK 
is being configured. Probably xsk_wakeup shouldn't return ENETDOWN when 
this flag is set, but something lighter like EAGAIN. xdpsock will need 
to repeat the syscall instead of bailing out.

2. Should xdpsock stop on ENETDOWN? Normal network sockets don't close 
as soon as the carrier is lost, so why should xdpsock fail on ENETDOWN? 
IMO, xdpsock should handle it more gracefully (wait with some timeout?).

Does it sound like the right direction?

>>
>> So, the application needs to get extended to support this. Maybe you
>> want to do this :-)? Could be a good exercise. You could add a new
>> commend line option that takes the number of instances you would like
>> to create. Look at the -M option for some inspiration as it does some
>> of the things you need. Maybe you can reuse that code to support your
>> use case.
>>
>> /Magnus
>>
>>>
>>> Thank you for any ideas, input.
>>>
>>>
>>>
>>> # ethtool dump / i40e driver from recent bpf-next clone
>>> c@lumen ~> ethtool -i enp1s0f0
>>> driver: i40e
>>> version: 2.8.20-k
>>> firmware-version: 7.10 0x80006456 1.2527.0
>>> expansion-rom-version:
>>> bus-info: 0000:01:00.0
>>> supports-statistics: yes
>>> supports-test: yes
>>> supports-eeprom-access: yes
>>> supports-register-dump: yes
>>> supports-priv-flags: yes
>>>
>>>

