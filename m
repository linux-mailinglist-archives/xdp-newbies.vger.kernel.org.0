Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCC92725AB
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Sep 2020 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIUNfm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 09:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgIUNfm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 09:35:42 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9198FC061755
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 06:35:42 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id gf14so7151633pjb.5
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qdrTb6l8iTZTbICRY/qQfCvqHV6jbimSgFMXzIHx5oU=;
        b=AAWwcW3LbjZPgOd2ROyhgy9Za3nA2l6ISHJZWOQsWkybfughAkgwqucTSwA1jdJDHe
         LlbCK3s26dn688WGH+Wa+iN3hYJPbpb1Ra7Pxenl0/KSWWD7+dOfkfn2auYYIqJvCle+
         iC6LahFqksuFcR5vh5FAMx9y19nGA6cLk8IzS4FGDYZIkoPL2en5yu+ETrdr2ldjz66R
         qYXu5pM4tKhym/nQZjn0eTA2OqSuabjcIdagocPql3D3LC7Tsux+PdLJU0VdXD1Ebf+e
         Js8KRgXfZ6jjpFslZqDnCKjkK6TKVdeCWl9NgWRz8EMGAoERUnGmhqD5VAh5NOrmPPpS
         ytSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qdrTb6l8iTZTbICRY/qQfCvqHV6jbimSgFMXzIHx5oU=;
        b=QXLOwYudv3VthV4EeXxkfdqeNzF4mS+uKJyfvdKIFej7usv7B0gB51RW9b4ENpWNMj
         14NwRpd7V1Paij+kVEYWPWs5dF/HQQSUg+1vUliyLIPreXPODsTqh4w+VBpMimE77+td
         ukREv2IHBRXmU/j/ZOxiZ0peIeGTokmYYah1NdfHhcprMbu8rctyd2NzCsXKkIFpmznQ
         w+ULwIXEzYVGSaWBwv1VsqT9uUTqso0p2rfi6sxLBfYEDXwOjG24GX/ZbPKYTnLqxnsE
         Wi7k6oR+G76sKYwhMf4w64NVogntgBAxytSNN0NTg4tiaHgjm0WgfcEjcnIHYLPH+1pq
         9GxQ==
X-Gm-Message-State: AOAM533uHpd1fo1IE2wW3yzlZ/QdaUo1n+Q1NTud0DD5g34U160I1V3n
        TDHfxaHZNoYpCSmPdsCRfh+f76k8DDmt1weCndJTfmL8
X-Google-Smtp-Source: ABdhPJwcT4F612kiaT2kijJX8hYwlOk/OSi3GkXpePUDVLEqoIi6awIhHzOf9ziaX1ddjmwMmtN+5Jgilhcgywrpyr4=
X-Received: by 2002:a17:90b:891:: with SMTP id bj17mr21591851pjb.11.1600695342061;
 Mon, 21 Sep 2020 06:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOfgOfuNuRo_dNO=RJcz1XiK_=hZmdopG12XcUFB_s0No3vsRw@mail.gmail.com>
 <87blhzqxa2.fsf@toke.dk>
In-Reply-To: <87blhzqxa2.fsf@toke.dk>
From:   Topi Wala <walatopi@gmail.com>
Date:   Mon, 21 Sep 2020 06:35:31 -0700
Message-ID: <CAOfgOft3xQgpxDmrExdJdPoiqcYD=yL0DNRHA6FRkgGKePQTQQ@mail.gmail.com>
Subject: Re: xdp-filter troubles
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sorry about the subject. I had to forward after using text (default is
http in gmail).
My kernel version is 5.7.17 (quite new). I am using xdp (ip link show
on the device shows the xdp, not xdpgeneric).
I'm using bpftool, since this is to deploy to a third party, and using
standard linux tools (bpftool, iproute2) is fine, userspace binaries
are not.
Is there anything I miss by not using the xdp-filter binary?

However, I think I have figured out the issue, and I'm quite surprised by i=
t.
It appears that as soon as the xdpfilter program is attached, the arp
entry for that IP is discarded from all the entities connected to that
bridge.
The peer node consequently does an ARP before ping, and since ARP is
not an IP packet, it doesn't show up in the bpf log.
Since the remote node doesn't get an ARP response (arp request is
dropped), it doesn't send the ping packet at all.

Thanks,
Hari



On Mon, Sep 21, 2020 at 2:44 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> [ adding a subject - please make sure to include one in the future ]
>
> > I have a setup that has 2 namespaces, connected using a linux bridge,
> > with veth pairs in each of the namespace.
> >
> > ns1=3D192.168.1.10/24
> > ns2=3D192.168.1.11/24
> > host-br=3D192.168.1.1/24
> >
> > I can ping between host, ns1, ns2 fine.
> >
> > I'm attaching an xdp filter program
> > https://github.com/xdp-project/xdp-tools/blob/master/xdp-filter/xdpfilt=
_dny_ip.c
> >
> > I'm using bpftool to attach this to ns1-host end. I also attach a
> > dummy xdp prog (that just returns XDP_PASS) to the end inside the ns1.
> > I see all ping packets to this destination dropped. Dumping
> > xdp_stats_map does show counters incremented for XDP_DROP
> >
> > However, when using bpftool to update the filter_ipv4 map to allow
> > packets with destination to go through, it doesn't work.
> >
> > ./bpftool map update name filter_ipv4 key 192 168 1 10 value 2 0 0 0 0 =
0 0 0
> >
> > I've tried with pinned maps, and different combinations of key/value
> > as well, to no avail. The lookup just doesn't seem to succeed. Any
> > suggestions on how I might go about debugging this?
>
> What kernel version are you using? And how are you attaching the program
> - from your description I'm guessing you may be using generic XDP? Also,
> why are you using bpftool to load the program instead of just using the
> xdp-filter binary?
>
> -Toke
>
