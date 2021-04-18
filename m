Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF33B3636F2
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 Apr 2021 19:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhDRRLw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 18 Apr 2021 13:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDRRLw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 18 Apr 2021 13:11:52 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D5FC06174A
        for <xdp-newbies@vger.kernel.org>; Sun, 18 Apr 2021 10:11:20 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so30415571otn.1
        for <xdp-newbies@vger.kernel.org>; Sun, 18 Apr 2021 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HsLypbmJ8YPsXVMghy76oHPm04ovXAPi/ZO52NtPVWw=;
        b=aYA+3nQNYIvC0gQrSgrdSL0/ORhPqp5Jq0cZ77MxVyoIrtjTzfbkNDn54ZiW57+dMt
         rdCVbEQvD4Ocd6+ZjEbGdhJcdZG6KfiIO0gFoLOpN09NIpVXpZ2xxccncartf2KL9O8Y
         DoKPYBBklXKoQuySFkABhTSnhFE+JYoqJra9NO2K6Z2lzIQuw0UNqgoVn9ElmSAjC7Bh
         5gJuSoE4KJV2YVZxQyRWCdk2QeEP1YDVjTwm45F7dEX+ZnZms3Pbp7g7pz5txKpDSCkb
         +mpwZBth7g8inRAyYUwkk3ECBVcg7xzmOc1meifjZgltlAHn6+GXGZ90Op2Wt3uFeyF9
         7GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HsLypbmJ8YPsXVMghy76oHPm04ovXAPi/ZO52NtPVWw=;
        b=s4aRJZ3qmoHSVFSbAKsfuWf37g5NdHO08TRuOILWz1KHqoPxZAif8pm93luWBL7xAW
         L9QUa/92tXpvtmePQBC3A6R9wPvlNkK8xhR4QpW81d+JT0vwPhTmGUt4mjbr2JEgFYf4
         L8DV6SbcvFywxNLGkLsVMMkl7jMO4VQHbscOKYCij6qsJyrTuWMM79GEED6bnEofS6Y+
         L33hItifK0bUt57ZbRvBHmFSioA5Z3OQSLKzcZRA7TJfM1SD1uJyCcjiGWCm5kl5vzdi
         OcTmw6SDIjy+nXobKEp054iz2l+uj7k5Ujd15U/Rvw5VKreq/jeFC4iyphEh00+ZtMq6
         nCJQ==
X-Gm-Message-State: AOAM531SVl1+ejwPppXCbX3ZFlXqDe0w8TKKNDFoBsbXNw8/70AicJX0
        Ht+DdhtCIdB4epkIVBhPSm1NwwCIJeI=
X-Google-Smtp-Source: ABdhPJziilEWxWYOzJRcZO2CKR7RWVozlfY+qTstUg75Cf22qUvSiHwBmXjyWnbcXyReI9Cl0RjuNQ==
X-Received: by 2002:a9d:648c:: with SMTP id g12mr11826967otl.299.1618765880072;
        Sun, 18 Apr 2021 10:11:20 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.45.41.12])
        by smtp.googlemail.com with ESMTPSA id r18sm884481otp.74.2021.04.18.10.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 10:11:19 -0700 (PDT)
Subject: Re: bpf_fib_lookup VLAN
To:     Konrad Zemek <konrad@zemek.io>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <007301d732b8$8b0f5c90$a12e15b0$@zemek.io>
 <9e19881a-1f62-410f-8dec-0eff0c7ea03b@gmail.com>
 <wp7cnO1IP6giAEl4UWGVelu8OW0KZBpz0HlppNPYs4GhRWtivZWXv4OyyzN1-wPmAlwk5UXVLCDdLmABA8HdEAp5sCE-yj2fyu4Qlzwtmpo=@zemek.io>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <eeb4f9da-d896-0806-80a6-c8ca3f7a285b@gmail.com>
Date:   Sun, 18 Apr 2021 10:11:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <wp7cnO1IP6giAEl4UWGVelu8OW0KZBpz0HlppNPYs4GhRWtivZWXv4OyyzN1-wPmAlwk5UXVLCDdLmABA8HdEAp5sCE-yj2fyu4Qlzwtmpo=@zemek.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 4/16/21 9:12 AM, Konrad Zemek wrote:
> (Sorry for the double mail David, I missed the "reply all" button).
> 
> On Friday, April 16, 2021 5:35 PM, David Ahern <dsahern@gmail.com> wrote:
>> On 4/16/21 5:03 AM, Konrad Zemek wrote:
>>
>>> So both vlan fields in the output struct bpf_fib_lookup are always zero. I
>>> haven't seen this commented on anywhere, including the discussion around
>>> introducing bpf_fib_lookup, so I assume it's an accidental oversight.
>>
>> The uapi was setup to cover the use case, but VLANs are not supported at
>> the moment.
> 
> I'm surprised it's not marked as such in the bpf.h, the comments (or rather
> lack of) made me convinced that it works just as well as the MAC address
> fields.
> 
>> On 4/16/21 5:03 AM, Konrad Zemek wrote:
>>> Do you have any proposals for a workaround? Right now I'm thinking of
>>> creating a BPF map that would map ifindex->vlan, populated in the userspace
>>>
>>> -   but that assumes the output (struct bpf_fib_lookup*)->ifindex will be an
>>>     index of the vlan device and not the physical device the vlan is attached
>>>     on, which I'm not sure is the case yet.
>>>
>>
>> vlan netdevices do not support XDP redirect.
>>
>> It's not a trivial problem to handle VLANs or stacked devices in
>> general. I have working code here:
>>
>> https://github.com/dsahern/linux/commits/bpf/mpls-vlan-fwd
>>
>> but it is not ready for submitting upstream yet. The use case and
>> related ones need more work.
> 
> They don't, but it's not that important for my use case. I have just
> one interface and all the VLANs are on that, so if I learn that a
> VLAN is needed it's just another thing I push in front of the tunnel
> frames that I already push. If I had multiple interfaces, I'd just
> need one more piece of info which is "what's the physical interface
> number this VLAN is attached on".

Your use case is fairly trivial to support, but generically the vlan can
be on a bridge, bond, or port. To properly support VLAN redirects, the
fib lookup needs to resolve the stack to the egress port.

> 
> XDP programs are already pretty specific to the infrastructure one's
> running, and already very manual with packet manipulation (which is
> actually a boon to a lot of things I'm doing), so I don't mind this
> not being a generic solution.
> 

As I recall (it has been a few years), the fib lookup device index is
the vlan device. You could have a map that converts that return to the
real port and vlan. It should work, just more maintenance.
