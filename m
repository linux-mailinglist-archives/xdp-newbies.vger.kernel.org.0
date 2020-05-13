Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654421D17D1
	for <lists+xdp-newbies@lfdr.de>; Wed, 13 May 2020 16:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388859AbgEMOmj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 13 May 2020 10:42:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47927 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388855AbgEMOmi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 13 May 2020 10:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589380956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iK+3uDDX1dEEJZMWzPbgMhj+N47YkKLQvhVabk7S4YQ=;
        b=C7p1ezDsMPeL4Mcac9uSvk2DoMnV1ygrpMUCPnADEN5uuko7Zv8s/DBCLPa2b29VRMKuBr
        uWySjXrObdK7uGISkhMEvibTnIthCfletrcAEu6hqkBLLWKxsUJdluvtAs6Je6xKJ+SnWF
        ZSfoWB8SmQLkL8m2v6Xazi6NERtJGzM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-0-mYRwenPRq3rfbvafmguQ-1; Wed, 13 May 2020 10:42:29 -0400
X-MC-Unique: 0-mYRwenPRq3rfbvafmguQ-1
Received: by mail-lf1-f72.google.com with SMTP id 68so6222586lfj.9
        for <xdp-newbies@vger.kernel.org>; Wed, 13 May 2020 07:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=iK+3uDDX1dEEJZMWzPbgMhj+N47YkKLQvhVabk7S4YQ=;
        b=qZxEBxdR57P00t35QZHL89TtKTyBGnC+5KKkg+/YyeGrwKpTbEIBCUchkXgOuw6i58
         P2X3MM5pgRpur6KC4JDz/GpVVekVoJfBxRtv5CP3/O4CEUTgQOcLSQIRZGVRDUPrzY6Y
         2JAGtG7jzN7sQnkt6sZ77vAlOFrYEPVkWb2NedS8X24Y+jv/KqGd3PySYoNGAnHdJ5to
         gh9L5UqBODYAu6wS+HMEze25NpjE+c1HAY4b5FjwkzZDr0Z70bgsygQjtRwcMzcwK4+K
         XM3l2pGjymrfWT5Irzw2sE1uQ0UPQS80WmRaBxcQRQ94VxElAWOmjxRoDbXv2xxL49FE
         fhLw==
X-Gm-Message-State: AOAM530GxfyZjXPy7sO/xQ9QtOfL96I4KIj0QymHirUlbhPaW4QT7jNr
        WH00o7QS9+RC6ZiZPPNeJxM0KMOuV+eFjaXvUA05Q42i7m/b8auNk+eRaupxeuACc3aoogAcK6b
        FnD3KbvhXD7ExW5kU+MoQS5w=
X-Received: by 2002:a2e:5848:: with SMTP id x8mr3232183ljd.283.1589380947893;
        Wed, 13 May 2020 07:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf56D6r3MjpNC4X5FRN8CzJu+14q1AToBAyY2oLOVwzk5GsG6gynjCm0moaPVDLauGZTyXrg==
X-Received: by 2002:a2e:5848:: with SMTP id x8mr3232170ljd.283.1589380947549;
        Wed, 13 May 2020 07:42:27 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 134sm16185394lfj.20.2020.05.13.07.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:42:26 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 729D718150C; Wed, 13 May 2020 16:42:25 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: XDP Software Issue - Payload Matching
In-Reply-To: <edbf300d-a687-7652-d702-d58be09fd541@gflclan.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com> <878shyg3e9.fsf@toke.dk> <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com> <87ftc5ut0q.fsf@toke.dk> <edbf300d-a687-7652-d702-d58be09fd541@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 13 May 2020 16:42:25 +0200
Message-ID: <874ksjuca6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey Toke,
>
> Thank you for your response!
>
> Unfortunately, I still haven't been able to get the for loop to work=20
> properly. I've also noticed if I use `iph->ihl * 4` when initializing=20
> the `byte` pointer, it produces the following error:
>
> ```
> R5 !read_ok
> processed 732 insns (limit 1000000) max_states_per_insn 4 total_states=20
> 16 peak_states 16 mark_read 10
> ```
>
> It seems I need to use a static size such as `sizeof(struct iphdr)`.=20
> Though, not all packets would have an IP header length of 20 bytes. I've=
=20
> tried performing checks with the length as well:
>
> ```
> uint8_t len =3D iph->ihl * 4;
>
> if (len < 20)
> {
>  =C2=A0=C2=A0=C2=A0 return XDP_DROP;
> }
> else if (len > 36)
> {
>  =C2=A0=C2=A0=C2=A0 return XDP_DROP;
> }
>
> // Setting len to 20 or any other value works fine.
> // len =3D 20;
>
> uint8_t *byte =3D data + sizeof(struct ethhdr) + len + l4headerLen;
> ```
>
> However, no luck. I'm not sure what I can do to make BPF believe this is=
=20
> safe.

Hmm, maybe have a look at Jesper's experiments with getting to the end
of the packet:

https://github.com/xdp-project/xdp-tutorial/pull/123
https://github.com/xdp-project/xdp-tutorial/pull/124

Not sure if he ended up concluding anything definite about what the best
technique is :)

> I was also wondering about the following:
>
>  > Use a matching algorithm that doesn't require looping through the=20
> packet byte-by-byte as you're doing now. For instance, you could have a=20
> hash map that uses the payload you're trying to match as the key with an=
=20
> appropriate chunk size.
>
> Do you know of any BPF Helper/kernel functions that can hash the=20
> payload? I looked at the BPF Helpers function list, but wasn't able to=20
> find anything for XDP sadly. I would like to attempt to implement=20
> something like this to see if I can avoid for loops since they aren't=20
> working well with BPF from what I've seen.

No, there's no direct hashing helper for XDP. I just meant that you
could use the (chunk of) the payload directly as a key in a hashmap.
Something like:

struct hash_key {
       u8 payload[CHUNK_SIZE];
}

int xdp_main(ctx) {
    struct hash_key lookup_key =3D {};
    int *verdict;

    [...]

    memcpy(&lookup_key, ctx->data, CHUNK_SIZE);
    verdict =3D bpf_map_lookup_elem(&lookup_key, ...);

    if (verdict)
      do_something_with(*verdict);

}

(You'd still need to convince the verifier that the memcpy from packet
data is safe, of course).

-Toke

