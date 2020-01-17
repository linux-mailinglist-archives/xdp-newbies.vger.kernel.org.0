Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 331DD141091
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 19:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgAQSOc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 13:14:32 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44099 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgAQSOb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 13:14:31 -0500
Received: by mail-pf1-f193.google.com with SMTP id 62so5663433pfu.11
        for <xdp-newbies@vger.kernel.org>; Fri, 17 Jan 2020 10:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=u8Bj+03OLq9M+1RmDK/C9hu6mFy2XJgJ2ZtwAZ1CRWg=;
        b=HZEMkyfd4Z6Z0xJeYpmRIaHuFf5g5pLTGm5HRIYCRWV+W71zuryNpSdd79AG+j6BbU
         wUFggflI7LRJNWHyv2yLQQbgbtslPTraLVfL9+o/OKTqTTrSh2CYB/9uqArncYbiFktQ
         jIoQwTirqAZ4c8e/sKtHmsYa97ilYMR/AIbjBsu3UcS4kNoSbOSFwiz+IzcmDjGZvAMY
         1JFAk16LEnYvCjafwuW6hf+j3Dn1yHeoF2mXA/BPWkPT5GeIroCi7qmzp206Mw/M9ljc
         c7WdXXpDsYOM1AtUPhaq7TPv5Ovqcsqw2rHYm9W56wjIr1aIhqtL2QM9M1+Bm5gAYw2V
         l/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=u8Bj+03OLq9M+1RmDK/C9hu6mFy2XJgJ2ZtwAZ1CRWg=;
        b=QdBSNCkviYcunnyghBcd/RhzkR0nRSxMLkL0gYZPkWq/846tM5ATlzGRuanyNaUHyu
         b2qAoYNUg4zMvGypVPExQvGYIduAKkBhxWJEstq/S9B3VqxF91c0t+vv5xYymkk8ERDW
         IevD4rzFRSJzr06ky/ozuwOjLNxcUdFoezVEnZcNGQ7pM1bosuSU/qrIp0/2DCl3r7iz
         VRh3h68KQ/Z25donMKDzMFmYatnP5FjD4mRsFUZ7vistfOuh52jdUcq/sewZY41bQlx9
         Au+1DM+fUE1Mfs5DUlOzcqWFpNOd8MpZpMxmI6CQzPf6yFU8CF5ADq02wW8/TwetGdCD
         r4Jg==
X-Gm-Message-State: APjAAAXlPe4J4/bU02YYlTiDlcGuIDqdnIJ196rwIK+dlYfq2SlvNs/E
        nu/u7lnPw79Y9DnmopnBO3crDmKmxvI=
X-Google-Smtp-Source: APXvYqxKd5dpMzkMCeCiuER+Z0NXXTClp3By1mkN2BRPG1dRNzgxaSDp1CBNVNiKkRyrbcwLBaGgtQ==
X-Received: by 2002:a05:6a00:2ae:: with SMTP id q14mr4146178pfs.155.1579284871139;
        Fri, 17 Jan 2020 10:14:31 -0800 (PST)
Received: from [192.168.1.25] (c-71-231-121-172.hsd1.wa.comcast.net. [71.231.121.172])
        by smtp.gmail.com with ESMTPSA id a6sm28127114pgg.25.2020.01.17.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 10:14:30 -0800 (PST)
From:   Vincent Li <mchun.li@gmail.com>
X-Google-Original-From: Vincent Li <guzheng@gmail.com>
Date:   Fri, 17 Jan 2020 10:14:29 -0800 (PST)
X-X-Sender: guzheng@jiadeimac.local
To:     =?ISO-8859-15?Q?Toke_H=F8iland-J=F8rgensen?= <toke@redhat.com>
cc:     Vincent Li <mchun.li@gmail.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org, daniel@iogearbox.net, andriin@fb.com,
        dsahern@gmail.com
Subject: Re: XDP invalid memory access
In-Reply-To: <87blr2qr3d.fsf@toke.dk>
Message-ID: <alpine.OSX.2.21.2001171006160.796@jiadeimac.local>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com> <20200116022459.GA2853@ranger.igk.intel.com> <87y2u7spj3.fsf@toke.dk> <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local> <87blr2qr3d.fsf@toke.dk>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-644975410-1579284870=:796"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-644975410-1579284870=:796
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 17 Jan 2020, Toke Høiland-Jørgensen wrote:

> Vincent Li <mchun.li@gmail.com> writes:
> 
> > On Thu, 16 Jan 2020, Toke Høiland-Jørgensen wrote:
> >
> > Hi Toke,
> >
> >> 
> >> You could also try the xdp-loader in xdp-tools:
> >> https://github.com/xdp-project/xdp-tools
> >> 
> >> It's somewhat basic still, but should be able to at least load a basic
> >> program - please file a bug report if it fails.
> >
> > I tried the xdp-tools xdp-loader, when the optlen is global variable, I 
> > got:
> > # xdp-loader load enp3s0 tcp_option.o
> > Couldn't load BPF program: Relocation failed
> >
> > if I move the optlen, i variable to local variable, I got:
> >
> > # xdp-loader load enp3s0 tcp_option.o
> > Couldn't load eBPF object: Invalid argument(-22)
> 
> OK, I tried this, and there were a couple of issues:
> 
> - The xdp-loader didn't set the BPF program type to XDP, and since your
>   section name doesn't have an xdp_ prefix libbpf couldn't auto-detect
>   it. I've pushed a fix for this to the xdp-tools repo so the loader
>   will always set the program type to XDP now.
> 
> - There are a couple of bugs in your program:
> 
> First, when compiling with warnings turned on, I get this:
> 
> tcp_options.c:64:29: error: variable 'op' is uninitialized when used here [-Werror,-Wuninitialized]
>                         if (op[i] == TCPOPT_EOL ) {
>                             ^~
> tcp_options.c:43:23: note: initialize the variable 'op' to silence this warning
>         const __u8 *op;
>                       ^
>                        = 0
> 
> after fixing that (adding this line after the optlen = assignment):
> 
>                 op = (const __u8 *)(tcphdr + 1);

Thank you for mentioning the warning flags to clang, I used clang -Wall 
and see the same warning

> 
> the verifier then complains about out-of-bounds reading of the packet
> data (pass -vv to xdp-loader to get the full debug output from libbpf).
> You are not checking that the op pointer doesn't read out-of-bounds.

-vv is also good tip, missed it

> 
> I fixed that by adding a couple of bounds checks inside the for loop.
> The whole thing now looks like this:
> 
>                 optlen = tcphdr->doff*4 - sizeof(*tcphdr);
>                 op = (const __u8 *)(tcphdr + 1);
>                 for (i = 0; i < optlen; ) {
>                         if ((void *)op + i + 1 > data_end)
>                                 return 0;
>                         if (op[i] == TCPOPT_EOL ) {
>                                 char fmt[] = "XDP: tcp source : %d tcp option eol\n";
>                                 bpf_trace_printk(fmt, sizeof(fmt), (int)tcphdr->source);
>                                 return 1;
>                         }
>                         if (op[i] < 2)
>                                 i++;
>                         else
>                                 i += ((void *)op + 2 < data_end && op[i+1]) ? : 1;
>                 }
> 
Good to know now everytime to check the memory bound before accessing the 
next memory

> 
> With this, I can successfully load the program using xdp-loader. Turning
> the variables back into globals still doesn't work, but I think that
> error message should be fairly obvious:
> 
> libbpf: invalid relo for 'op' in special section 0xfff2; forgot to initialize global var?..
> 
> -Toke

I cloned your updated xdp-loader and I can load the object file fine now, 
thank you for taking your time, lesson learned :)

Vincent
 
--0-644975410-1579284870=:796--
