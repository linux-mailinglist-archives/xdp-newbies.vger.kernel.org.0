Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8413727B437
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 20:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgI1SOj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 14:14:39 -0400
Received: from mail-eopbgr70138.outbound.protection.outlook.com ([40.107.7.138]:49710
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726497AbgI1SOj (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 14:14:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8xoEsYoBYtBM0TgwoCxi768Q2Yf0nO79ZCTDWOX4AbDnWTS9JUfFlkSe7TXtgIOUxMsH0olCgW6D46+3KQS6Lf9pW731WaSMDjkHHsyySSwe/hCEzBx+rCQhIU6kmLaDOl0yuxPUY/GyBAGT9DQgevG+3WIVF2gJxOOItt27HVBGZj6guXQrCovW7XPWkDRrtYpJu/SCMbB8V6jjJB8FoAfMP1R5AR8nq20G6IMscUweWef4u5C0OD2l0XGTUcCaz/8youDa6Mm2JOp27Ym1FBMZfiplTX/WA9IvD5dxqW34u7IxnMcGJOEIBwiVHzzl5mcgqIDxNIrZM4Za75tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhXxaubb0zlt9QaPlKiTE/0vWNU82UIcbaVzyQYFqRc=;
 b=VxeGfU14+/B15m6yfsRCC8mLSXRcmjn6nWz3a0f/0X2KzEzDw2YFHU09JiyqIg3V9At6UyrU6/o9C45BefkGiltKUJchk1L7cwCyQ3Xwh0ZE2Z9vmZ/3tL2KMT3YqppgFm7k7DKfS8XEl5F6SiO6mCUZcroCb0OZeMypLj4pk0PRNVY29OCcd1E8FCshGfKj6MqGmGRP365m84ORqOmw6dFPCgsCaS7CWxXnb2NiDtLO48Xz3axuzEflHckYaqmDhGJOYOC3P/HFneLovo0VL2ubLgY3vlw74Z7m183T6gu4AJo/lHNd9OXuQPksyWLPSc5fkw50S3y31Xsf7BFrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=voleatech.de; dmarc=pass action=none header.from=voleatech.de;
 dkim=pass header.d=voleatech.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=voleatech.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhXxaubb0zlt9QaPlKiTE/0vWNU82UIcbaVzyQYFqRc=;
 b=bGJ1cyqx/xZcXAGx5vCIFu9PMWNE0FhCmAc3kPmY1ZdZ/v7fwVCrVdBOqp6zDM31ylHL+WPXPtAX/9bZF0TN6FFR510k3JQ1V0o/5NFk3DI76t4E6Vs10UiYH6QjXh0EDoRelMi5se9cDdsqBy9noipx7wcpzVgPFrUanfE5kkE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=voleatech.de;
Received: from AM8PR05MB7251.eurprd05.prod.outlook.com (2603:10a6:20b:1d4::23)
 by AM0PR0502MB3810.eurprd05.prod.outlook.com (2603:10a6:208:1e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Mon, 28 Sep
 2020 18:14:35 +0000
Received: from AM8PR05MB7251.eurprd05.prod.outlook.com
 ([fe80::94b8:d700:da06:a7c]) by AM8PR05MB7251.eurprd05.prod.outlook.com
 ([fe80::94b8:d700:da06:a7c%4]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 18:14:35 +0000
Date:   Mon, 28 Sep 2020 20:14:33 +0200
From:   Sven Auhagen <sven.auhagen@voleatech.de>
To:     "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>
Cc:     "brouer@redhat.com" <brouer@redhat.com>,
        "toke@redhat.com" <toke@redhat.com>,
        "dsahern@gmail.com" <dsahern@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "ThomasPtacek@gmail.com" <ThomasPtacek@gmail.com>
Subject: Re: [Intel-wired-lan] bpf_redirect and xdpgeneric
Message-ID: <20200928181433.v6bc5z4hza24es2c@svensmacbookair.sven.lan>
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
 <87lfh7fkqs.fsf@toke.dk>
 <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
 <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
 <20200928172449.50a3e755@carbon>
 <20200928162010.wpv6ukqscuxaxtnj@svensmacbookair.sven.lan>
 <f1a1a7c89fce4ba5c78da65700e02d353bb9e5d4.camel@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1a1a7c89fce4ba5c78da65700e02d353bb9e5d4.camel@intel.com>
X-ClientProxiedBy: AM4PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:205:1::44) To AM8PR05MB7251.eurprd05.prod.outlook.com
 (2603:10a6:20b:1d4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from svensmacbookair.sven.lan (109.193.235.168) by AM4PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:205:1::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend Transport; Mon, 28 Sep 2020 18:14:34 +0000
X-Originating-IP: [109.193.235.168]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20c6947f-a0e7-486f-28b5-08d863da5a9c
X-MS-TrafficTypeDiagnostic: AM0PR0502MB3810:
X-Microsoft-Antispam-PRVS: <AM0PR0502MB38107E8D7D3C12EB0CD62B25EF350@AM0PR0502MB3810.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWUOfGJ/DIxPL9xCZu+0OhB5AQZtYwLmYz30NHLYeNWTlexa9GfqI4eBLTnvQ8Z9clR6hXyQ8ew0+77X8rULenzu74LMqBfyU9KHCOOnM1ScGqn28FR6DhCkS48Qg20qbijwnmIXdscHJOKRAT+Vz3a+9uGWOdDYuRgBVFQz8ekYRhqJuZISmeFCcudTaKLZa9INFx3BQwwXtky/RQMhgja7qQIpBPCOZgnoc++PiiVSfRc/4sT0BViDnb5nGC9Dn2X6J564/56p8310VYh1D3DIcSDTMjhGuX7JJ9y28B0aCJ4cGDUFKNplYBReARjbjL8WjzsmCL5d5jjljiNS3bUzYXl9vebleF8YUynGHcwavSycog0/gOGu6zh7/ot8/1/vVQsAl3wTnoNqnPOP0Piwnld07yaU7w3m5/rqsPVXsIkZ2sQnOVRPZVQkHIuAeHgMAQdZ83Od+aBZqozmfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7251.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39830400003)(396003)(136003)(366004)(346002)(8936002)(66574015)(86362001)(52116002)(7696005)(1076003)(8676002)(478600001)(966005)(6916009)(16526019)(54906003)(26005)(186003)(316002)(66476007)(66556008)(956004)(45080400002)(44832011)(6506007)(53546011)(9686003)(55016002)(5660300002)(4326008)(66946007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: ByAgNnMeZyxsT7H/kv24RGXCFJ4Lx3oHHJBK2oTL3ql8GBFXxMpsRiglFcSFl6MEENEzou3n6MG9qRnDJy171/n8Eyt9wHb/JQwM04bTL5sm3eD+pGsGuc+FlmCxxGFEIRuJGIkysw71FfoDIBVOc4LF7C9w+xyigiQD/tDemugPrpSdRfPpEn3PwmpuJdAIw+2FurmsI1Q5UvSP0Vf5Wt4E+hT7nsOtAVMu6Oy/Nx5ym2/F0s3Om2ATNEc+jP3974Z6QTDWaZwhW7t6TCyeGHVXfSrKSUhknWFiuZat+SuajTuEwhWAY/errT/1g1cLHB81dYI8DaconKleLjTbuYZPL52uAKn213fMdgfPz7p/aLXeBlYhkrRlZn4k6I/LEt6sq/Ff8mplOyLrLjgajAsKs6au0jkLBqj/qh/VbaEvlvnHnYz88BDG+hh6AB9M4GPdWzuzYHeEXqLctPUKiDTt3wtLS34JkYg6w6YqKjWs2SH9T3QAXnA0WIpA2rDGuAWIxCzDmr2bKpHAinaA7Ba74bHiAnh+TEdObr+Xri0TSejGcHnbDxeKMyCAq3jGc3qZ92rfQwiftEBnkAVuK333PrBU4/x61UHMmFRo+E3dncVBTeeYBuVY+hUpDpQndh5FM4CZrC4yIpJawMlVMA==
X-OriginatorOrg: voleatech.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6947f-a0e7-486f-28b5-08d863da5a9c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7251.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 18:14:34.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b82a99f6-7981-4a72-9534-4d35298f847b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh844yw2BDdyIrjRmkzbdKfkLMJrXpia87yIeRksH1tOUzyb2xpdUfYL6wZp+65wTrfQNEousl7yyvVtypnY0dIudRrEJsKToScMZzaYo/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0502MB3810
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Sep 28, 2020 at 06:04:14PM +0000, Nguyen, Anthony L wrote:
> On Mon, 2020-09-28 at 18:20 +0200, Sven Auhagen wrote:
> > On Mon, Sep 28, 2020 at 05:24:49PM +0200, Jesper Dangaard Brouer
> > wrote:
> > > On Fri, 18 Sep 2020 14:27:45 -0600
> > > David Ahern <dsahern@gmail.com> wrote:
> > > 
> > > > On 9/18/20 12:42 PM, Thomas Ptacek wrote:
> > > > > The setup is pretty simple. There's an eno1 (igb driver), to
> > > > > which our
> > > > > default route points. On the same box are several VMs. There's
> > > > > a tap
> > > > > interface (for each VM, call it tapX). Traffic for a VM flows
> > > > > in from
> > > > > the Internet on eno1 and is directed to tapX; the response
> > > > > traffic
> > > > > flows in the other direction.
> > > > > 
> > > > > I'm deliberately simplifying here:
> > > > > 
> > > > > eno1 runs an XDP program that does some lightweight IP
> > > > > rewriting from
> > > > > anycast addresses to internal VM addresses on ingress. eno1's
> > > > > XDP
> > > > > program currently XDP_PASS's rewritten packets to the IP stack,
> > > > > where
> > > > > they're routed to the VM's tap. This works fine.
> > > > > 
> > > > > tapX runs an XDP program that does the same rewriting in
> > > > > reverse.
> > > > > Right now, it also XDP_PASS's packets to the stack, which also
> > > > > works
> > > > > --- the stack routes response traffic out eno1.
> > > > > 
> > > > > I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.
> > > > > 
> > > > > I have the ifindexes and MAC addresses (and those of IP
> > > > > neighbors) in
> > > > > a map --- a normal HASH map, not a DEVMAP. Using that map, I
> > > > > can
> > > > > successfully redirect traffic from tapX to arbitrary other tap
> > > > > interfaces. What I can't do is redirect packets from tapX to
> > > > > eno1,
> > > > > which is what the system actually needs to do.
> > > > >   
> > > > 
> > > > XDP_REDIRECT sends the packet to a devices ndo_xdp_xmit function.
> > > > tap
> > > > implements it hence eno1 -> tap works; igb does not meaning tap
> > > > -> eno1
> > > > fails.
> > > 
> > > There is clearly a real-life use-case for adding native-XDP support
> > > for
> > > igb driver.  Sven (cc) have implemented this (v6[1]), but something
> > > is
> > > causing this patch to not move forward, what is stalling Intel
> > > maintainers?
> > 
> > The holdup is from the Intel guys.
> > There is a v7 with the changes for Kernel 5.9 but it was only posted
> > on
> > the Intel list:
> > 
> > 
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fintel-wired-lan%2Fpatch%2F20200902203222.185141-1-anthony.l.nguyen%40intel.com%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683150522&amp;sdata=d1BsVNZlbp7Kgh8bmzailbrR22Y61%2B6mb0VdKtK30yw%3D&amp;reserved=0
> > 
> > They tested it last week so it should hopefully be merged in the next
> > window.
> 
> There were some email issues which prevented us from sending it out
> sooner (after it was tested). The issue was resolved Friday, I just
> sent the patch to netdev:
> 
> 
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fnetdev%2Fpatch%2F20200928175908.318502-2-anthony.l.nguyen%40intel.com%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683160513&amp;sdata=4h1AykO8YnnPSvulMtqeKZnjJ5DFOV1ISnd3OrFCOow%3D&amp;reserved=0
> 
> Thanks,
> Tony

Thank you Tony!

Best
Sven

> 
> > > 
> > > To Thomas, you could try out the patch[2] and report back if it
> > > works
> > > for you?  (I think it will help moving patch forward...)
> > > 
> > 
> > I would be interested if it works for you as well.
> > 
> > Best
> > Sven
> > 
> > > [1] 
> > > https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20200902054509.23jbv5fyj3otziq2%40svensmacbookair.sven.lan%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683160513&amp;sdata=isaa7n1ZQ780i4qBS4%2FcyY2jcH8hNGpcdM1k9C%2FREBw%3D&amp;reserved=0
> > > [2] 
> > > https://eur03.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fnetdev%2Fpatch%2F20200902054509.23jbv5fyj3otziq2%40svensmacbookair.sven.lan%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683160513&amp;sdata=FgceLkpqx8G456QFYfd9NtyzB0nR1Pah7xWtaYLs6ho%3D&amp;reserved=0
> > > -- 
> > > Best regards,
> > >   Jesper Dangaard Brouer
> > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > >   LinkedIn: 
> > > https://eur03.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.linkedin.com%2Fin%2Fbrouer&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683160513&amp;sdata=sSXuQu60fdu%2BbDMmJburEkEllprEuSXdb8n1L02FPNk%3D&amp;reserved=0
> > > 
> > 
> > _______________________________________________
> > Intel-wired-lan mailing list
> > Intel-wired-lan@osuosl.org
> > https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.osuosl.org%2Fmailman%2Flistinfo%2Fintel-wired-lan&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ce8e80921128f4ac3edac08d863d8f03f%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369130683160513&amp;sdata=Rgn71oeQEuNQ9jlX1bSnbcxiZnmAP3YBGM9GfbC1x94%3D&amp;reserved=0
