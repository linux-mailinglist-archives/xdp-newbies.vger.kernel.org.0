Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B029443876
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 23:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhKBWal (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 18:30:41 -0400
Received: from www62.your-server.de ([213.133.104.62]:59012 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhKBWak (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Nov 2021 18:30:40 -0400
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <daniel@iogearbox.net>)
        id 1mi2GC-000887-De; Tue, 02 Nov 2021 23:28:04 +0100
Received: from [85.1.206.226] (helo=linux.home)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1mi2GC-000PlU-80; Tue, 02 Nov 2021 23:28:04 +0100
Subject: Re: TC bpf_csum_diff problems post-5.6 kernel
To:     ThomasPtacek@gmail.com
Cc:     xdp-newbies@vger.kernel.org, lmb@cloudflare.com
References: <CANDGNvaJZxXJaDYQKOF0pRZD5GWQYYZytnPyOUcZtejYE39jLg@mail.gmail.com>
 <c238d2db-c962-6e6b-cf2e-2eefb8d27c66@iogearbox.net>
 <CANDGNva6f6vU05yu2ZDha2Y43X556ckV2R13e17k-w0Qe2btOQ@mail.gmail.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <2014aa37-a491-459e-329a-3e0502aa5bb9@iogearbox.net>
Date:   Tue, 2 Nov 2021 23:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANDGNva6f6vU05yu2ZDha2Y43X556ckV2R13e17k-w0Qe2btOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26341/Tue Nov  2 09:18:13 2021)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/2/21 11:08 PM, Thomas Ptacek wrote:
> !!!
> 
> That DID fix it! (I thought I tried it before, this time I just used
> (1ULL<<5) as the flag).
> 
> Why did that fix it? Is that flag new? :)

Some context on the full series:

   https://lore.kernel.org/bpf/cover.1591108731.git.daniel@iogearbox.net/

For the update, did you use bpf_csum_update() helper or directly writing into
the pkt?

> Thank you so much!

Np, thanks!

> On Tue, Nov 2, 2021 at 5:00 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>>
>> On 11/2/21 10:46 PM, Thomas Ptacek wrote:
>>> The problem I'm dealing with is XDP-adjacent, but not itself an XDP issue, so
>>> disregard if I'm too far outside the charter of the list. :)
>>>
>>> We run an XDP/TC-based UDP CDN.
>>>
>>> "Edge" machine XDP takes UDP packets off eno1, slaps a proxy header on
>>> them and bounces them to a wg0 (WireGuard)  interface, which shuttles them
>>> to "Worker" machines.
>>>
>>> "Worker" TC BPF on wg0 intercepts those UDP packets, strips off the
>>> proxy header, reflects values from that header back into the UDP and IP
>>> headers of the skb, and fixes up the checksums.
>>>
>>> All this works fine up through kernel 5.6. But we're working on a fleet update,
>>> and something >= 5.8 is breaking my code (or my code was always broken
>>> and relying on some pre-5.8 bug to function).
>>>
>>> With a bunch of perf debugging I've narrowed the problem down: it's the
>>> checksum diff that accounts for the stripped header. I do (roughly):
>>>
>>>       /* not shown: parse, copy proxy header to stack */
>>>
>>>       bpf_skb_adjust_room(ctx, -12, BPF_ADJ_ROOM_NET, 0)
>>
>> Hmm, if you add BPF_F_ADJ_ROOM_NO_CSUM_RESET instead of 0 as flag above, would
>> that work?
>>
>>>       skb_pull_data(ctx, sizeof(struct iphdr) + sizeof(struct udphdr))
>>>
>>>       /* not shown: re-check packet pointers, set up pointers to headers ... */
>>>       sum = ~((uint32_t)(udphdr->udp_sum))
>>>       sum = bpf_csum_diff(&proxyHeader, 12, NULL, 0, sum);
>>>
>>>       /* not shown: make other checksum fixups, write sum back to packet */
>>>
>>> Using some perf-based printf debugging, I can see that the checksum
>>> I'm getting from that bpf_csum_diff is wacky. Further: if I just leave the
>>> proxy header in the UDP packet, but still change the UDP ports and
>>> IP addresses, I get valid UDP checksums (albeit with a useless packet
>>> that has a proxy header still in it).
>>>
>>> I'm wondering if anyone can think of something that would have happened
>>> post-5.6 that would have broken this (or if there's something obviously
>>> abusive I'm doing with my "working" code, such that this never should have
>>> worked to begin with).
>>>
>>> ---
>>> Thomas H. Ptacek
>>>
>>
> 
> 

