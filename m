Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B238A1BA1A9
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Apr 2020 12:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0Ktt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Apr 2020 06:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726507AbgD0Ktr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Apr 2020 06:49:47 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5759FC0610D5
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Apr 2020 03:49:46 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id q7so5344329qkf.3
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Apr 2020 03:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oaWHEl2PiQRXi+Jr7EFiSYTRAiyT4oBZrjvAzt2kjFs=;
        b=duI75W5YJclAiEdse6/uQ2r1KXDXSDBWzsHLOKDst61pFWxxZev8lhhqEmvfXY7iGu
         ZK09GPPSZzae9QtUKd5WnLSxjdDX6OH02Cd4nlvpLkbudO/23AHZvZMpmwGy4dvJo4TX
         m4XuBzmgrwWOkiERe/cmId86UyOX5NuiRXzHC5XtCV75w8mpi+xVwMgSkqqrqc939jQC
         PJ811h/goOFUBbCa609TiJGSsNj/LYC8CbSb1A2Kf3Z1VXxVOSjMlVymF+xKptb8hpqt
         Y54FtGlMNsIoPWliqQf/4PQ1FCv3RZClncCutaX9DBVGX6SnFaHRTYeb8v7l+yyjdypL
         Px8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oaWHEl2PiQRXi+Jr7EFiSYTRAiyT4oBZrjvAzt2kjFs=;
        b=KyF4zLcj9G6BFjQTFBfe7w0g8EOtGvUuII/TQsRcRS/zaDRtN7Fxl0wlnKjRv6AaaC
         LqsWMQouwsSdnh+ECLY+obUYEpGlipvkbIrzzJEFPUpMVN+vr98Kd4R/K/VRiru168KB
         r5PaDzK3JpUCnykC5NVJsZIaEOxYDAvmkw+Z5uVt+qCQWFA/lNzXvYR2Y0l9FUQZ60Bs
         RwbszipOcvj0IndZQRhXHropgrrMXvQjYsitR4vqaQvKmAQ9nqAbUiqnuR53AOP2Bo5P
         lWA5IXcRrkZXHr92LUaJo6tNwLEMYMzV59wFSPgRpNNkim+NFR9IxvVu9ge/jSqgwp87
         mXgQ==
X-Gm-Message-State: AGi0Pua6pSXar+/7KlpJQT34OQdv0FVSy2WaZGxm6Lq7T5X3KHDleWZ5
        y4woFKmCXGHawUMqKxyovDWxxmWF
X-Google-Smtp-Source: APiQypJpXBC6E89MjFe0icMHkDT79MLcAJWg1mieWzMMs4HVQNltw9mq6vYCPzeBFTxqVla3ogld8A==
X-Received: by 2002:a37:a8c7:: with SMTP id r190mr21888595qke.65.1587984585563;
        Mon, 27 Apr 2020 03:49:45 -0700 (PDT)
Received: from gmail.com (pool-74-104-133-20.bstnma.fios.verizon.net. [74.104.133.20])
        by smtp.gmail.com with ESMTPSA id i5sm9990181qtw.97.2020.04.27.03.49.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 03:49:45 -0700 (PDT)
Date:   Mon, 27 Apr 2020 06:49:38 -0400
From:   Sowmini Varadhan <sowmini05@gmail.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Subject: Re: building eBPF
Message-ID: <20200427104938.GF488@gmail.com>
References: <20200425122225.GA455@gmail.com>
 <20200425145619.4405a50d@carbon>
 <20200427002027.GE488@gmail.com>
 <20200427120333.7e6cedfc@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427120333.7e6cedfc@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



> The iproute2 BPF-loader does not support BTF.  I think upstream agrees
> that it would be too much work to add (and maintain) it, so the current
> plan[1] is to convert iproute2 to use libbpf instead.

So I updated my iproute2 because I was initially getting an error like

" Error fixing up map structure, incompatible struct bpf_elf_map used?
  Error fetching ELF ancillary data!
  Unable to load program
"
with the native iproute2 binaries, and thought it may be due to
a header mismatch.

> Why do you want to use 'tc' to load XDP?

I was merely using the exsiting example in samples to try to understand
this. If the existing example is misleading, it should be removed.

> I actually think this is only a warning, and the program is actually
> loaded...

no I dont believe it is. if you insert a break in the script before
it gets to cleanup, and try

   # ip netns exec ns2 bash
   # tc filter show dev vens2

it will not show any loaded filters.

--Sowmini

