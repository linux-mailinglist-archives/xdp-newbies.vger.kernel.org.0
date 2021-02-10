Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE145317353
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Feb 2021 23:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhBJW15 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Feb 2021 17:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhBJW1z (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Feb 2021 17:27:55 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300F2C061574;
        Wed, 10 Feb 2021 14:27:15 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id l3so3946376oii.2;
        Wed, 10 Feb 2021 14:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=psZb/keKxp0LF/e0bfYcT8NiO1F9XDj4IbbYMLamT/k=;
        b=MLo+OaVVbHE26OCPfAf1aC5ktLiTzxquY0groSAUEvbU3LzYAk49cFjveFxVxyAQ2r
         SJXTJ6AWszbqLqGO0Mq34I19f5wAvGt0OCKqg5UINrTMKxymPgMNY3AWq23t1OejQhie
         hURG8c4dakV9SbzXow62mM8+ercVgSDNdu5WTABiN1DzMwS+TboXvE7Y57dBH8NES6Tf
         HMGf2Vamxy+NKJgw0quiIpLYuqDYf8yStaq0kC7quAtvOmS+C/rgkovA24d8fMLiE30d
         prPahzAoqfRxbJvXSJV4eQJH9aB4Mlh41JjMhL59Csv+/JQs7ivp10JUKlvkgYrpkXW/
         3zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=psZb/keKxp0LF/e0bfYcT8NiO1F9XDj4IbbYMLamT/k=;
        b=ZbOp7s6pd8Vk3MbF3JssD+fpbBb3dSimxWlcRxpST5ucAL/0A47O2jKfDlwCP8TdjM
         sK/D5ztYcTuQ9t0RpNMvWUU2rib0MW3ZPMNfZ1F9+6BweCAZF8xuel1Pm6YbmXUaetRj
         bgl8ytxP3Ci7Cfgxr5/E08P7lnmAM4wPbGVvM4bM5hgFso3MB5UrUOIJasAup7AGx+7U
         svVBdESklluVquZQzbCL7978XGJs1XuTM8kNiUo88WqdKZCTw1ZzKWcS1/JrukMPaEv6
         YKgVzB1qdnN17W8GC73iLNib1egqcOSEXTyZHjdk0RuVhB4w42HeEeXVkYuK3cuAdcCl
         KuIQ==
X-Gm-Message-State: AOAM533KcE+Usf52mCjp2fcwns/E7ORTyDeNWSLhYXvSqkbYcnDbIwbD
        afAXQX167ci/kzoNBD/C7yQ=
X-Google-Smtp-Source: ABdhPJw4d+yDFXrfwca3dB5Q76ZsIKn5jHlFM5fBvdovixX1oDkRwzBycejqvnf5r9uwMXQzq9Q33g==
X-Received: by 2002:aca:1003:: with SMTP id 3mr866868oiq.22.1612996034178;
        Wed, 10 Feb 2021 14:27:14 -0800 (PST)
Received: from localhost ([216.207.42.130])
        by smtp.gmail.com with ESMTPSA id q6sm646687ota.44.2021.02.10.14.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:27:13 -0800 (PST)
Date:   Wed, 10 Feb 2021 15:27:10 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210210222710.7xl56xffdohvsko4@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tur0x874.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/01/29 01:02PM, Toke Høiland-Jørgensen wrote:
> Hi Brian
> 
> I've posted a first draft of this protocol description here:
> https://github.com/xdp-project/xdp-tools/blob/master/lib/libxdp/protocol.org
> 
> Please take a look and let me know what you think. And do feel free to
> point out any places that are unclear, as I said this is a first draft,
> and I'm expecting it to evolve as I get feedback from you and others :)
> 
> -Toke
> 

Thanks so much for doing this Toke. There's a lot of great information.
I did one read-through, and didn't notice any surprises compared to the
code that I've read so far.

One thing I have been a little concerned about is the XDP_RUN_CONFIG in
the xdp program function. For our case--with multiple teams writing
independent, composable xdp programs--we don't want the XDP_RUN_CONFIG
policy to be in the xdp program. Instead, we want the Go orchestration
tool to have that policy as part of its configuration data (e.g., what
order to run the xdp program functions in). From what I can tell, it's
possible to omit the XDP_RUN_CONFIG from the xdp program function, and
instead set the values when loading the xdp dispatcher. That's great, and
thanks for the foresight there. I just want to confirm that I'm
understanding that correctly, because it's very important for us.

Also, I do hope that the existing Go BTF libraries are good enough to do
what's needed here, because if I'm understand correctly, that's how I'll
need to approach setting the XDP_RUN_CONFIG values for our use case.

I've been tasked to work on a Go libxdp implementation this quarter, so
I'll be starting on that soon and let you know if I have questions as I
go. I'm also happy to coordinate with anyone else that's interested.

Thanks again,
Brian
