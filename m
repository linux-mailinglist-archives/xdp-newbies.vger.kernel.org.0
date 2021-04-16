Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4A362544
	for <lists+xdp-newbies@lfdr.de>; Fri, 16 Apr 2021 18:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbhDPQMe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Apr 2021 12:12:34 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:59075 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239949AbhDPQMd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Apr 2021 12:12:33 -0400
Date:   Fri, 16 Apr 2021 16:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zemek.io;
        s=protonmail3; t=1618589526;
        bh=onM75DqkUIb+RxDhHT/DZeuGi8+82uYaCpbYn4rVEd4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=rebxlz1AKU381pVD30XEiEyCKdVaFNeld1D70s0pzK82Fe0FWYhl91LWD88EQ+mzn
         vkiNDGKLPrDRjj8NudQ/hgE6a96KHuBeflIFX2tn3EA7zxvrGODL1ogop6ucbPuweZ
         cjMckHv4bmVtfRtEL2feAbYyzGrjyusDHDda7KxmhWShpCTsaBMlUMhSCBQ3E/1QJN
         IfbhsHIYx2VDuzR5mWIFEk/Kt7kRtPZxHDhV8fDNrM9hhMJHHYgs8Uzj2s2UNmX0TX
         +CNpXCP1zo30O/6FEApMdBWEKfS7RbfwYAruQD7KP4PeAnRcJEDVt2GZQwNUx3nW5A
         9dI8iyx6ozcXw==
To:     David Ahern <dsahern@gmail.com>
From:   Konrad Zemek <konrad@zemek.io>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Reply-To: Konrad Zemek <konrad@zemek.io>
Subject: Re: bpf_fib_lookup VLAN
Message-ID: <wp7cnO1IP6giAEl4UWGVelu8OW0KZBpz0HlppNPYs4GhRWtivZWXv4OyyzN1-wPmAlwk5UXVLCDdLmABA8HdEAp5sCE-yj2fyu4Qlzwtmpo=@zemek.io>
In-Reply-To: <9e19881a-1f62-410f-8dec-0eff0c7ea03b@gmail.com>
References: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io> <9e19881a-1f62-410f-8dec-0eff0c7ea03b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

(Sorry for the double mail David, I missed the "reply all" button).

On Friday, April 16, 2021 5:35 PM, David Ahern <dsahern@gmail.com> wrote:
> On 4/16/21 5:03 AM, Konrad Zemek wrote:
>
> > So both vlan fields in the output struct bpf_fib_lookup are always zero=
. I
> > haven't seen this commented on anywhere, including the discussion aroun=
d
> > introducing bpf_fib_lookup, so I assume it's an accidental oversight.
>
> The uapi was setup to cover the use case, but VLANs are not supported at
> the moment.

I'm surprised it's not marked as such in the bpf.h, the comments (or rather
lack of) made me convinced that it works just as well as the MAC address
fields.

> On 4/16/21 5:03 AM, Konrad Zemek wrote:
> > Do you have any proposals for a workaround? Right now I'm thinking of
> > creating a BPF map that would map ifindex->vlan, populated in the users=
pace
> >
> > -   but that assumes the output (struct bpf_fib_lookup*)->ifindex will =
be an
> >     index of the vlan device and not the physical device the vlan is at=
tached
> >     on, which I'm not sure is the case yet.
> >
>
> vlan netdevices do not support XDP redirect.
>
> It's not a trivial problem to handle VLANs or stacked devices in
> general. I have working code here:
>
> https://github.com/dsahern/linux/commits/bpf/mpls-vlan-fwd
>
> but it is not ready for submitting upstream yet. The use case and
> related ones need more work.

They don't, but it's not that important for my use case. I have just
one interface and all the VLANs are on that, so if I learn that a
VLAN is needed it's just another thing I push in front of the tunnel
frames that I already push. If I had multiple interfaces, I'd just
need one more piece of info which is "what's the physical interface
number this VLAN is attached on".

XDP programs are already pretty specific to the infrastructure one's
running, and already very manual with packet manipulation (which is
actually a boon to a lot of things I'm doing), so I don't mind this
not being a generic solution.



