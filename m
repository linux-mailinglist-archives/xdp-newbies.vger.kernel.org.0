Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE411CD6C0
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 May 2020 12:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgEKKl2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 11 May 2020 06:41:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53526 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728209AbgEKKl2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 11 May 2020 06:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589193686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mbEE/UTd1QZn4Dea09DQLBdz5+FdqqeCEzW0KLRKess=;
        b=hYudT7628K0Sj+WeJrSrMpeFX5jk7EjJSEW9m/V3TcnfkWxp2iwbgsNv6ow25ujGwF4L0Y
        geneXSbkBacMQgQlFCF/Te63RVfSBcUI6WEUlSAMuygU+ei4CfEEilxNKsnRqhvrBE552F
        DwPjBmLbEfIbJIEh+L0ht135ZJqcikc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-aVD9XpBkO0K_ivBQAw0laQ-1; Mon, 11 May 2020 06:41:22 -0400
X-MC-Unique: aVD9XpBkO0K_ivBQAw0laQ-1
Received: by mail-lf1-f71.google.com with SMTP id 74so3392458lfn.4
        for <xdp-newbies@vger.kernel.org>; Mon, 11 May 2020 03:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=mbEE/UTd1QZn4Dea09DQLBdz5+FdqqeCEzW0KLRKess=;
        b=tvCOQ70uWYHg/F6EceQTvdrZxXpvf0BnLHPu1Fz/Y+jn90CC82buj1bDGesVqcbO0U
         vcUiaT3llzELVdNLjLjjbBFTtQ42DhqdGm9WRs5XiI4ibt0Yt01dmKom0DZ4W7vt0JMg
         Nn24BJ693ZIha3JH/ESxe25Atdy/8r6fzYFbU4hj5UXV9+88OmPhmxQEs/lAhimCDvZ0
         gDHZCjhxHNeMO7UcI9mAP+874VVTDVFff8AqMnzwtGb19qCCuxqheNaeG5R+upWxdEFY
         GyEJqeUVZrREo9tTgTBHzt/Eynm7IQ3B7uBG+RNZoIIH5+cfORn6a+A07oNBHPEGXp6n
         wMNg==
X-Gm-Message-State: AOAM531XmctkGa5i9TdmF1/l1IS5+tvx/tCjWkeH+9CcNQRy3l71EDVx
        nj1+ttsgltdSDtZr0J+dS01lj5z7U0i0m1oy5dvzyiqvdeRqYZQV6UvpdX58cNpQrpkNAnZIk9R
        lE1kuU897V6Tlx00Y6tXNeYM=
X-Received: by 2002:a19:4f0a:: with SMTP id d10mr10530325lfb.137.1589193680954;
        Mon, 11 May 2020 03:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6UneJ9PpLy/TIfeNSx1jY9UeKWY5Ex2Oc+AeMgrZJlDTYi1y29ZwowO4IPCu9rZGydUZJiA==
X-Received: by 2002:a19:4f0a:: with SMTP id d10mr10530306lfb.137.1589193680674;
        Mon, 11 May 2020 03:41:20 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id l26sm9475705ljc.49.2020.05.11.03.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 03:41:20 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 1EA121835E5; Mon, 11 May 2020 12:41:18 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP Software Issue - Payload Matching
In-Reply-To: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 11 May 2020 12:41:18 +0200
Message-ID: <878shyg3e9.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey everyone,
>
> I apologize if this isn't the correct place to discuss an issue with XDP 
> software I'm attempting to create. I'm not sure where else I can request 
> help on this since it may be related to BPF/XDP itself.
>
> I've made an XDP Firewall project on GitHub here:
>
> https://github.com/gamemann/XDP-Firewall
>
> I am still fairly new to C and XDP. Therefore, I'm sure many 
> improvements could be made to the software. However, everything besides 
> the payload matching is working correctly from what I've tested.
>
> Basically, this program transfers filtering rules from a config file in 
> the user space to the XDP program via BPF maps. The XDP program then 
> performs checks against each filter specified. I'm trying to implement 
> payload matching into this project and I got the user-space side working 
> properly. However, when I attempt to check the payload within the XDP 
> program, I keep receiving errors either when compiling (stating the BPF 
> stack has been exhausted) or the following error when attaching the XDP 
> program:
>
> ```
> The sequence of 8193 jumps is too complex.
> processed 100132 insns (limit 1000000) max_states_per_insn 4 
> total_states 1279 peak_states 1279 mark_read 97
> ```
>
> There is a very long BPF stack trace that I can attach if need to be. 
> The following is the part of code causing this issue (it's not commented 
> out on my development VM):
>
> https://github.com/gamemann/XDP-Firewall/blob/master/src/xdpfw_kern.c#L306
>
> If I comment out line 332 or set `found` to 1, the XDP program does not 
> crash. I've tried a `goto` approach as well which is available here:
>
> https://gist.github.com/gamemann/9f0d42c25151d0f2e1630840d04fd599
>
> However, this causes the following error when starting the XDP program:
>
> ```
> invalid read from stack off -488+0 size 8
> processed 844 insns (limit 1000000) max_states_per_insn 4 total_states 
> 28 peak_states 28 mark_read
> ```
>
> If I comment out line 27 from that Gist (`continue;`), the program runs 
> properly. I've also tried moving the code into its own for loop by 
> making some modifications. However, I get the same results. I'd assume 
> this is some sort of BPF limitation with for loops and jumps. However, 
> I'm sure there's a strong possibility I'm just not doing something right 
> when attempting to match the payload.

Yeah, you're right, the verifier caps the size of the tree of branches
it'll explore at 8192 entries (which is why your error triggers at
8193). So to get past the verifier you'll simply have to limit the
complexity of your program.

A few techniques come to mind to achieve this:

- Limit the length of the loop (you have MAX_PCKT_LENGTH at 64k, which
  is never going to be the case since XDP doesn't support jumboframes).

- Split up your program into smaller components and use tail calls or
  non-inlined functions to call through to them (though not sure how far
  per-function verification has come, so the latter may not give you
  much benefit yet). Splitting up the code also helps with not running
  the bits that are not needed in a current filter configuration, which
  is an important way to improve performance of XDP programs. See
  xdp-filter[0] for an example of how to conditionally load different
  code subsets as needed.

- Use a matching algorithm that doesn't require looping through the
  packet byte-by-byte as you're doing now. For instance, you could have
  a hash map that uses the payload you're trying to match as the key
  with an appropriate chunk size.

-Toke

[0] https://github.com/xdp-project/xdp-tools/tree/master/xdp-filter

