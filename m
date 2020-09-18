Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C174270707
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Sep 2020 22:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIRU1t (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Sep 2020 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRU1t (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Sep 2020 16:27:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514DBC0613CE
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 13:27:49 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id m13so2074536otl.9
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qpqu00784+MeJjekBIuXkcLq2dSL2pL5xtb56NjeHHs=;
        b=li0yabItVBmwdQavMspQb8P6CaI+03KRawcv0dAcUhDwRqe2J0CG/fokr44AGNMSmK
         wkL8rwNXAWuIyLqh2dnvHgpICOgMjjtQvRvYuCPzcIyvyT0SUwlgun26zgZWZEr6urTg
         fi9czFg+Fl3CLhUlmJlN1NGjz8U81K+ZBzxltbOelRUQXuDQp/5lW8ZbUeuGzTZGIPto
         t6bMb3zQ3DqN6nyYXMzi89DqArlZI1hdnt8IcWHkkkVKJ9IWn5+NE/mhY5iOBff6H2qZ
         WXnMAEPxvfQmpPQouUXKzsYATLhvjzKIswJGmX3XogpVL+NpSzRh5u+dpxvoJz3Vi1sQ
         scFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qpqu00784+MeJjekBIuXkcLq2dSL2pL5xtb56NjeHHs=;
        b=LDwRNNYNyR/8e6V9yWXtXByEiyDCqzGlx32f9PhPo1ijbaD7aOkQhfGHLlQXUlM+p7
         fTjxsphJiQhoP8x8O0iU6Ll65rbLCrLw5xWgVOjxpcNYYnfpdIG0otY/mLZBdeRCCyhE
         VB3/Zh7bpfIbtGpkk7wHGBOPS6JU9vSW+NPzRp9SoxpCoOD0leS3vqle8OeOeb/Egcc+
         HGc50oobPNJF9bL/S+Naz1On7JBGd9AXHYnphBT+GCqCnQ21zf2wbh+yQBohmpf02ttq
         N8ddyHAb40xT1BNwStVZ7SkoZ6Ue19qSfEQ6dB8mM3FQJTgg5491I4RfIUrtRrpaB42I
         ayBg==
X-Gm-Message-State: AOAM530rx3QI1ujCH/jslfBjRWPTO7p4WdbnaQ3W1+ZpvIfg84ksqXWY
        7Ne5AJqsVc8PcjYuRzp9pZClJ9s0M7VKCw==
X-Google-Smtp-Source: ABdhPJxId4cJJp69P0INoito6baGQvJsgRbMA1Mqt80jQE/Ii22Dwy/g9QoBfTiBpyT3/lmH2wkS1Q==
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr15834696oto.11.1600460868433;
        Fri, 18 Sep 2020 13:27:48 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([2601:282:803:7700:cd0d:513b:2d0c:7965])
        by smtp.googlemail.com with ESMTPSA id 11sm3510684oiz.30.2020.09.18.13.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 13:27:47 -0700 (PDT)
Subject: Re: bpf_redirect and xdpgeneric
To:     ThomasPtacek@gmail.com,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
 <87lfh7fkqs.fsf@toke.dk>
 <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
Date:   Fri, 18 Sep 2020 14:27:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 9/18/20 12:42 PM, Thomas Ptacek wrote:
> The setup is pretty simple. There's an eno1 (igb driver), to which our
> default route points. On the same box are several VMs. There's a tap
> interface (for each VM, call it tapX). Traffic for a VM flows in from
> the Internet on eno1 and is directed to tapX; the response traffic
> flows in the other direction.
> 
> I'm deliberately simplifying here:
> 
> eno1 runs an XDP program that does some lightweight IP rewriting from
> anycast addresses to internal VM addresses on ingress. eno1's XDP
> program currently XDP_PASS's rewritten packets to the IP stack, where
> they're routed to the VM's tap. This works fine.
> 
> tapX runs an XDP program that does the same rewriting in reverse.
> Right now, it also XDP_PASS's packets to the stack, which also works
> --- the stack routes response traffic out eno1.
> 
> I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.
> 
> I have the ifindexes and MAC addresses (and those of IP neighbors) in
> a map --- a normal HASH map, not a DEVMAP. Using that map, I can
> successfully redirect traffic from tapX to arbitrary other tap
> interfaces. What I can't do is redirect packets from tapX to eno1,
> which is what the system actually needs to do.
> 

XDP_REDIRECT sends the packet to a devices ndo_xdp_xmit function. tap
implements it hence eno1 -> tap works; igb does not meaning tap -> eno1
fails.

xdpgeneric does not work in the Tx path.
