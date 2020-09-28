Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE20927B1B5
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 18:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgI1QUR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 12:20:17 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com ([40.107.22.127]:61680
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726344AbgI1QUQ (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 12:20:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWrBK07m609gH4j3Gv0WgnktqzObjiSB85yf8Gko0/TSruIpOGvWSxfC403PBlUuLty8VLvk9hPCJUkDhbzHKpwge7Ei/ZObRlZXPtllrWjJaXZ4UlDgjjl+EuSUuq1cw/9HtaWQCeuiI2SJavKP3/haMce9dXPUdfJFcfjJ0Mvt0TfSxv+PueKGn8nNYP98CkHle1fIH6pIPK7TCFTRyCKSJmqzogLLdvznffGicdMqHOCHoClHhz440WbjYxEPKRlZs+eyqCT5ksBchVEuWMcuQGT3t79U8TeFVKgYoCSATm/ZBOUdrxNkSjAE+JyDLd5tTXfn7BFhxby/Ruda9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyKs1Ph1ux9DStDpP598NvS15mTgDZvIjm4FRBLUMgA=;
 b=dd0lF5yhq+xiIN8ba6dHA3h/NlNVW7vRzIKBY44/okROElBTxF8f1Su5OuptwXDVYP+nIkmL4a76JDouF9oOXZd58J8/800i4p80rTXoNaBJuA4xVpt4AsN4WnzumgIZbNpcr543s1gr/TxfQdAd/GHWGKxHHeiPabOnLR/PDYcn80sZikx9XnRzMU8wYYPXUMSRMFTOprvZFRtdlQ+mPATJym6XJiEVSLrLSggFld8B3+5Oc8Lana9g+VrAsS169yB3C31ZRzDQQ81OMfcMolOftyZGM6pZUay/+7w/YheaN8uQcSnaVK6zuuUKQ5S0YK1sXLqFxo0pxwyXcIfSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=voleatech.de; dmarc=pass action=none header.from=voleatech.de;
 dkim=pass header.d=voleatech.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=voleatech.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyKs1Ph1ux9DStDpP598NvS15mTgDZvIjm4FRBLUMgA=;
 b=LI+Q6WGACa5/aLiAncChe9P+SZsLiJz3A9zt29sMWT3sKlE0ZGPpjazGOtSD/Q3oGoMi6OiGCEsgZDlYgQwJKoRKqi3V+eo/R1ha0/bIBPYio5ddoESpg6nPpiDYXPurVxD1FnBdFvcFqsPL61sSW6kkfEUyQSan4OPXdwxrPok=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=voleatech.de;
Received: from AM8PR05MB7251.eurprd05.prod.outlook.com (2603:10a6:20b:1d4::23)
 by AM0PR05MB6739.eurprd05.prod.outlook.com (2603:10a6:20b:145::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 16:20:11 +0000
Received: from AM8PR05MB7251.eurprd05.prod.outlook.com
 ([fe80::94b8:d700:da06:a7c]) by AM8PR05MB7251.eurprd05.prod.outlook.com
 ([fe80::94b8:d700:da06:a7c%4]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 16:20:11 +0000
Date:   Mon, 28 Sep 2020 18:20:10 +0200
From:   Sven Auhagen <sven.auhagen@voleatech.de>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     David Ahern <dsahern@gmail.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        intel-wired-lan@lists.osuosl.org, ThomasPtacek@gmail.com,
        Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: bpf_redirect and xdpgeneric
Message-ID: <20200928162010.wpv6ukqscuxaxtnj@svensmacbookair.sven.lan>
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
 <87lfh7fkqs.fsf@toke.dk>
 <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
 <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
 <20200928172449.50a3e755@carbon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928172449.50a3e755@carbon>
X-ClientProxiedBy: AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47)
 To AM8PR05MB7251.eurprd05.prod.outlook.com (2603:10a6:20b:1d4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from svensmacbookair.sven.lan (109.193.235.168) by AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Mon, 28 Sep 2020 16:20:10 +0000
X-Originating-IP: [109.193.235.168]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec6cd384-4f81-4192-4ccb-08d863ca5f9a
X-MS-TrafficTypeDiagnostic: AM0PR05MB6739:
X-Microsoft-Antispam-PRVS: <AM0PR05MB673906A32E3061E92BB40EFCEF350@AM0PR05MB6739.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYga2a96ku/oYXVfka++2hZ0hrkVIMehipBC8JrdoDcdXUdGcJp95ceH/VNpPm0uTPpk6hFb4bHf2M6mjLqjBCrBDJDYVZzrq90sSxfFaD4qxLZzurXC9b4tubOXvqELDgCupfwVjXdK4V/PsN2keOtHooTx5BqD6aSFSNldrx0TO0+CuJ0ycbtXsgGdAFBptAlcrbu6cYBpe+N6/0v0DtKQKM907Butk0MvKWD/J/PQG0UPi2SJVctn/dsB6KyesZQN5I9Dbdpkgvghyk6gbDcvK1EhluG06Qvqf2o/RvzKc6PIP7K9USF5MGK1cBsqJFUZEcxJj+EhoiA70hMlQeS+d3hK6VMJtV8gKcL6XPYA/HTd/d6gPAN/FNgF6FduZLSu4uctFUg9+YqRY8g3XxAIS+DmZznrukY8DAxxY52MJxkKr+PfcCNkK8aaVD1BRRXNcF35O8mwYT4hfolY5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7251.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(376002)(136003)(366004)(396003)(5660300002)(53546011)(478600001)(6506007)(6916009)(54906003)(966005)(66574015)(956004)(9686003)(66946007)(26005)(66556008)(2906002)(66476007)(45080400002)(8676002)(55016002)(52116002)(86362001)(44832011)(7696005)(186003)(16526019)(8936002)(1076003)(316002)(4326008)(7116003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: VkvsdZ6s61AAhRyahzbBykz0Fg7IWabK8AiAhV0Ppjv4ljU9fYkrjMBliGT9di9XdNz7Sj5tfXactsN+GfLP3fgxAx4NpGgy11YtTptGTru5r8HGmuA+aKG8yTIezLK/wVhsW2lR9W70Ktm2ctR7SUbHCgjrbjx9/hivDqAmFZd9ICR5qU2Sa32Y7+iPzd0jJ8pgYlzXugdgFonKXfYoA75Zj3yNL+ohBcGcvkjwv/1IvQjtZxonBtlEoNFZxgdOfYvwNTpyITe24WcfIQ9OUSo/yc2PXGpPOJCqOJZzx6X99y4LgjlkD0dyFZqHQuEw/eXOOhxYkZjT8WqCc2+ALDsUTstmvexHkmAFBZWcP4jLscePiPJr33cRz7H+pYS6WKUceKinzsXdoyOWMPh0POp33yHfFnBDbl+FyrZ7iiR+RsLA6SproMIwDoZIToVV2XUEyoO5aXJ5Wfow0hEPxhxZcppazeJQTCkCJ6TMPoIO8mdM665pwoIvK8ic3lXqvDChXuhiw3g4+TSuztdDNrhTqEiLRZH5U0LDkSmKnvEjTKzfKWNKnTK0pmG2z3GV7MAtRWhBo7ee3Wy+bShzNkRwA+iJUQAMdQOeJMAQgyKJMYNhLuj9sSt8BCbavuWo2ZbYdypVkrVcxChbkWx0gg==
X-OriginatorOrg: voleatech.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6cd384-4f81-4192-4ccb-08d863ca5f9a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7251.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 16:20:11.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b82a99f6-7981-4a72-9534-4d35298f847b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVxbIHNspPrzb0qeoa4RphTUqWHKnquI+W8REadW6nB6eiX6CgayLVV+cWdjTS0b88qkDQNkOLzP2HBWrTyRVY/X33pfdPr/OjLSR9lnM70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB6739
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Sep 28, 2020 at 05:24:49PM +0200, Jesper Dangaard Brouer wrote:
> On Fri, 18 Sep 2020 14:27:45 -0600
> David Ahern <dsahern@gmail.com> wrote:
> 
> > On 9/18/20 12:42 PM, Thomas Ptacek wrote:
> > > The setup is pretty simple. There's an eno1 (igb driver), to which our
> > > default route points. On the same box are several VMs. There's a tap
> > > interface (for each VM, call it tapX). Traffic for a VM flows in from
> > > the Internet on eno1 and is directed to tapX; the response traffic
> > > flows in the other direction.
> > > 
> > > I'm deliberately simplifying here:
> > > 
> > > eno1 runs an XDP program that does some lightweight IP rewriting from
> > > anycast addresses to internal VM addresses on ingress. eno1's XDP
> > > program currently XDP_PASS's rewritten packets to the IP stack, where
> > > they're routed to the VM's tap. This works fine.
> > > 
> > > tapX runs an XDP program that does the same rewriting in reverse.
> > > Right now, it also XDP_PASS's packets to the stack, which also works
> > > --- the stack routes response traffic out eno1.
> > > 
> > > I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.
> > > 
> > > I have the ifindexes and MAC addresses (and those of IP neighbors) in
> > > a map --- a normal HASH map, not a DEVMAP. Using that map, I can
> > > successfully redirect traffic from tapX to arbitrary other tap
> > > interfaces. What I can't do is redirect packets from tapX to eno1,
> > > which is what the system actually needs to do.
> > >   
> > 
> > XDP_REDIRECT sends the packet to a devices ndo_xdp_xmit function. tap
> > implements it hence eno1 -> tap works; igb does not meaning tap -> eno1
> > fails.
> 
> There is clearly a real-life use-case for adding native-XDP support for
> igb driver.  Sven (cc) have implemented this (v6[1]), but something is
> causing this patch to not move forward, what is stalling Intel maintainers?

The holdup is from the Intel guys.
There is a v7 with the changes for Kernel 5.9 but it was only posted on
the Intel list:

https://patchwork.ozlabs.org/project/intel-wired-lan/patch/20200902203222.185141-1-anthony.l.nguyen@intel.com/

They tested it last week so it should hopefully be merged in the next window.

> 
> To Thomas, you could try out the patch[2] and report back if it works
> for you?  (I think it will help moving patch forward...)
> 

I would be interested if it works for you as well.

Best
Sven

> [1] https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnetdev%2F20200902054509.23jbv5fyj3otziq2%40svensmacbookair.sven.lan%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ccbd762e5a024488f491b08d863c2b6cb%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369035229290801&amp;sdata=Pv%2BTEQeY4lcPnIprg0n6K0nHOMMlMo2qlrcmxqWNuLY%3D&amp;reserved=0
> [2] https://eur03.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fnetdev%2Fpatch%2F20200902054509.23jbv5fyj3otziq2%40svensmacbookair.sven.lan%2F&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ccbd762e5a024488f491b08d863c2b6cb%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369035229290801&amp;sdata=CmlEramL%2FHGz745N6HP%2FWRzPwZs0ERh3kQ8%2Bj%2FIUztw%3D&amp;reserved=0
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: https://eur03.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.linkedin.com%2Fin%2Fbrouer&amp;data=02%7C01%7Csven.auhagen%40voleatech.de%7Ccbd762e5a024488f491b08d863c2b6cb%7Cb82a99f679814a7295344d35298f847b%7C0%7C0%7C637369035229290801&amp;sdata=LJUt38GAkdXS2rW7WG%2BUS0d6eVxZfl3VJqyHvNsqLmY%3D&amp;reserved=0
> 
