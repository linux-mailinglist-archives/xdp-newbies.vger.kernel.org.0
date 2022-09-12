Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C41E5B5B70
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Sep 2022 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiILNlv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Sep 2022 09:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiILNlu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Sep 2022 09:41:50 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2121.outbound.protection.outlook.com [40.107.10.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F0F1C907
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Sep 2022 06:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZDY9xnaK5iMogPu2NYYEJIg3nnf3vXZyABd3HT6FmBaDHMJdwi9RPyftqmO88QS2KmyAEWZP8pum+l2catiRZqSwwJk0Hgp/BuCrDDc5TFFuU+oo75XbL5Qko+RxQhSI28Z/4V6LKltvn4j/u0bF8gYdr5XYPp3ikUUOmtCEAV7rc/TGzpd4a8NsFyEU8WJ/ug45tkdTfbGuEJLQoJ/vDhPuPXMgcJPWQwVb1DHBS3PDgpMoSZal7pSmr3X1JPEFW/3TF39P9RAxu8Y7fuKmldM7LYPbmyksUeJxSS8/LMBUcZmXBnfwdsig2UYOpBh2DUtKds6hGSH+TLyFUFmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvNV4R7K+2niLR+stju7y307Va8oK4df+6xuK+2hz4M=;
 b=nbY//Mq3FNzYYNdorYB2dwSiPsfHSXL/lQHJXfESODnGK48wpETEQsoSWs4avVIAJbw/NhWerNFEu7D/gjysDuTCbDDNmycJBMuR1wCIJWSuI/hezsCy5pjPXYrEulAGzrNRqt7aUXpMRunC3Ta8bNjiaVvg+CCa7/Kw6PLsZ/O2NFtLQKIJFYWvLRosr9aCsT/TJEdUXWXvkKf4AafTa5+lLIfkvS6WQ+hoSfq7rwqEIjvh8NH1ToPTFTy+gSx0FojgIvXF3kyQFLSPPPCAUv3/DupZOMyYKK4Pdo3hFtWj/TqMLeLFMgBbI0IrNNPtbTm//eUovNfdLeh+fzh/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synamedia.com; dmarc=pass action=none
 header.from=synamedia.com; dkim=pass header.d=synamedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synamedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvNV4R7K+2niLR+stju7y307Va8oK4df+6xuK+2hz4M=;
 b=R01SvwWMxfqEMlgUq3IQScj2rXgLV36yUgJAQwvDmtb27mzCNDDgJiD0vJQdeJ/Jfpg7mvYRonS8udjva4m5ko+Se/xh1zR9i5Q+JUMa1UZrc2/9H91P7wpMbNWqUstFA4PDBEauNIjOlABO44tgJB4f1sIOD11QZgAjymxyJZJq0zGRti19ItqCaIlZqYJFjW3Ed5Kjn4wQMar5wl8u/fuwSDOor4niwwvL8YSx3c544f3xp9E4B4Sfwezvmg82xsRNj6JD0AhH+8CGY2L166c+r5MSV+S4FhuO2CJW97rEbppS4Y3zC9daxZuCnaNcHQNwElGaOKTrSxozkQNf/Q==
Received: from CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1be::9)
 by LO0P265MB6472.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 13:41:47 +0000
Received: from CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1022:3adc:5ae6:937f]) by CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1022:3adc:5ae6:937f%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 13:41:47 +0000
From:   Dries De Winter <ddewinter@synamedia.com>
To:     "siska@cesnet.cz" <siska@cesnet.cz>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: XDP-ZC RSS - Mellanox
Thread-Topic: Re: XDP-ZC RSS - Mellanox
Thread-Index: AdjGlGdPB7i8F3BQSTaepZIQeq09rA==
Date:   Mon, 12 Sep 2022 13:41:46 +0000
Message-ID: <CWXP265MB53457318D33BCCEC3289ECDCA2449@CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ActionId=f7058a14-87ef-442c-822f-16ae261728f0;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_ContentBits=0;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Enabled=true;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Method=Standard;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_Name=e305dca8-daac-40b2-85cb-c39a1eaa36df;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SetDate=2022-09-12T10:42:49Z;MSIP_Label_e305dca8-daac-40b2-85cb-c39a1eaa36df_SiteId=ecdd899a-33be-4c33-91e4-1f1144fc2f56;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synamedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5345:EE_|LO0P265MB6472:EE_
x-ms-office365-filtering-correlation-id: 948d4290-ca02-4ec4-59e8-08da94c489cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FjCWDUJ5KkJ4eKbaLFtoNUBOOFwa7SQg55bN9bXOqmH9GDddlAgiITn77waFW/BAhOg+VNz/SrmKTblyqrjLSWaaHylIXJnr6UU+EUxwq5tsdY33JCi/iBpZ8h3WXTDVl5ayXxL/Xm44gH5YHT2MFC86t12V+vni926I/roW58Hwl+PBeHOxnKOlhAl441xynUMBJO3NYzR4GUpUSITmk3GBG/bW+sXexrFd31cI1s0upqv3XUp7xCpA37Zcq7R7YXpZ4+VTUfNcWYPLgBEgt0ywdcQs3VdusJL3rK2xOaAQ0b3iRoUgdHBA9qt/aorHMR2wL+Nt2o+ww5drdrfncnG5+JO9WkzWw/b2LMYsul4TsqIth5Wri7iS4krJzau/PkOjUzI6TS5hfPOEIbDm92/yMPhljp4FqTj2VBRdY95Kl/XFnwkxqACfpaYg6dtYyx+iLMn9EYVckDKNx6lapaAA7k11T6wqpirTTAjdeIIA/8Uyjy3sCpeUXpQVzyIYa5BkPz6mRMl2PXNezUGrsA9IAEzIYR7ijB5za8Bv3F+cous69qqFW3cTf61lrWYLUYjbkuT8U9bVQAQJIWOJtg7MZpZPQB56KkzESKVwXKSb45GNw4AySFtNCISxgRdCWxnjf/10YSbUHNwy2ZSkfRwnstQCiOF0lgWKNofCz0MvVXby7X/mkc7oYj48AQ69048S4ymfpMpdhxkOtt/jtUdxz8oIt5MU5mttXqFg7lGg6jOrW6S2qQqrftwFO073SSLqGbQT1dgAOFvWJ7GjDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(6506007)(7696005)(38070700005)(9686003)(26005)(41300700001)(86362001)(316002)(478600001)(6916009)(122000001)(38100700002)(71200400001)(83380400001)(66446008)(8936002)(5660300002)(33656002)(76116006)(52536014)(2906002)(66946007)(64756008)(8676002)(66556008)(55016003)(4326008)(186003)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gm348I1MaCfawh1gR1sFvtEQAib3+SWDgvW+h1E52BakD3bK09MhCGhqQonL?=
 =?us-ascii?Q?vjXe+0XVjfMI7aFcMhAy5K/ZgW7Yyc+sODtEhYwtX4LMyb7Vh6Qbhh/cztGd?=
 =?us-ascii?Q?wysWeEROWwhjq5gmUVtxASFVdPBLQtjnCX4KaKRX8rlN0PsrKAePh1880TMC?=
 =?us-ascii?Q?xJmP5+3aTVraoqgZRiy5kwZ2ULweNjLpLpL8oDXSGqful80eWs6ZXOAP4VX4?=
 =?us-ascii?Q?qpmj07yE2zQP8PqcbAS1yf4LKFEZhWZWrgyICG+di04LxhhED7LoqBJR6K6e?=
 =?us-ascii?Q?jBgpqWIKxaMubBPhQ07jH+lpKnnHPzMYye4xSW74rwCNNe3e8w6fE7Zj3Vxb?=
 =?us-ascii?Q?sRYYv6hBQUKR/q5QRguMU1Zx1VRkWmJ53gZawxectDYN0Z21AC2M2Tioqg8r?=
 =?us-ascii?Q?DmmZ1G06NFjQ0/r6TCznRpn2iC7cNyVzk8WrATC4JEkNHvt9KNcWy1pAgQRe?=
 =?us-ascii?Q?I+h08SumO43ok0OEyakou5ESTUt0h0MuBB76VYrk9+Y472MZylWjdRr642U1?=
 =?us-ascii?Q?iih4D+OTfwnuueJkwAYf3//oLcB3QyWR16/nTOG30SjwnXtUyzHeaKlUTjb3?=
 =?us-ascii?Q?Q6hWQOONsYXN1WLHLDYyJfmRUQVhpkrOFyIFXHNgMG8FLCPtVKBHWaEfkG9Q?=
 =?us-ascii?Q?Tlu/Y8N/CkE8AzeOZaf+YJJux4BNHVPYhsLEsL2iR7VroZmSp5GUiIzdkXV4?=
 =?us-ascii?Q?+XXyQ3nYE6LZWaXiLYjW2WV6zSgmbhhZ6fslwkmS6BVYLcDVfZh+G0+vrdYl?=
 =?us-ascii?Q?1Us6Z0u9jot8UpVAzNFLVcpSkFrdMFZNfW/57oX23G+pbj5cpnQBIsNAnk89?=
 =?us-ascii?Q?C5mH2NXTBznAQqZ8RM0Vxsy59M/uZQrfcZbWP6Hhmt0/RS4FlQEVBxCC/+eQ?=
 =?us-ascii?Q?LTpio+8uaYHMTrLaopNoC0j8EU2A17RO7pha8ATmAVbwSux+84NWFWKBiLVQ?=
 =?us-ascii?Q?jRng9VGGVWPoQ8/DcKQ2FvuNmRgWvqrQyod8ifG558yf4rbycx5K1MTirrnT?=
 =?us-ascii?Q?jtMGMvClKspahoeqpcApi15UUl1HbEbOUDUDZpNaR7j7vzr7lf4Q6hh1hvUB?=
 =?us-ascii?Q?bsLS0Mw/5FDaupfczjC6FTdw5qjYUTZdcXE77kKVXE04K6MaMXanRAF12F53?=
 =?us-ascii?Q?tlM4hi+MVfW8q+XIi1G0LdiL19IGuUT+WOJGcZ1axhZB8AFoaTgoT05PCo4W?=
 =?us-ascii?Q?l6t+8YHaLJgFu3U5zC9spllj5yAJv9R0vsLHQvjvJbup9TcoDm3IZ11Hjw0u?=
 =?us-ascii?Q?ql8VZgke6UAzeyPhOKom1JUKEGT4ZUQ0yP7mNE5NshjndyodrCF9HdNjzTkK?=
 =?us-ascii?Q?sfhkTKXln6a4DvKfQtBh2wJf7j6IE7pcF5tvWKUTdVq9geoyNgznxoTbrS3T?=
 =?us-ascii?Q?CbzDE/SZhEQI4iXO/cLLCQ1/M6SXpjQBoJoH83s2odjWxMVn37uMprRLD5UD?=
 =?us-ascii?Q?RtKA0G6e07iv2EOfZMjyQikg9Ow6mXN292PFbF/29Rm43Ewa+DaBEY9ZfrOL?=
 =?us-ascii?Q?cGqXeRIra6GdyzWI3fq01UVpEHoYHg9dypvasWKvxgdu2uk4H/Qf+dzuReGK?=
 =?us-ascii?Q?ZZEA/Ou4fswIeSOLB/RKsqkldWIFSP1GIznHOpaa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synamedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5345.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 948d4290-ca02-4ec4-59e8-08da94c489cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 13:41:47.2027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecdd899a-33be-4c33-91e4-1f1144fc2f56
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qh2eHFD1zuS+eRR8oayFdPZn31ln8xofUVV+CT7V5OfJy6MucQABKb2/K02+5NJ+M+NkLEaPtS8M5LdRArvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6472
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> i am trying to figure it out, how can i configure Mellanox mlx5 card to=20
> use XSK(XDP)-ZeroCopy queues instead of normal RX queues and use RSS to=20
> spread traffic.

Hi,

Did you find a solution for your problem?

I had the exact same issue. My application needs to handle far too many inp=
ut
flows so I cannot use flow steering. To let RSS do the job automatically,
I applied a patch locally (see below) to enable queues in the range
[#channels .. #channels * 2) when configuring RSS via 'ethtool -X'. This up=
per
half of queue numbers refers to XSK queues, like it does for 'ethtool -N'.

This patch works for me, but:
1/ I'm not familiar with the driver code, so it is very well possible that
I made some stupid mistakes.
2/ I have doubts whether this patch is the right way forward. I started usi=
ng=20
AF_XDP under the impression that it would be give me a hardware independent
interface for fast packet I/O, but with this approach user space ends up
implementing driver-specific logic anyway (how is user space supposed=20
to know that it should bind to the upper half of queue indexes?).

Thanks,
Dries De Winter

---
 drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c   | 14 ++++++++++++--
 drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.h   |  3 ++-
 drivers/net/ethernet/mellanox/mlx5/core/en/xsk/pool.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c  |  5 +++++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c b/drivers/=
net/ethernet/mellanox/mlx5/core/en/rx_res.c
index 0015a81eb9a1..1a519cc39325 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.c
@@ -533,8 +533,12 @@ void mlx5e_rx_res_channels_activate(struct mlx5e_rx_re=
s *res, struct mlx5e_chann
        nch =3D mlx5e_channels_get_num(chs);

        for (ix =3D 0; ix < chs->num; ix++)
+       {
                mlx5e_channels_get_regular_rqn(chs, ix, &res->rss_rqns[ix])=
;
-       res->rss_nch =3D chs->num;
+               if (!mlx5e_channels_get_xsk_rqn(chs, ix, &res->rss_rqns[chs=
->num + ix]))
+                       res->rss_rqns[chs->num  + ix] =3D res->drop_rqn;
+       }
+       res->rss_nch =3D chs->num * 2;

        mlx5e_rx_res_rss_enable(res);

@@ -632,6 +636,8 @@ int mlx5e_rx_res_xsk_activate(struct mlx5e_rx_res *res,=
 struct mlx5e_channels *c
        if (!mlx5e_channels_get_xsk_rqn(chs, ix, &rqn))
                return -EINVAL;

+       res->rss_rqns[mlx5e_channels_get_num(chs) + ix] =3D rqn;
+
        err =3D mlx5e_rqt_redirect_direct(&res->channels[ix].xsk_rqt, rqn);
        if (err)
                mlx5_core_warn(res->mdev, "Failed to redirect XSK RQT %#x t=
o XSK RQ %#x (channel %u): err =3D %d\n",
@@ -640,7 +646,8 @@ int mlx5e_rx_res_xsk_activate(struct mlx5e_rx_res *res,=
 struct mlx5e_channels *c
        return err;
 }

-int mlx5e_rx_res_xsk_deactivate(struct mlx5e_rx_res *res, unsigned int ix)
+int mlx5e_rx_res_xsk_deactivate(struct mlx5e_rx_res *res, struct mlx5e_cha=
nnels *chs,
+                               unsigned int ix)
 {
        int err;

@@ -649,6 +656,9 @@ int mlx5e_rx_res_xsk_deactivate(struct mlx5e_rx_res *re=
s, unsigned int ix)
                mlx5_core_warn(res->mdev, "Failed to redirect XSK RQT %#x t=
o drop RQ %#x (channel %u): err =3D %d\n",
                               mlx5e_rqt_get_rqtn(&res->channels[ix].xsk_rq=
t),
                               res->drop_rqn, ix, err);
+
+       res->rss_rqns[mlx5e_channels_get_num(chs) + ix] =3D res->drop_rqn;
+
        return err;
 }

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.h b/drivers/=
net/ethernet/mellanox/mlx5/core/en/rx_res.h
index b39b20a720e0..0991944f4adf 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/rx_res.h
@@ -42,7 +42,8 @@ void mlx5e_rx_res_channels_activate(struct mlx5e_rx_res *=
res, struct mlx5e_chann
 void mlx5e_rx_res_channels_deactivate(struct mlx5e_rx_res *res);
 int mlx5e_rx_res_xsk_activate(struct mlx5e_rx_res *res, struct mlx5e_chann=
els *chs,
                              unsigned int ix);
-int mlx5e_rx_res_xsk_deactivate(struct mlx5e_rx_res *res, unsigned int ix)=
;
+int mlx5e_rx_res_xsk_deactivate(struct mlx5e_rx_res *res, struct mlx5e_cha=
nnels *chs,
+                               unsigned int ix);

 /* Configuration API */
 void mlx5e_rx_res_rss_set_indir_uniform(struct mlx5e_rx_res *res, unsigned=
 int nch);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/pool.c b/driver=
s/net/ethernet/mellanox/mlx5/core/en/xsk/pool.c
index 279cd8f4e79f..0a9b46ad7976 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/pool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/pool.c
@@ -169,7 +169,7 @@ static int mlx5e_xsk_disable_locked(struct mlx5e_priv *=
priv, u16 ix)
                goto remove_pool;

        c =3D priv->channels.c[ix];
-       mlx5e_rx_res_xsk_deactivate(priv->rx_res, ix);
+       mlx5e_rx_res_xsk_deactivate(priv->rx_res, &priv->channels, ix);
        mlx5e_deactivate_xsk(c);
        mlx5e_close_xsk(c);

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers=
/net/ethernet/mellanox/mlx5/core/en_ethtool.c
index 2d3cd237355a..e7fcfe2e3325 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
@@ -2136,6 +2136,11 @@ int mlx5e_get_rxnfc(struct net_device *dev, struct e=
thtool_rxnfc *info,
         */
        if (info->cmd =3D=3D ETHTOOL_GRXRINGS) {
                info->data =3D priv->channels.params.num_channels;
+               if (priv->xsk.refcnt) {
+                       /* The upper half are XSK queues. */
+                       info->data *=3D 2;
+               }
+
                return 0;
        }

--
2.12.2
