Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C97BFF89
	for <lists+xdp-newbies@lfdr.de>; Fri, 27 Sep 2019 09:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfI0HCN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 27 Sep 2019 03:02:13 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:40856 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfI0HCN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 27 Sep 2019 03:02:13 -0400
Received: by mail-oi1-f171.google.com with SMTP id k9so4330406oib.7
        for <xdp-newbies@vger.kernel.org>; Fri, 27 Sep 2019 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IJnpB2WfnZl6RUD5V2mUG5/IrF0WQ1GQQItanG60E4w=;
        b=TXNmY2IdypqCsi2maUM/r5e3FD2ry1sV5q8vzU4bNwGFwnsIbRBujkN7O1e1bE25gm
         Ot17PRNhHzbxPytlLnt2FiiF8sVmYosvQkGOyGOtz/5dXeJtiNjVDB8VRAbvXdmdlS/x
         HbgrhliydlMEgXQlYzSdp9LiX/Wq8Zh45PrdSgbRdZyb44IiTwe6vz4HCAy1m51Li13X
         1bf5fEiTOBCinGx2JIPIbkBsTkysXp0Ow2c9PzxGXBUSabvdZAYn6DFz+BdxgoOs39Hu
         9onDpNU2Cs1RayMy9yPlGo1aSXFp8ty1R48vk20cwsuM3wU7SmwcaUo3vFmMLFobbKzg
         Yfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IJnpB2WfnZl6RUD5V2mUG5/IrF0WQ1GQQItanG60E4w=;
        b=i8zHuUfcZXGTKBe+qobiX0KINmg6HpGf6wWwn3wZpEU5Plwg3y3qjGPXnbKOEiXnr/
         /g5D9G+YjIcrKc/WB0vZXRG5Oa7dyiAo+YmV8Qp6or6LvZDVVrdzMPIiMNm1D+7MHy4f
         UtF0Fo+SznEyfMJliJITKy3UjUJJcGocYWYIGFc3nw7+fuUS1ep/K8OwMG5YD/Q9I3KZ
         tg9sC5nyCdZP11i74fBJTnw80ADXbllbuYYnpJ/zbD2RA4+b86GMveAZ8J+S0PSth/Mu
         Uw+uVv+c2AOQX2lTR9Gt6HDCwroOjLKc/f3BYzlePQJnZRC3sOn09JbqL+ibj3CEyqeR
         BZVQ==
X-Gm-Message-State: APjAAAXUx8AFWRjBH6z/IBFHGpBap6OSkBKQjq+NLFe0aIX8eaxB3cxP
        06xUDP2dTRHsKjawXBVb59fhAkaP41Hsor8Dqco=
X-Google-Smtp-Source: APXvYqx75/CmIAxO1Pwo3RcB/BqMQg1XsitOl7MBsqlxsf9t0JwoNXozO9wSKzxSTaKwHPmIv+TwD3DLlUGnzcMPKmo=
X-Received: by 2002:aca:889:: with SMTP id 131mr5953547oii.109.1569567731484;
 Fri, 27 Sep 2019 00:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
 <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech> <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
 <966e40dda4654444a420b935ad970d18@pantheon.tech> <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
 <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech> <565AE8A9-8A0D-4582-A3C5-D317F4DA0C9F@redhat.com>
 <CALDO+SbC-64-78Fxv4u3p8RHG9n9jqcEHE3rRK5QjqF_KH+bmQ@mail.gmail.com>
In-Reply-To: <CALDO+SbC-64-78Fxv4u3p8RHG9n9jqcEHE3rRK5QjqF_KH+bmQ@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 27 Sep 2019 09:02:00 +0200
Message-ID: <CAJ8uoz1p4rL2TQ-4kXNDzd2dmJ3DCgvzPFUiJjPHRUYaBbUYZQ@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     William Tu <u9012063@gmail.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Sep 26, 2019 at 1:34 AM William Tu <u9012063@gmail.com> wrote:
>
> On Wed, Sep 25, 2019 at 12:48 AM Eelco Chaudron <echaudro@redhat.com> wro=
te:
> >
> >
> >
> > On 25 Sep 2019, at 8:46, J=C3=BAlius Milan wrote:
> >
> > > Hi Eelco
> > >
> > >> Currently, OVS uses the mmaped memory directly, however on egress, i=
t
> > >> is copying the memory to the egress interface it=E2=80=99s mmaped me=
mory.
> > > Great, thanks for making this clear to me.
> > >
> > >> Currently, OVS uses an AF_XDP memory pool per interface, so a furthe=
r
> > >> optimization could be to use a global memory pool so this extra copy
> > >> is not needed.
> > > Is it even possible to make this further optimization? Since every
> > > interface has it's own non-shared umem, so from my point of view, at
> > > least one
> > > copy for case as you described above (when RX interface is different
> > > then TX interface) is necessery. Or am I missing something?
> >
> > Some one @Intel told me it would be possible to have one huge mempool
> > that can be shared between interfaces. However I have not
> > researched/tried it.
>
> I thought about it before, but the problem is cq and fq are per-umem.
> So when having only one umem shared with many queues or devices,
> each one has to acquire a lock, then they can access cq or fq. I think
> that might become much slower.

You basically have to implement a mempool that can be used by multiple
processes. Unfortunately, there is no lean and mean standalone
implementation of a mempool. There is a good one in DPDK, but then you
get the whole DPDK package into your application which is likely what
you wanted to avoid in the first place. Anyone for writing libmempool?

/Magnus

> > Maybe Magnus can confirm?
> >
> >
> > > J=C3=BAlius
> > >
> > > -----Original Message-----
> > > From: Eelco Chaudron [mailto:echaudro@redhat.com]
> > > Sent: Monday, September 23, 2019 3:02 PM
> > > To: J=C3=BAlius Milan <Julius.Milan@pantheon.tech>
> > > Cc: Magnus Karlsson <magnus.karlsson@gmail.com>; William Tu
> > > <u9012063@gmail.com>; Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>; =
Marek
> > > Z=C3=A1vodsk=C3=BD <marek.zavodsky@pantheon.tech>; Jesper Dangaard Br=
ouer
> > > <brouer@redhat.com>; xdp-newbies@vger.kernel.org; Karlsson, Magnus
> > > <magnus.karlsson@intel.com>; Thomas F Herbert <therbert@redhat.com>;
> > > Kevin Laatz <kevin.laatz@intel.com>
> > > Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about
> > > XDP)
> > >
> > >
> > >
> > > On 23 Sep 2019, at 11:00, J=C3=BAlius Milan wrote:
> > >
> > >> Many Thanks Magnus
> > >>
> > >>>> I have next 2 questions:
> > >>>>
> > >>>> 1] When I use xsk_ring_prod__reserve and successive
> > >>>> xsk_ring_prod__submit. Is it correct to submit also less than I
> > >>>> reserved?
> > >>>>     In some cases I can't exactly determine how much to reserve in
> > >>>> advance, since vpp buffers have different size than xdp frames.
> > >>>
> > >>> Let me see so I understand this correctly. Ponder you reserve 10
> > >>> slots and later submit 4. This means you have reserved 6 more than
> > >>> you need.
> > >>> Do you want to "unreserve" these and give them back to the ring?
> > >>> This
> > >>> is not supported by the interface today. Another way of solving thi=
s
> > >>> (if this is your problem and I am understanding it correctly, that
> > >>> is) is that you in the next iteration only reserve 10 - 6 =3D 4 slo=
ts
> > >>> because you already have 6 slots available from the last iteration.
> > >>> You could still submit 10 after this. But adding something like an
> > >>> unreserve option would be easy as long as we made sure it only
> > >>> affected local ring state. The global state seen in the shared
> > >>> variables between user space and kernel would not be touched, as
> > >>> this
> > >>> would affect performance negatively. Please let me know what you
> > >>> think.
> > >>>
> > >> Yes, You understand it correctly, I implemented it the way you
> > >> suggested, i.e. by marking index and count of reserved slots (not
> > >> committed yet, but works well), thanks again.
> > >>
> > >>>> 2] Can I use hugepage backed memory for umem? If not, is it planne=
d
> > >>>> for future?
> > >>>>     Yet it does copy pakets from rx rings to vpp buffers, but
> > >>>> speculating about straight zerocopy way.
> > >>>
> > >>> Yes you can use huge pages today, but the internal AF_XDP code has
> > >>> not been optimized to use huge pages, so you will not get the full
> > >>> benefit from them today. Kevin Laatz, added to this mail, is workin=
g
> > >>> on optimizing the AF_XDP code for huge pages. If you want to know
> > >>> more or have some requirements, do not hesitate to contact him.
> > >>>
> > >> Kevin will the API for using hugepages change while optimization
> > >> process significantly or can I already start to rewrite my vpp drive=
r
> > >> to use hugepages backed memory?
> > >> Also please let me know, when you consider AF_XDP code optimized to
> > >> use huge pages.
> > >>
> > >> William, if I may ask next question.
> > >> Does OVS implementation of af_xdp driver copy paket data from af_xdp
> > >> mmaped ring buffers into OVS "buffers" (some structure to represent
> > >> the packet in OVS) or is it zerocopy in this manner, i.e. OVS
> > >> "buffers" mempool is directly mmaped as ring and so no copy on RX is
> > >> needed. Since in 2nd case it would be very valuable for me as
> > >> inspiration.
> > >
> > > Currently, OVS uses the mmaped memory directly, however on egress, it
> > > is copying the memory to the egress interface it=E2=80=99s mmaped mem=
ory.
> > > Currently, OVS uses an AF_XDP memory pool per interface, so a further
> > > optimization could be to use a global memory pool so this extra copy
> > > is not needed.
> > >
> > >>
> > >>> /Magnus
> > >>>
> > >>
> > >> Thanks a lot,
> > >>
> > >> J=C3=BAlius
