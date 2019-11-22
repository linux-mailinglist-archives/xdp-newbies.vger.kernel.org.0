Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EC41077FD
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 20:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfKVT0d (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 Nov 2019 14:26:33 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44888 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfKVT0c (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 Nov 2019 14:26:32 -0500
Received: by mail-oi1-f195.google.com with SMTP id s71so7459384oih.11
        for <xdp-newbies@vger.kernel.org>; Fri, 22 Nov 2019 11:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berger-family.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=iW1T2fCG741Kxt0Lj2gRp1UqSLfn0iXVuTVn+/Ud+cw=;
        b=ZFCQnfvA90QuUGCpjDkFLb/D1Phv9x5TtzLvPNfRQ+E12veQmRNs7PBWGaMGsNHzwF
         Ti4iHHNsDRHkBsZBjl56QmQscsU4mF/YNptAkwJ51CVvkL16CpSZ69mM6uzZ29m1QUgc
         We1gmjsJ4z2AXHE/NISkqdrmNe2bYpQ8NHuaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=iW1T2fCG741Kxt0Lj2gRp1UqSLfn0iXVuTVn+/Ud+cw=;
        b=Jhe7LQ2MBUZtLfuDih4EsU+csrARr33dYNYdvOiWG+7BZjd/XFDsHPtDLE6gyaq4Iz
         8cD2rlY6QjYx0XiVBO6H+8Fhp4Yml4P6XeDhbOFjs+3ILUujiBJnAGBpvXwX8GZhyllB
         gY7cwAw58btnIIkurmja+rb1zDVVSIPQMXHCG8ijExWv61RCZsHBCtWkmBHL+/ye8lIp
         1JO844Hp5twZg7eBYqu9ojzt1KJcay/pPfhJgH/uhOWptBugeqFhCD/7f8HT761Eac2E
         fp5QBWTs7+ja8DGqd4OgWZyZm5C8K5GPUgHduPZ/we10X7e/RaU1GzaAwIWhi5pwAQ5i
         yF/Q==
X-Gm-Message-State: APjAAAWkviTqvjbtx5ocjHN8Amt+3WrktxMU9TmtfCV/HKg5m8f7tCIU
        bl2zso9XAd9ymU+PAOhla3PBaLoN3+JgkHkxxC2WvK13zU5Ahg==
X-Google-Smtp-Source: APXvYqx+cOulvSDniNGTyDGCTgd8AaYNW7KIuZnhWFCAcRFtrim2SSOIBnnqx4imEhui8l8EloGLgr7D+iNYN8YruB4=
X-Received: by 2002:a05:6808:495:: with SMTP id z21mr13685029oid.18.1574450791091;
 Fri, 22 Nov 2019 11:26:31 -0800 (PST)
MIME-Version: 1.0
References: <CA+ZpPeySfq2H8RsPuJj0Y8dVkT5h09OHN=udtcxsvF_5_Tj+Lw@mail.gmail.com>
In-Reply-To: <CA+ZpPeySfq2H8RsPuJj0Y8dVkT5h09OHN=udtcxsvF_5_Tj+Lw@mail.gmail.com>
From:   Joubert Berger <joubert@berger-family.org>
Date:   Fri, 22 Nov 2019 14:26:21 -0500
Message-ID: <CA+ZpPeziZpoJuCcRUX6s0nAiB-UoWBfVfAVKc1LYgB7QcvDSbg@mail.gmail.com>
Subject: Re: XDP - Bridge - not redirecting all UDP
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I did some more investigation.

First, my setup:  Raspberry Pi (ARM7) running 64-bit SuSE
(4.12.14-lp151.28.25-default)
As mentioned before I have it setup as a bridge.  eth0 is using the
lan78xx driver and eth1 is using ax88179_178a driver.

I tried to simplify things, so use xdp-tutorial/basic01-xdp-pass and
changed xdp_prog_simple() to print the destination IP address:
int  xdp_prog_simple(struct xdp_md *ctx)
{
    void *data_end = (void*)(long) ctx->data_end;
    void *data = (void*)(long) ctx->data;
    struct ethhdr *eth = (struct ethhdr*) data;

    if (eth + 1 > data_end) {
        return XDP_PASS;
    }

    if (eth->h_proto != bpf_htons(ETH_P_IP))
        return XDP_PASS;

    struct iphdr *iph = data + sizeof(struct ethhdr);
    if (iph + 1 > data_end)
        return XDP_PASS;

    if (iph->protocol != IPPROTO_UDP)
        return XDP_PASS;

    bpf_printk("udp: dst port: %x proto=%d\n", bpf_ntohl(iph->daddr),
iph->protocol);

    return XDP_PASS;
}

Then wrote a small test tool to be able to send udp packets.  I have
it set to send 20 udp packets.
When I look at trace_pipe for the above print statement, I will see
less than 20 lines.

So, for some reason, I am not getting all the packets.  Any thoughts?
I am not sure where to go from here.

On Thu, Nov 21, 2019 at 3:42 PM Joubert Berger
<joubert@berger-family.org> wrote:
>
> I have been playing around with Ilya's xdpbridge sample.  In my case, what I am interested in is pushing all UDP traffic to userspace.  All other traffic can flow through my box.  So, I setup something like this:
>
> eth0 --> br0 --> eth1
>
> I then capture all packets on eth0/eth1 and return XDP_PASS for all but  UDP packets.  These I redirect it to the user space application. There I set the UDP checksum to zero, that way I know it hit my code and then send it to "other" interface.
>
> The problem is that not *all* my UDP traffic has the checksum set to zero.  Anyone have any ideas why that might be the case?  Why is only some of the UDP traffic being pushed to user space?
>
> --joubert
>
