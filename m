Return-Path: <xdp-newbies+bounces-9-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E299808552
	for <lists+xdp-newbies@lfdr.de>; Thu,  7 Dec 2023 11:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E904928404A
	for <lists+xdp-newbies@lfdr.de>; Thu,  7 Dec 2023 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24812364C7;
	Thu,  7 Dec 2023 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=novoserve.com header.i=@novoserve.com header.b="Insal5LQ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFC61AD
	for <xdp-newbies@vger.kernel.org>; Thu,  7 Dec 2023 02:19:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so658080a12.2
        for <xdp-newbies@vger.kernel.org>; Thu, 07 Dec 2023 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=novoserve.com; s=google; t=1701944384; x=1702549184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzoIxZANQ4VRiT8Y5HhrzW/lhtsy4ZvQ2E8yFhnPFPU=;
        b=Insal5LQ3ZV/P+LdWk0G8+V2UTeayCnpYqguIQYTu4qAuqUoM2ueNQEvKtnVdfA5+1
         S26lFsD17N5aLjNY2ZZvh+u7cy7GB6v0lMpAoXgNwQsctRdMBTHrQCUBp30XlZcVnZQ5
         3CrgjGXVzM60k9O25SBgryyGbuue1ym6MCFmIP1aXd0Xq4fphYkfTW+f4F6Vj81t5ptO
         v2qlo/DIHLEKfME758vppGDDl3qkNFmolQHu6my3OuGj7X/j/WL/QNXE9w6gjU7+U4OW
         xYWcOeZFprvRPfm3dEqjuIKYY2WR5vXg8ocCISHoM80TO361tONT2f5sdSsrB2XfZctv
         dnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701944384; x=1702549184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzoIxZANQ4VRiT8Y5HhrzW/lhtsy4ZvQ2E8yFhnPFPU=;
        b=hHeQUTNnTdycKPZ1aYYSBsxnyS13WMXpHMYuoL/y3l6Y3WxRXNPgvw/Y8hzmCn4WYt
         S/lWI1mSTyFRwA289F4ZhZcvyTPI9KMX1HqfuqbKlvt2z/+A2UoRLkJHfsDQaMkfreow
         sicAkCIz5bMEmNaSYqWfMZizAYSn2E4WMW2DeAZUs9reeEKLqg1kqHjiHOz1k/DYKMyU
         MCOdD2flfQstxiWs++1I/nzcKMgWK7kbg/Hg2N/uRJvxQoJaoTxLegdZYtNQQxg7UDkn
         Q7NAK0VuiuN/08LKPQDOnifVXVrEu5PmpxRNXr4FWo5VAnXdQc1pTOAAIxmwZxoMRts7
         6UOw==
X-Gm-Message-State: AOJu0YzAVdySqnai0kxr/rafCDELh8XcD1CF/3xCGhRX3b59U3Otb6BS
	I/lCB80cqWyq6/s6WoWSVCos7g==
X-Google-Smtp-Source: AGHT+IGMSv+BEGLlc+Qwx5b5hwqISCxB7XRfgboYMQEvMU2kyBXiP/lmgEjITOgZvMMCD87Igc4D6g==
X-Received: by 2002:a50:bb44:0:b0:54c:f441:d294 with SMTP id y62-20020a50bb44000000b0054cf441d294mr1543968ede.74.1701944383664;
        Thu, 07 Dec 2023 02:19:43 -0800 (PST)
Received: from ?IPV6:2001:968:1337:0:1122:61c:b4ce:c98c? ([2001:968:1337:0:1122:61c:b4ce:c98c])
        by smtp.gmail.com with ESMTPSA id z3-20020a50cd03000000b0054cac2a0715sm614682edi.93.2023.12.07.02.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 02:19:43 -0800 (PST)
Message-ID: <c5a2af04-5028-4f71-b6d1-4a428e8a7bc4@novoserve.com>
Date: Thu, 7 Dec 2023 11:19:42 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in xdp synproxy kernel code
Content-Language: nl
To: Vincent Li <vincent.mc.li@gmail.com>,
 Minh Le Hoang <minh.lehoang@novoserve.com>
Cc: xdp-newbies@vger.kernel.org
References: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
 <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com>
From: Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
In-Reply-To: <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vincent, list,

>> iptables -t filter -A FORWARD \
>>     -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTRACKED \
>>     -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
>> iptables -t filter -A FORWARD \
>>     -i eth1 -m state --state INVALID -j DROP
> 
> I have been unable to get it working by attaching  xdp synproxy to
> firewall/router without having target/protected destination IP on
> firewall/router by adding rules in filter table INPUT chain, your idea
> of adding  rules in filter FORWARD  chain solves my puzzle :)

Glad that that helped! It was something that Minh struggled with too, 
for a while.

Indeed you need to use the INPUT chain for traffic destined to the host 
itself (eg when you run this code on a webserver, reverse proxy or 
something like HAproxy in TCP mode). The FORWARD chain should be used 
when the host is just a hop in the path, so when it's bridging or 
routing the traffic, as is the case with a firewall placed in front of 
one or more servers.

Our use case is a transparent firewall that can be placed in line with 
traffic to clean it, so probably similar to what you were trying.

On a side note: the presentation [0] that you reference in your repo [1] 
also gives an example with the FORWARD chain, see pages/slides 12 & 13.


>> I use the curl command in the client to get the web page from the
>> server for testing. It is strange for me that after the synproxy code
>> completes the 3 way handshake tcp with the client, it sends the syn
>> packet to the server but it drops the SYNACK packet from the server.
>>
> I guess maybe originally the synproxy code is not expected to handle
> SYNACK from the backend server?

Looking through the code, we thought that it was actually designed to 
handle this (but not sure how it was tested then, and why this issue 
hadn't been identified yet).


>> Now the xdp synproxy kernel code does not drop the SYNACK tcp packet
>> from the server.
> 
> Thanks for the analysis, if this is right and confirmed by other
> expert, I guess I should also fix it up in the xdp synproxy  code I
> ported to bpf-samples repo
> https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy.

Well, it would be nice if you can also test and validate our patch - 
having read through the code numerous times and after several tests in 
our VM setup (as Minh describes), this change makes the code do what we 
expect.

It has been accepted into bpf-next [2], so hopefully it will propagate 
to the relevant upstream repos - and maybe make it into Linux kernel 6.8.


Kind regards,

Jeroen van Ingen Schenau

[0]: 
https://netdevconf.info/0x15/slides/30/Netdev%200x15%20Accelerating%20synproxy%20with%20XDP.pdf
[1]: https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=b6a3451e0847

