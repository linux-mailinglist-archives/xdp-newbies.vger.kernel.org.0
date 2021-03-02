Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3043532B18D
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Mar 2021 04:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhCCBwK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Mar 2021 20:52:10 -0500
Received: from mail-109-mta206.mxroute.com ([136.175.109.206]:34193 "EHLO
        mail-109-mta206.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1839099AbhCBQFf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Mar 2021 11:05:35 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-109-mta206.mxroute.com (ZoneMTA) with ESMTPSA id 177f3a0e1db00008a7.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 02 Mar 2021 15:49:03 +0000
X-Zone-Loop: df8840353c02454995cde2590934712ed02eac946e0d
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=USrysK96mKgKzPqe89cN5xbhbyUJstl0zssJEJ769ZU=; b=Jkzvj21FAa4LouTyKD8JTW7nTT
        8ytTZO4ILWsjdoziU1K/PoVLOcud7CEQueKzUWM6I4hwl6Hq2LqY14GRwTrHN97+E0gy4Lj7hVjtv
        XVYFBIuhb4kJ0b4Vfm6il+3b0KVCmPQwlIl1ExPp93wIItLr9yzpNJtmwAS4xj6VKQbaiJ4jnpTLQ
        QFWWopNVsqAa4+90PXjTiNXJukG4hygwWwKeHnLulPZPMcBoO65lNg08uUIeR422oSQLhd0oXlAFa
        YXmwDk5gqFNUNPB7DZuNYtl7GXswiUHkI6Kv1AjTcfGYeE7/az4fY8X6CcBs9wVldseneJGKhn98S
        xZQCifig==;
Subject: Re: Putting Into Account Packet End (ctx->data_end)
To:     Srivats P <pstavirs@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
References: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
 <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <906b7091-123b-76cc-6951-19ccbd96e812@gflclan.com>
Date:   Tue, 2 Mar 2021 09:49:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Srivats,


This works and thank you!


On 3/2/2021 7:28 AM, Srivats P wrote:
> On Mon, Mar 1, 2021 at 9:40 PM Christian Deacon <gamemann@gflclan.com> wrote:
>> Hey everyone,
>>
>> I wasn't sure if this belonged on the BPF mailing list or XDP Newbies.
>> However, I figured I'd send it to the XDP Newbies list first since the
>> project I'm making involves XDP.
>>
>> In my project, I'm trying to create a pointer that puts in account the
>> ctx->data_end pointer. The new pointer is an unsigned 32-bit integer
>> that is suppose to represent an IPv4 address. Here's an example of the code.
>>
>> ```
>> void *data_end = (void *)(long)ctx->data_end;
>>
>> //uint32_t *icmpdata = data_end - sizeof(uint32_t);
>> uint32_t *icmpdata = data_end;
>> icmpdata -= sizeof(uint32_t);
>>
>> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
>> {
>>       return XDP_DROP;
>> }
>> ```
>>
>> I'm trying to replace the last four bytes of the packet with this IPv4
>> address. When I do this, I receive the following BPF verifier error when
>> running the XDP program.
>>
>> ```
>> R7 invalid mem access 'pkt_end'
>> processed 909 insns (limit 100000000) max_states_per_insn 3 total_states
>> 30 peak_states 30 mark_read 25
>> ```
>>
>> To my understanding, this is due to accessing the packet end (data_end).
>> However, I'm curious why this is prohibited if we're trying to go back
>> four bytes into memory.
>>
>> I've also tried calculating the length of the packet and using ctx->data
>> like the following.
>>
>> ```
>> void *data = (void *)(long)ctx->data;
>>
>> unsigned int len = (ctx->data_end - ctx->data);
>>
>> uint32_t *icmpdata = data + len;
>> icmpdata -= sizeof(uint32_t);
>>
>> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
>> {
>>       return XDP_DROP;
>> }
>> ```
>>
>> However, this states the offset is outside of the packet.
>>
>> ```
>> invalid access to packet, off=-16 size=4, R2(id=56,off=-16,r=0)
>> R2 offset is outside of the packet
>> processed 931 insns (limit 100000000) max_states_per_insn 3 total_states
>> 29 peak_states 29 mark_read 24
>> ```
>>
>> I'm sure there is something I'm doing wrong with the check. With that
>> said, I believe I found the verifier check it's running into below.
>>
>> https://github.com/torvalds/linux/blob/master/kernel/bpf/verifier.c#L2882
>>
>> It looks like the `mem_size` argument is 0 and offset is below 0 which
>> is causing it to fail. I'm not sure why, but I'd assume it's because the
>> verifier believes `len` could be negative. Though, I tried adding checks
>> for `len` and ran into the same issue.
>>
>> The XDP project I'm working on is a basic layer 3/4 forwarding program
>> that does source port mapping when forwarding the packets. I have it
>> working for TCP/UDP packets. However, for ICMP, I have nothing to keep
>> track of within the headers. Therefore, I'm trying to add four bytes to
>> the packet and appending the client's IPv4 address to the end of the
>> packet before forwarding. When the packet comes back, I parse the last
>> four bytes of the packet which is suppose to indicate the client IP
>> address and remove the last four bytes of the packet. Below is the
>> source code at the moment.
>>
>> https://github.com/gamemann/XDP-Forwarding/blob/master/src/xdp_prog.c#L181
>>
>> I hope this is enough information, but if isn't, please let me know. I
>> also apologize if this is something silly I'm missing/not understanding.
>>
>> Thank you for your time!
>>
> See https://lore.kernel.org/bpf/CANzUK5-g9wLiwUF88em4uVzMja_aR4xj9yzMS_ZObNKjvX6C6g@mail.gmail.com/
>
> Srivats
