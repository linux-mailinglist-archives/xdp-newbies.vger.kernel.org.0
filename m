Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3412C32C65D
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Mar 2021 02:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237251AbhCDA2m (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Mar 2021 19:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20494 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349852AbhCCLfr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Mar 2021 06:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614771242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2xKZl+F7K+dH1eoHOvDKNgtLqtxbr9utyFlTxIh/Z6Y=;
        b=FPs35cCq5qgsynNkyQBG98tSjjtjkdpASLOIdB/e0N4HmUAqw8D/EPKdOzJOrZAigpTcrN
        M2AgAVy0mtZdf99JlJYuowjNSHknSrQcvHbjlUWZDnIaezZnNhAcANryOcWPprtJBEXbr4
        kCYGGTGAt+bsBPo/rcbOyMJ3ZVa7eM4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-k2hSfX_TO-OBwPjvZuSYmw-1; Wed, 03 Mar 2021 05:51:50 -0500
X-MC-Unique: k2hSfX_TO-OBwPjvZuSYmw-1
Received: by mail-ej1-f69.google.com with SMTP id e13so4750946ejd.21
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Mar 2021 02:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=2xKZl+F7K+dH1eoHOvDKNgtLqtxbr9utyFlTxIh/Z6Y=;
        b=l3e9TkWDF0TXocck+C22k8ue+5pmQL/wJlC+bonENvLzhFLHfoaX03WcMx/4BwJ/XS
         +LeosCAGHs7x0MUjgpDJWjtbTCJ0AyH70Q0+hJlylsN7SVJjHuu0/S7yysVAP5Wu0Nj/
         UrlJEcGSSvqPDVtlem195LeBkZKc5jWw2GuNsE2HuGdmsXuiSWJOphPK1VxnrgpEd/lR
         yPbjpl802QksqMq+kjiLTF65Q6HLkkLTMwESsu2s1ZwlCkCfeN5fg/eXEkE7URu5xzuu
         sXh6DoA9YiQu5C+58OANbHYKFiGuTFEksPldSQ7Nekw+XJYnvDeoeoPxSatBgGzuTDbi
         D8OQ==
X-Gm-Message-State: AOAM531w44YHB4NntR1OmzSNC3vqJQb7VUEG8g0YWNs5mygIeczrmGLV
        V4HtNwvqf7H0sG8u2O1KQomGA7bWWh2vZuxiLhh1hd6KOReeoim3wm+B5+mQRYSaKwYQkulxVDc
        wwAyvvCja+3w05BoqEMih40s=
X-Received: by 2002:a17:906:6b1b:: with SMTP id q27mr24253865ejr.508.1614768709340;
        Wed, 03 Mar 2021 02:51:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/HL9X0S5V7GoPcLa9UF521WLMiqWI9t/XHppUCcPcaRexW4V3feFEP3OBnX6Vyxx5QOwW7w==
X-Received: by 2002:a17:906:6b1b:: with SMTP id q27mr24253853ejr.508.1614768709130;
        Wed, 03 Mar 2021 02:51:49 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id h22sm16471179eji.80.2021.03.03.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 02:51:48 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 727C41801A5; Wed,  3 Mar 2021 11:51:47 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Srivats P <pstavirs@gmail.com>,
        Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Putting Into Account Packet End (ctx->data_end)
In-Reply-To: <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
References: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
 <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Mar 2021 11:51:47 +0100
Message-ID: <877dmoik70.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Srivats P <pstavirs@gmail.com> writes:

> On Mon, Mar 1, 2021 at 9:40 PM Christian Deacon <gamemann@gflclan.com> wrote:
>>
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
>>      return XDP_DROP;
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
>>      return XDP_DROP;
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
>
> See
> https://lore.kernel.org/bpf/CANzUK5-g9wLiwUF88em4uVzMja_aR4xj9yzMS_ZObNKjvX6C6g@mail.gmail.com/

Since this is a question that gets asked a lot: Would you care to submit
this as an example to https://github.com/xdp-project/bpf-examples -
we're trying to collect useful examples there, and I think this fits the
bill.

-Toke

