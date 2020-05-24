Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A481E02B8
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 22:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgEXUXw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 16:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgEXUXw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 16:23:52 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3247EC061A0E
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 13:23:52 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id v128so14494645oia.7
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fLfEsdQth9JuHzS/rDE2oTVWt3NEL/+VEK2zCdoN3R4=;
        b=i4SjhCdiImLnYVXeAPPJZyJnuepx+J6oK70AuSKeKL3Ip8bSPI/marnqJvzTAjM44W
         PyhxpmpZgpUFmgtnGXYvbS6wWpVszfyrhLBwcTtpkS78/psse03dju/YH7BODLD7j8vV
         pDAQP27v35qO5YsarIJpyVkhajayBp+fbWiInvs/ddXBeE3GX7X4OZ0IvM3w5VySXA34
         9Dwy1pWpIKz+vFrovAFfPUwebGFZvPaEO63Ozi2BxZMplWK+6rDPkOLGkOHv3ld8ojKY
         OvKA8xAhnJ2iv9ZuxyZmweg/vIuLXXPealhlurYWDRq8ms4/4I3qAE8qaV/awYxkP5G3
         3WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fLfEsdQth9JuHzS/rDE2oTVWt3NEL/+VEK2zCdoN3R4=;
        b=JsuA9cs4u/3UfuI3X4+XxQuq7XxLHuJ99Bbrq7VJmF4DDZIVHRIQn4GWg6AnBLu7S3
         R20Q5g8LPZVnqeDmS0r0mKqSrEaHuwmced1QU50Av/CvYAv5cNaBg8XI1GGDpBFONGq4
         R1IzDMCl5qDLZoKImBlWZ3P9WsCisBS9GOhaO8/oKl7uTvsmjK1UJb3xEwNcpMMiQvrr
         qB9hiE6IUoBvComtTE5zxVQcDWPOaCSLVMFGbfbYQ1KuC0ExXN3yq2NfJMUn7I176hJX
         ffRcG4zvb9OOJhj2lyckcD/Nu+7B68EJ2eKyiU4juaCqvvzyV4rFaxIzOwWFUflZZ5tt
         tP4A==
X-Gm-Message-State: AOAM531U6ywYTpucl3XkUleKrbLIHTShexabpBgfvgXgmvphjnx4wox2
        6TEBL6z6cEqJX7gQC20mICD96Rn0
X-Google-Smtp-Source: ABdhPJw5mj1GAEHlfkyJ2yAtM9iWwW6wkz6cZK8ANabEEkXZvj1apndkCpVaYFiBKoSmA8BnJ1ze/g==
X-Received: by 2002:aca:4155:: with SMTP id o82mr9750205oia.16.1590351829829;
        Sun, 24 May 2020 13:23:49 -0700 (PDT)
Received: from ?IPv6:2601:284:8202:10b0:dde6:2665:8a05:87c9? ([2601:284:8202:10b0:dde6:2665:8a05:87c9])
        by smtp.googlemail.com with ESMTPSA id u75sm4076705oie.54.2020.05.24.13.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 13:23:49 -0700 (PDT)
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
 <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
 <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
 <f4a901ef-6edf-0b92-5ec1-d931956c0ffd@gmail.com>
 <25405fb0-83f3-066a-629f-f89044e2cce7@gflclan.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <791e4566-0944-399f-fade-550c60ea8643@gmail.com>
Date:   Sun, 24 May 2020 14:23:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <25405fb0-83f3-066a-629f-f89044e2cce7@gflclan.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/24/20 1:27 PM, Christian Deacon wrote:
> As of right now, the packet processing software I'm using forwards
> traffic to another server via XDP_TX. It also drops any traffic via
> XDP_DROP that doesn't match our filters (these filters aren't included
> in the open-source project linked below). Do you know if there would be
> any real performance advantage using XDP-native over XDP-generic in our
> case with the `virtio_net` driver for XDP_TX and XDP_DROP actions? We're
> currently battling (D)DoS attacks. Therefore, I'm trying to do
> everything I can to drop these packets as fast as possible.

native will be much faster than generic.

> 
> 
> If you would like to inspect the source code for this project, here's a
> link to the GitHub repository:
> 
> 
> https://github.com/Dreae/compressor
> 
> 
> I'm also working on a bigger open-source project with a friend that'll
> drop traffic based off of filtering rules with XDP (it'll be version two
> of the project I linked above) and we plan to use it on VMs with the
> `virtio_net` driver. Therefore, it'll be useful to know if XDP-native
> will provide a performance advantage over XDP-generic when dropping
> packets.
> 

Looking at:
https://github.com/Dreae/compressor/blob/master/src/compressor_filter_kern.c

A packet parser would simplify that code a lot - and make it more
readable. For example:

https://github.com/dsahern/bpf-progs/blob/master/ksrc/flow.c
https://github.com/dsahern/bpf-progs/blob/master/ksrc/flow.h

It is modeled to a huge degree after the kernel's flow dissector. It
needs to be extended to handle IPIP, but that is straightforward. The
flow struct can also expanded to save the various header locations. You
don't care about IPv6 so you could make the v6 code based on #ifdef
CONFIG options to compile it out.

I have an acl program that uses it, but I make too many changes to it
right now to make it public. Example use of the flow parser:

        void *data_end = (void *)(long)ctx->data_end;
        void *data = (void *)(long)ctx->data;
        struct ethhdr *eth = data;
        struct flow fl = {};
        void *nh = eth + 1;
        u16 h_proto;
        int rc;

        if (nh > data_end)
                return true;

        h_proto = eth->h_proto;
	/* vlan handling here if relevant */

        rc = parse_pkt(&fl, h_proto, nh, data_end, 0);
        if (rc)
                // you might just want DROP here
                return rc > 0 ? XDP_PASS : XDP_DROP;

        ...
        make decisions based on L3 address family (AF_INET), L4 protocol
, etc
