Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3062B20509D
	for <lists+xdp-newbies@lfdr.de>; Tue, 23 Jun 2020 13:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732287AbgFWL1U (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 23 Jun 2020 07:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbgFWL1T (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 23 Jun 2020 07:27:19 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD96C061573;
        Tue, 23 Jun 2020 04:27:19 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id l17so18360385qki.9;
        Tue, 23 Jun 2020 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cMD8in+tcSZ+cxLcLApA3NSEHIECL6G2aR2hs0xW3CM=;
        b=tScBdMx+HCr8IkPx+oY+4m3Qx2Y9c1/rjC8ioAfphyv/ELknRv571qL7I4AJrwXPUL
         B9buMDByA8fU2FEv3t1GElqrIdDCZ6QVWe8yfhOf0VfPuL+GePi9Vb+7d/wZTIdDpZq5
         8watSm6p/PgvpQ/yqIP7pmCGKJlX3LNLIaXZy4XpW5BdZJTccG5eezk5f0SK9jQhrlMZ
         nIIohI+oVp3TadiSEH6Yep55iMSzQW4+f6DJvPXoTgTqIs1Q7Aed19gBe/Ez5sHLXV5w
         Tr5AcMW0mGZo+g7T1LGFRCbtwoB2uAXWAXbepkm5pwcaV4fiPENj+EYPhRckkINyaUd+
         vmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cMD8in+tcSZ+cxLcLApA3NSEHIECL6G2aR2hs0xW3CM=;
        b=NE933Q+X4EO+ETDBCdh5yTYBvolY0DKK0EGv2p8Wv9tCeB1bMlbEq9IknTtB4mJLLW
         qV6VWf3gVXyaHY7jbti2s5iuCguLbpNYZWFfb+jKjKlHU5EIVBQ+JDgEUkke/lbn4FdV
         rbpeJ5HAhD+RvB20ecEayJaMLw4MwXMdw9BQqQ1tyq9/yoxd0d/Y6Fc545QYdjzcgNSh
         1IyqWVTI7UmC9jQoNVrPnfCQLF+GsTYBSlDaQGUhO4wMrpFrbGaLohh8kExP/hZycIG1
         NjdZlGgP+0ofdzRkOerfTY7i3zoQjEGtx+pKAn8b8cLOA422YUD4grdrDtTAT7/snsc9
         ywEg==
X-Gm-Message-State: AOAM530qnKhRGyZpfzCQrG5kzQWDWLeVW4c8OEdX6yKuELlPt9GqQkBU
        cJMa3BSATMAgnxZxw7JmXvQ30x5w/CFM5u9pxfs=
X-Google-Smtp-Source: ABdhPJzA0PI8zSWVsq7NsZXokgRHQ67Muc5QOK414TzszbhAwWE1zmIwGyxjtOIcjCdAHxNAxVMv1xuMgiK9/IHzebs=
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr20318528qkj.248.1592911638820;
 Tue, 23 Jun 2020 04:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAPydje97m+hG3_Cqg560uHoq8aKG9eDpTHA1eJC=hLuKtMf_vw@mail.gmail.com>
 <CAJ+HfNgi5wEwmFTgKpR1KemVm3p0FCPTd8V+BBWC6C59OO9O8Q@mail.gmail.com>
In-Reply-To: <CAJ+HfNgi5wEwmFTgKpR1KemVm3p0FCPTd8V+BBWC6C59OO9O8Q@mail.gmail.com>
From:   Yahui Chen <goodluckwillcomesoon@gmail.com>
Date:   Tue, 23 Jun 2020 19:27:06 +0800
Message-ID: <CAPydje-tiJ6F5i9=o9VLMJK0_j+KV5XGOok3Wq+okHdOS9k0Aw@mail.gmail.com>
Subject: Re: Talk about AF_XDP support multithread concurrently receive packet
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc:     "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Bj=C3=B6rn,
Thx for your clarification.

Lock-free queue may be a better choice, which almost does not impact
performance. The XDP mode is multi-producer/single-consumer for the
filling queue when receiving packets, and single-producer/multi-consumer
for the complete queue when sending packets.

So, the date structure for lock-free queue could be defined blow:

$ git diff xsk.h
diff --git a/src/xsk.h b/src/xsk.h
index 584f682..2e24bc8 100644
--- a/src/xsk.h
+++ b/src/xsk.h
@@ -23,20 +23,26 @@ extern "C" {
 #endif

 /* Do not access these members directly. Use the functions below. */
-#define DEFINE_XSK_RING(name) \
-struct name { \
-       __u32 cached_prod; \
-       __u32 cached_cons; \
-       __u32 mask; \
-       __u32 size; \
-       __u32 *producer; \
-       __u32 *consumer; \
-       void *ring; \
-       __u32 *flags; \
-}
-
-DEFINE_XSK_RING(xsk_ring_prod);
-DEFINE_XSK_RING(xsk_ring_cons);
+struct xsk_ring_prod{
+       __u32 cached_prod_head;
+       __u32 cached_prod_tail;
+       __u32 cached_cons;
+       __u32 size;
+       __u32 *producer;
+       __u32 *consumer;
+       void *ring;
+       __u32 *flags;
+};
+struct xsk_ring_cons{
+       __u32 cached_prod;
+       __u32 cached_cons_head;
+       __u32 cached_cons_tail;
+       __u32 size;
+       __u32 *producer;
+       __u32 *consumer;
+       void *ring;
+       __u32 *flags;
+};

The element mask, is equal `size - 1`, could be removed to remain the
structure size unchanged.

To sum up, it's possible to consider impelementing lock-free queue
function to support mc/sp and sc/mp.

Thx.


Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> =E4=BA=8E2020=E5=B9=B46=E6=9C=
=8823=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=883:27=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On Tue, 23 Jun 2020 at 08:21, Yahui Chen <goodluckwillcomesoon@gmail.com>=
 wrote:
> >
> > I have make an issue for the libbpf in github, issue number 163.
> >
> > Andrii suggest me sending a mail here. So ,I paste out the content of t=
he issue:
> >
>
> Yes, and the xdp-newsbies is an even better list for these kinds of
> discussions (added).
>
> > Currently, libbpf do not support concurrently receive pkts using AF_XDP=
.
> >
> > For example: I create 4 af_xdp sockets on nic's ring 0. Four sockets
> > receiving packets concurrently can't work correctly because the API of
> > cq `xsk_ring_prod__reserve` and `xsk_ring_prod__submit` don't support
> > concurrence.
> >
>
> In other words, you are using shared umem sockets. The 4 sockets can
> potentially receive packets from queue 0, depending on how the XDP
> program is done.
>
> > So, my question is why libbpf was designed non-concurrent mode, is the
> > limit of kernel or other reason? I want to change the code to support
> > concurrent receive pkts, therefore I want to find out whether this is
> > theoretically supported.
> >
>
> You are right that the AF_XDP functionality in libbpf is *not* by
> itself multi-process/thread safe, and this is deliberate. From the
> libbpf perspective we cannot know how a user will construct the
> application, and we don't want to penalize the single-thread/process
> case.
>
> It's entirely up to you to add explicit locking, if the
> single-producer/single-consumer queues are shared between
> threads/processes. Explicit synchronization is required using, say,
> POSIX mutexes.
>
> Does that clear things up?
>
>
> Cheers,
> Bj=C3=B6rn
>
> > Thx.
