Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF58E1557D4
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 Feb 2020 13:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgBGMe3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 Feb 2020 07:34:29 -0500
Received: from mail-vi1eur05on2056.outbound.protection.outlook.com ([40.107.21.56]:6160
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726798AbgBGMe3 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 7 Feb 2020 07:34:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqdtNsW1IgaR89+ZpzXv3BzW4hVt7mLXttszjHXXC3JmqJUe64Xpw/LeBycUZxq0XhF7sWeXIMhcVazBX0KIgHSzBEX2ZwSMXbETgFgXmC6DDi+Lojfi9OT4UgbVesK0DxOHouCVcqc7LQyTUvSZZPAb9qS5xYx2mMMPwyWgzmIzgrEMipAGAupFr9FtZFsSQwHjjzRzzwP4ZEDtsLok6nwzAVW7mRLn8BygzoVGMTA5x20TXjl5sc79rAI78Rd3Qdludj/tbD0KmANZ6G17NqNARya4eMbQbUIKys8lG+enIGuPBqUPdKmQ0s7PO0S1SeEuPeU3nznt37yjvppOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vww5ZmQXZGwyN8wTy1dp678fnjHrFBar9GQuGBwdaHg=;
 b=P0Nma4p7e3+C4XSHQnviM8Xu9MLn35XelWDp1PcjlJlwx2o1uUm/JXUk45Hv2R9Ctg9UM5vL1h8huuwkV0Dd1oy7TGlDJW4OOoJ3pBtpDtMwFuVmNgnIO2w7TrKkNAuRvxioKpR6/yhMTRbncClMEs6/qnU8FXGthRvjY26KqXpHhJsFP4nYob6scB0xaOuEvodDbvElF4K5+UVXgmR749rx9ys4ae9TXuRmEhulHawarR4+KT0kvJd5SoSGbUrQY3FAFUCPSdodikWNTL1a8murcLVgP65TebbZw1gU5acSVRmiUSKaHsh+KscM12wFnusbr2PfrUU+JBg/ojU9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vww5ZmQXZGwyN8wTy1dp678fnjHrFBar9GQuGBwdaHg=;
 b=ru5Zl8UkXrhsgMj/Gzfii7JTjKcMScRgDkWM2CPRJ3O53QWYiZc9L7qNvtvpUARGJEnF0mudQyV++UcGaGuzdzmkmTup2Qd45F02w86SGIGZ/T5nx06KYgJjI0OoAP1iyi45YvPPG7tdJJ+mvje/R7xe8v+F20sbeaxo5fxRZe4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=maximmi@mellanox.com; 
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com (10.168.126.17) by
 HE1PR0501MB2601.eurprd05.prod.outlook.com (10.168.125.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 12:34:12 +0000
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::60c4:f0b4:dc7b:c7fc]) by HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::60c4:f0b4:dc7b:c7fc%10]) with mapi id 15.20.2707.023; Fri, 7 Feb 2020
 12:34:12 +0000
Subject: Re: [PATCH bpf] xsk: publish global consumer pointers when NAPI is
 finsihed
To:     Magnus Karlsson <magnus.karlsson@intel.com>
Cc:     xdp-newbies@vger.kernel.org, rgoodfel@isi.edu,
        bjorn.topel@intel.com, tariqt@mellanox.com, saeedm@mellanox.com,
        moshe@mellanox.com
References: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
From:   Maxim Mikityanskiy <maximmi@mellanox.com>
Message-ID: <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com>
Date:   Fri, 7 Feb 2020 14:34:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To HE1PR0501MB2570.eurprd05.prod.outlook.com
 (2603:10a6:3:6c::17)
MIME-Version: 1.0
Received: from [10.57.0.150] (159.224.90.213) by ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Fri, 7 Feb 2020 12:34:11 +0000
X-Originating-IP: [159.224.90.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9af8935e-d548-43f0-976f-08d7abca0902
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2601:|HE1PR0501MB2601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0501MB2601501FBBCC96ADCDEA4A72D11C0@HE1PR0501MB2601.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(189003)(199004)(186003)(16526019)(26005)(956004)(53546011)(2616005)(81166006)(81156014)(16576012)(8676002)(8936002)(6916009)(55236004)(31696002)(66476007)(66556008)(478600001)(2906002)(5660300002)(6486002)(31686004)(66946007)(4326008)(316002)(36756003)(86362001)(52116002)(107886003);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0501MB2601;H:HE1PR0501MB2570.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5PTxrJbKS3AZ3FdroAevpOpZuBBNhsOAcQtWxkjp/JVOLfmVx4+SMH3PXiTQMaOmfm+NFCsPd6+ef0eJerg+1FD2U6z+xkSpYYxHCYX6Ml+lbD8Pr7h73HDdVWS2vKxNsMVmypQj/aHIo5v0m4Soq7UVr81Kw27RU6rTdP36j05vPCaUWdHUelviJyfI8Fwfs8tkRKTBZ87pRDFodemGVijMudemVWUbA+HAVP2L8J6emSaj4pkZpTpS6cyNkgdtzYAtB+9icyzirmT887dLoEDmCgltEI7jJhjEHzjEYfMkl47/T8xu4Z6nOQ/AaS3V9+8aalnu8K0aSyxp3NxgsJDgpo/4Gd0Qad/a/GFwlzlPwvVD680WlYUEE6gdTYNae1yxepZHQia6GLHPutHiibQ0cEWiWAzWuoJHxk6LvuaFqs+HA1/4YTknGnaEGF0
X-MS-Exchange-AntiSpam-MessageData: Ujx+A4roBFV77Hqix+OjklOs254XJKCzP0Eh7J+ss5h3sxbksg6nLDzlpERbEZQjDwW6VQDS2LSuHb4vzdyiqM3vbSPs/a/Zx/3qaap8MUG3HsE45UZY/C19Dkfy/+LEkxJubPBdSxOESnlCvkBXVA==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af8935e-d548-43f0-976f-08d7abca0902
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 12:34:12.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3Wl9aeJQIf/0EzSsWGRV476aJGE3lwSrHi41BWR2XKXbUQ22FL7iMCkpFjmpNGaVov46wT73gt3GHz8gqcZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2601
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2020-02-07 11:37, Magnus Karlsson wrote:
> The commit 4b638f13bab4 ("xsk: Eliminate the RX batch size")
> introduced a much more lazy way of updating the global consumer
> pointers from the kernel side, by only doing so when running out of
> entries in the fill or Tx rings (the rings consumed by the
> kernel). This can result in a deadlock with the user application if
> the kernel requires more than one entry to proceed and the application
> cannot put these entries in the fill ring because the kernel has not
> updated the global consumer pointer since the ring is not empty.
> 
> Fix this by publishing the local kernel side consumer pointer whenever
> we have copmleted Rx or Tx processing in the kernel. This way, user
> space will have an up-to-date view of the consumer pointers whenever it
> gets to execute in the one core case (application and driver on the
> same core), or after a certain number of packets have been processed
> in the two core case (application and driver on different cores).
> 
> A side effect of this patch is that the one core case gets better
> performance, but the two core case gets worse. The reason that the one
> core case improves is that updating the global consumer pointer is
> relatively cheap since the application by definition is not running
> when the kernel is (they are on the same core) and it is beneficial
> for the application, once it gets to run, to have a pointers that are
> as up to date as possible since it then can operate on more packets
> and buffers. In the two core case, the most important performance
> aspect is to minimize the number of accesses to the global pointers
> since they are shared between two cores and bounces between the caches
> of those cores. This patch results in more updates to global state,
> which means lower performance in the two core case.
> 
> Fixes: 4b638f13bab4 ("xsk: Eliminate the RX batch size")
> Reported-by: Ryan Goodfellow <rgoodfel@isi.edu>
> Reported-by: Maxim Mikityanskiy <maximmi@mellanox.com>
> Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> ---
>   net/xdp/xsk.c       | 2 ++
>   net/xdp/xsk_queue.h | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index df60048..356f90e 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -217,6 +217,7 @@ static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
>   static void xsk_flush(struct xdp_sock *xs)
>   {
>   	xskq_prod_submit(xs->rx);
> +	__xskq_cons_release(xs->umem->fq);
>   	sock_def_readable(&xs->sk);
>   }
>   
> @@ -304,6 +305,7 @@ void xsk_umem_consume_tx_done(struct xdp_umem *umem)
>   
>   	rcu_read_lock();
>   	list_for_each_entry_rcu(xs, &umem->xsk_list, list) {
> +		__xskq_cons_release(xs->tx);
>   		xs->sk.sk_write_space(&xs->sk);
>   	}
>   	rcu_read_unlock();
> diff --git a/net/xdp/xsk_queue.h b/net/xdp/xsk_queue.h
> index bec2af1..89a01ac 100644
> --- a/net/xdp/xsk_queue.h
> +++ b/net/xdp/xsk_queue.h
> @@ -271,7 +271,8 @@ static inline void xskq_cons_release(struct xsk_queue *q)
>   {
>   	/* To improve performance, only update local state here.
>   	 * Reflect this to global state when we get new entries
> -	 * from the ring in xskq_cons_get_entries().
> +	 * from the ring in xskq_cons_get_entries() and whenever
> +	 * Rx or Tx processing are completed in the NAPI loop.
>   	 */
>   	q->cached_cons++;
>   }
> 

Acked-by: Maxim Mikityanskiy <maximmi@mellanox.com>

Is it intentional that you didn't send it to bpf and netdev mailing lists?
