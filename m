Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 643B0107E80
	for <lists+xdp-newbies@lfdr.de>; Sat, 23 Nov 2019 14:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfKWN1z (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 23 Nov 2019 08:27:55 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38050 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbfKWN1z (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 23 Nov 2019 08:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574515673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1MhDMEUxEmLEu7SdbOLTeWFaemHMbwohR9S2GAxlfJc=;
        b=TbVG8GTcqu6IYx4+1uX7uJLyGr/D/i4hy4U8ovRikyOs9ZE/kFPThjytN4baXwfFesk0/W
        WA3COcSWGjnGZTC1Hs7cnWUK+Kz1wLTX/n08Qc1JNOnhM31Gyxb3/hzWne7l5KQjMWwQPa
        XTI9mzUYnM1kBKh1eO9ak6CTf1Z3tHo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-PrwTlV9cPeuk_f6rc19yxQ-1; Sat, 23 Nov 2019 08:27:52 -0500
Received: by mail-lf1-f72.google.com with SMTP id t28so2385711lfq.6
        for <xdp-newbies@vger.kernel.org>; Sat, 23 Nov 2019 05:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=1MhDMEUxEmLEu7SdbOLTeWFaemHMbwohR9S2GAxlfJc=;
        b=SUc5C94iP0ezGv1wJ4SodWMwEbfPKnsfOAPkFZ5OdbJxAZIg1RgcSvodTWSLzwJwUm
         ni3O4s4itaJTNX18OX906e3VN+u4sGOC5L1wW+2MSrH9ClbXBrIk4ss72QewJf6Hp/jL
         OJ4mA0BScvLJnCmhr3lRK9P7IsBvdiVul0uM7jMmoJEudfLRI7h6dL8aeR9JwEeI8DsZ
         pM/Rpf8Qwm+nTayOI5TQ9qBpuxJDkjlHVmujHxPH2c+RKwlKn87UXIKPDxFUFLP1BukD
         +DXEX30BlvQu4Pthct4uWq7GdY0RQ15QewYCgObG8D6XRAENhZASovVmObAlzTK6eS91
         6oHQ==
X-Gm-Message-State: APjAAAXtnEm/KpmBk7dRB6PZnN5uAPvmgGXizrtJ/i1f0F26A/9xLeFS
        eG3ZBxuHYZcXbt7hO24xhyHStzEhzpiH+Wex0v4nXID1HpmhbJ5h9sMkYeHVm+xaVsTb92PQTYj
        t5BxV2LDTYFlJbvnRRlXO69s=
X-Received: by 2002:a2e:81c1:: with SMTP id s1mr15526281ljg.83.1574515670873;
        Sat, 23 Nov 2019 05:27:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5nzlKINiVfwlKaf0OgiL3Qij3eb+qHaBBD3Fs37/vwKXs2FUrPuQjM1M+jsA+0DEZCDxxHg==
X-Received: by 2002:a2e:81c1:: with SMTP id s1mr15526258ljg.83.1574515670608;
        Sat, 23 Nov 2019 05:27:50 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id a8sm705792lfi.50.2019.11.23.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 05:27:49 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 047371818BF; Sat, 23 Nov 2019 14:27:48 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Ahern <dsahern@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "netdev\@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: error loading xdp program on virtio nic
In-Reply-To: <1fc9364a-ab96-e085-1fc5-9ed29f43f815@gmail.com>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com> <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com> <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com> <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com> <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com> <20191121072625.3573368f@carbon> <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com> <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com> <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com> <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com> <20191122175749.47728e42@carbon> <1fc9364a-ab96-e085-1fc5-9ed29f43f815@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 23 Nov 2019 14:27:48 +0100
Message-ID: <87k17q3ep7.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: PrwTlV9cPeuk_f6rc19yxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

David Ahern <dsahern@gmail.com> writes:

> On 11/22/19 9:57 AM, Jesper Dangaard Brouer wrote:
>> Implementation wise, I would not add flags to xdp_buff / xdp_md.
>> Instead I propose in[1] slide 46, that the verifier should detect the
>> XDP features used by a BPF-prog.  If you XDP prog doesn't use e.g.
>> XDP_TX, then you should be allowed to run it on a virtio_net device
>> with less queue configured, right?
>
> Thanks for the reference and yes, that is the goal: allow XDP in the
> most use cases possible. e.g., Why limit XDP_DROP which requires no
> resources because XDP_TX does not work?
>
> I agree a flag in the api is an ugly way to allow it. For the verifier
> approach, you mean add an internal flag (e.g., bitmask of return codes)
> that the program uses and the NIC driver can check at attach time?

Yes, that's more or less what we've discussed. With the actual set of
flags, and the API for the driver (new ndo?) TBD. Suggestions welcome; I
anticipate this is something Jesper and I need to circle back to soonish
in any case (unless someone beats us to it!).

-Toke

