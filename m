Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1009521FEDC
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jul 2020 22:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgGNUsL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jul 2020 16:48:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50442 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726768AbgGNUsK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jul 2020 16:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594759689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SGFmbDGBSyAquDQ+SavEUjezJUM1+f4weDNxW48dgSo=;
        b=YpyRz+gY2UI6AXxpaTF5sh7mULztfkMKTlF0EC7HrrRaXSdJ4Wf77y1RN13kwjhdsZ+AWK
        NwB2wh64cCUO9/yw5IeihEFXaqWx6+IEFvVN6Ya+wJxb5dhoGnGYUZ8/wk9j+WCUyZ+s5B
        IU7Gtgn1iNkUB2ZfTNkwibADmqHIkVQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-RDb15FIhOi-WdVa4rpfEwA-1; Tue, 14 Jul 2020 16:48:05 -0400
X-MC-Unique: RDb15FIhOi-WdVa4rpfEwA-1
Received: by mail-qk1-f197.google.com with SMTP id q6so13876443qke.21
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Jul 2020 13:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=SGFmbDGBSyAquDQ+SavEUjezJUM1+f4weDNxW48dgSo=;
        b=fTND2L5MHFJO79NTpJ26aKwOIk9i85b+cBopQjxkDnEH/pujx7FCMfVXZGP/vRjCLP
         b1VWMJVcgjKRhZoTNnA1d0OPqGe52zcBaSVHZCfAGfdA/2pWzqnXtZJVkd+Zflwe8YOU
         ESZPbeHaGKAgxGctMSTWiTNp9+bQMnTZiRqMGj7chR7WZWtdz/jgvvb4skxHbbJ+Pbca
         wSnCWciQFlLwq3A5U1fKHukd2xwGwcqM2CPC9i34yJkr18xrxzYEDsMRuQwX8eqqzNIT
         xWZsKI1w2/BsBi64AB8ei2VcyEboqDHTXsNvUtnP3bDDmHGmMt2E2MbEC9yV98MHHYHn
         r08A==
X-Gm-Message-State: AOAM531zEERajLHM3UJFIUjmp96ENMJYkTJYEOayaGSLXi/pZmC/eTx9
        4kSVfdR1z7aVnd7GZpsOEimbCBOtoUVxncxSbbfJscLwZlkDBUmuUXE7bJX8w7vcQwXvmCaKjQ+
        b7NvmGIvd5KR5EYfsmh4RExo=
X-Received: by 2002:aed:25d1:: with SMTP id y17mr6509124qtc.126.1594759684779;
        Tue, 14 Jul 2020 13:48:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfh7eLYXoGkLuuhEHaC7xxaTjo5QL0C+kwiZYfyMbncnqCq8fSXR+vBlv4pSkg+AHp/UaU7Q==
X-Received: by 2002:aed:25d1:: with SMTP id y17mr6509108qtc.126.1594759684560;
        Tue, 14 Jul 2020 13:48:04 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id o184sm25277973qkd.41.2020.07.14.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:48:03 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7D3651804F0; Tue, 14 Jul 2020 22:48:00 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP Software Issue - Payload Matching
In-Reply-To: <4581875c-d5af-3da5-bf01-ce3e404c94dc@gflclan.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com> <878shyg3e9.fsf@toke.dk> <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com> <87ftc5ut0q.fsf@toke.dk> <edbf300d-a687-7652-d702-d58be09fd541@gflclan.com> <874ksjuca6.fsf@toke.dk> <a8acdb19-2d7d-43d6-67a7-3ad926ae27c4@gflclan.com> <87tv08j96h.fsf@toke.dk> <4581875c-d5af-3da5-bf01-ce3e404c94dc@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 14 Jul 2020 22:48:00 +0200
Message-ID: <87o8ohg6wv.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey Toke,
>
>
> I apologize for the long delay on this. A lot has been going on recently!
>
>
> I attempted to match payload data using the packet's payload as the BPF 
> map key. Unfortunately, I didn't have any success with this. I stored my 
> findings here from last month:
>
>
> https://github.com/gamemann/XDP-Dynamic-Payload-Matching#section-methodfour-fail
>
>
> I'd assume I may be missing something here, though.
>
>
> I saw another XDP mailing list thread pop up recently regarding matching 
> TCP payload data. I believe this may be what they're trying to achieve 
> (being able to match dynamic payload data with XDP).
>
>
> I was wondering if you had any other ideas on how we can match packet 
> payload data against a BPF map.

That error ("invalid stack type R2 off=-16 access_size=150") comes from
this check in the verifier:

	if (off >= 0 || off < -MAX_BPF_STACK || off + access_size > 0 ||
	    access_size < 0 || (access_size == 0 && !zero_size_allowed)) {
		if (tnum_is_const(reg->var_off)) {
			verbose(env, "invalid stack type R%d off=%d access_size=%d\n",
				regno, off, access_size);
		} else {
                ..
                }
                return -EACCESS;
        }

which I think means that you're trying to use a 10-byte value as a
lookup key for a map that has a 150-byte key, which would make the
map key read through the end of the stack.

So basically, if you change

uint8_t hashkey[10];

to

uint8_t hashkey[150];

I think it ought to work?

-Toke

