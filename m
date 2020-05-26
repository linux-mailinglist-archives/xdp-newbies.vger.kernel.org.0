Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6CD1E20AE
	for <lists+xdp-newbies@lfdr.de>; Tue, 26 May 2020 13:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388726AbgEZLKC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 26 May 2020 07:10:02 -0400
Received: from mail-am6eur05on2065.outbound.protection.outlook.com ([40.107.22.65]:29591
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388683AbgEZLKC (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 26 May 2020 07:10:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpRxnqlZ/Dg3nhzJm8Ss/a7IsSA0/DLRFcmTkDCtW26vDQYZTyLrkWASgXLeIZ95RBRSH7zwFyrbhKKtdwahoiZZIEhwzV5IVsZ67sdhdzcq2ZDQNKdCTptAzMSlYyBQDxLSuI/XKiGYMH4IgkSxwYTXvnX002GyHKglj6S49twOLwJojB/j7wbApmSMAmyn80SIc628K16eeiJDG1NWGFvmYwkX2r2mDhYvsyBX/rrUZR7LO3Wr5gDj2b/6oXg0imoB3Qa6xlQ4jepAplk3JkPa2HnaJJMf+pHP166PhD04dmPEUBodZTS13s7UYouQgS878pXxPGQNx0trMhY5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Bri5RyoKSuFFqVhOZOHQt8e1tdRnZoGXL2QUILomY=;
 b=AelaUjI89YKdqsP9Z4ge75hp9eogUQW5rFjQIfKZmomhqP5mcVX1DhvK8ANkWstCeCy+LLhpT8z8Y5US0rhTvuDipKtsuwSZ2FHRInnTgvBj+On0kOggLdnLEL7G0LAeoUDkodkXe9571tMQIYNp8LnJ0Ooy9il8OQVn3erAaSifJ895DK7Hfs6SZVMwbFKiJ53rzkQSvgzeFJToC/LyPnbhR7jXeb+CMu4QQpilmeyStLuXPk+hQQYftJXIdCbkAHTYg8Y3X7KuJk0yYuW1zIFg+EbAd3VllLjwyWIhcfxmj0aenjXxuSGrz2HkkkGPfp0XrsrRvZO0DipvJbIC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fer.hr; dmarc=pass action=none header.from=fer.hr; dkim=pass
 header.d=fer.hr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ferhr.onmicrosoft.com;
 s=selector2-ferhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Bri5RyoKSuFFqVhOZOHQt8e1tdRnZoGXL2QUILomY=;
 b=dk07WNP6FEwtk64HDP4OIVNrrALeHPhQL867rzVv7ygNBdDVo2PzDd+H85pbTpCrwu/mvbRDbkWxgcOoBNd+BiZ9ybWD/tmlE7TzAi773VQMqCkMx3oeoy460PX0W7qZO0rtmnbyzHKUEIuUKe7nnalPW6ZNauTINC+15yd1v6w=
Received: from VI1PR08MB3360.eurprd08.prod.outlook.com (2603:10a6:803:3f::19)
 by VI1PR08MB5549.eurprd08.prod.outlook.com (2603:10a6:803:100::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 11:09:58 +0000
Received: from VI1PR08MB3360.eurprd08.prod.outlook.com
 ([fe80::ade5:815a:4dbd:b908]) by VI1PR08MB3360.eurprd08.prod.outlook.com
 ([fe80::ade5:815a:4dbd:b908%3]) with mapi id 15.20.3045.016; Tue, 26 May 2020
 11:09:58 +0000
From:   Denis Salopek <Denis.Salopek@fer.hr>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: XDP_REDIRECT forwarding speed
Thread-Topic: XDP_REDIRECT forwarding speed
Thread-Index: AQHWMytXvoozc+R8o0SstslgMG/5uKi6AkmAgAAvesE=
Date:   Tue, 26 May 2020 11:09:58 +0000
Message-ID: <VI1PR08MB33600F67AF097A722317F7228BB00@VI1PR08MB3360.eurprd08.prod.outlook.com>
References: <AM0PR08MB3345DF6A3FABBCF262B39E968BB00@AM0PR08MB3345.eurprd08.prod.outlook.com>,<20200526100443.2c927057@carbon>
In-Reply-To: <20200526100443.2c927057@carbon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fer.hr;
x-originating-ip: [93.138.136.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ae190d4-e178-41a6-1f1e-08d80165540b
x-ms-traffictypediagnostic: VI1PR08MB5549:
x-microsoft-antispam-prvs: <VI1PR08MB55493C4C98BA151F8052E0988BB00@VI1PR08MB5549.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0idELUPvg51UNtra3RiN08tPARtxPSBfoZ1NEwrM/qyvrvt0STd8eXOb5Sefh6tHQcob//p4flnEdwrRTaBnsd3AZEjzkG9sCRH3htsEcBXf8TYp9J7SBcHTq80mQg1PLRV+KkVerPZNcURy6KBQMaenHw6KHEpYueaiBB3iGWtXXlSaM5jpADzY8zwtO+w2rR4FWRzWX6rd+sDNpcx4JOSvhc1VtWndgEmV5NlYWrPApOfe6OPxQ7NF9+UTzQSL2b6OhiqdUKreCbiQa3WoolqUzZecZXu3snpb0pLGmKPqNroeJdeM+uRu/sI2NcXyBt4g6+a/bVQpJ3x5u9LoY9EdcVYjckUWKPJaPitlV1uVF9NU60ZgvmVQNXLd7aMMGz0JVuZPtcJTL9gzsPiQeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3360.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39850400004)(346002)(396003)(376002)(136003)(52536014)(53546011)(55016002)(478600001)(8936002)(9686003)(6916009)(71200400001)(7696005)(316002)(186003)(2906002)(966005)(26005)(86362001)(6506007)(54906003)(33656002)(64756008)(7116003)(76116006)(5660300002)(45080400002)(8676002)(786003)(66574014)(66446008)(66476007)(66946007)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VpSd7/ipWUhE91ug/OnxPpIs0DF7e1ZyiCOZls6hlamVM/jv6HCAvD4zk0d1Bdz/UHfv7WZdGIEsuju95Q/iCoXCF/C3/ATCGSGAnwrzvAL/x+hLyBefbHIxjMgtEC9FjpvHryIHfSiuBo22tXfxTd8G/3zkFFfZrBgPnP/cFcCZpMIAIQ2QGrxQn28sqy6wzmihhmalEasmMyO3MZHmz1H5gHKPl9DqWgTesYXNUxLZTcvv2NxjdDAErMKoF0PJSjU3Ae1+eq89VTexZzGfpm8vAfuTW4y4gsJW9B/qIR+nJB8Qda9JgQNTtAXPIqpDnU4t05RLD9TfekuCewScGTVkWNcBsp5QN77Bx35sp/DuiBzsfIbOcUUonrnl53yPe1EkEU0ra38d4RKpQmTEYFmNIOO53qcKN/snYLrFbtlVXsQdRRFudwtJr3oB8gFbMIeyyOl+7XvWPFM/knqLo+pVZayh5dcdy1NbZz9poi2OjbJJg9y7XzvgygTUT7Ed
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fer.hr
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae190d4-e178-41a6-1f1e-08d80165540b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 11:09:58.6005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca71eddc-cc7b-4e5b-95bd-55b658e696be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Irx3AVQ3RcDnP2M27WgMGwSo55iZXDDt4L9lK679HmL4/3K1J7iiK+WxGJfzbqHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5549
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> From: Jesper Dangaard Brouer <jbrouer@redhat.com>=0A=
> Sent: Tuesday, May 26, 2020 10:04 AM=0A=
> To: Denis Salopek=0A=
> Cc: xdp-newbies@vger.kernel.org; Alexander Duyck=0A=
> Subject: Re: XDP_REDIRECT forwarding speed=0A=
> =0A=
> On Tue, 26 May 2020 07:00:30 +0000=0A=
> Denis Salopek <Denis.Salopek@fer.hr> wrote:=0A=
> =0A=
> > I want to make sure I did everything right to make my XDP program=0A=
> > (simple forwarding with bpf_redirect_map) as fast as possible. Is follo=
wing=0A=
> > advices and gotchas from this:=0A=
> > https://www.mail-archive.com/netdev@vger.kernel.org/msg184139.html=0A=
> =0A=
> I prefer links to lore.kernel.org:=0A=
>  [1] https://lore.kernel.org/netdev/20170821212506.1cb0d5d6@redhat.com/=
=0A=
> =0A=
> Do notice that my results in [1] is for a single queue and single CPU.=0A=
> In production I assume that you can likely scale this across more CPUs ;-=
)=0A=
> =0A=
> > enough or are there some additional/newer recommendations? I managed=0A=
> > to get near line-rate on my Intel X520s (on Ryzen 3700X and one=0A=
> > queue/CPU), but not quite 14.88 Mpps so I was wondering is there=0A=
> > something else to speed things up even more.=0A=
> =0A=
> In [1] I mention the need to tune the TX-queue to keep up via either=0A=
> adjusting the TX-DMA completion interrupt interval:=0A=
> =0A=
>  Tuned with rx-usecs 25:=0A=
>   ethtool -C ixgbe1 rx-usecs 25 ;\=0A=
>   ethtool -C ixgbe2 rx-usecs 25=0A=
> =0A=
> Or increasing the size of the TX-queue, so it doesn't overrun:=0A=
> =0A=
>  Tuned with adjusting ring-queue sizes:=0A=
>   ethtool -G ixgbe1 rx 1024 tx 1024 ;\=0A=
>   ethtool -G ixgbe2 rx 1024 tx 1024=0A=
> =0A=
> This might not be needed any longer, as I think it was Alexander, that=0A=
> implemented an improved interrupt adjustment scheme for ixgbe.=0A=
=0A=
Thank you for the info.=0A=
=0A=
> > Also, are there any recommended settings/tweaks for bidirectional=0A=
> > forwarding? I suppose there would be a drop in performance compared to=
=0A=
> > single direction, but has anyone done any benchmarks?=0A=
> =0A=
> As this was 1-CPU you can just run the other direction on another CPU.=0A=
> That said, it can still be an advantage to run the bidirectional=0A=
> traffic on the same CPU and RX-TX-queue pair, as above issue with=0A=
> TX-queue DMA cleanups/completions goes away.  Because, the ixgbe driver=
=0A=
> will do TX-cleanups as part (before) the RX-processing.=0A=
=0A=
Yeah, you are right, bidirectional yields 10-15% more pps.=0A=
=0A=
> What is your use-case?=0A=
> e.g. building an IPv4 router?=0A=
=0A=
Just exploring the performance potential of userspace vs XDP for=0A=
DDoS-scrubbing type middlebox (i.e. forwarding) tasks.=0A=
=0A=
> =0A=
> --=0A=
> Best regards,=0A=
>   Jesper Dangaard Brouer=0A=
>   MSc.CS, Principal Kernel Engineer at Red Hat=0A=
>   LinkedIn: http://www.linkedin.com/in/brouer=0A=
> =0A=
> =0A=
=0A=
Denis=
