Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118A59BC5F
	for <lists+xdp-newbies@lfdr.de>; Sat, 24 Aug 2019 09:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfHXHhJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 24 Aug 2019 03:37:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45591 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfHXHhJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 24 Aug 2019 03:37:09 -0400
Received: by mail-io1-f68.google.com with SMTP id t3so25380368ioj.12
        for <xdp-newbies@vger.kernel.org>; Sat, 24 Aug 2019 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mU2/6Cf342BO3n5X5ntmFV0pOqBT7Zq860M5OXmEo9k=;
        b=c1IaTrL72+a89NyP7XEgvFZqWz6zSNM3yS+x+Q7S3hPNkzXTO/lG/7Gc8rR7aLjYbX
         de7JF4hADDgCafJG5+n8UTqIM3Qe6EG3ja3PBbNP8pWqiT/ky2xQUKuWQIqgZqLG+irH
         BuVYR9ZsYF6U53BX+BJLUyH0LxkNCjksXYfHNgRDB/6UAonRrVo76s5y9HWlkxFrdlUY
         urVDAfKaa17UechJ9oN4vyxLZWdkIitlG9Vf9ZxTKTQYgSWG0bmbzx1Nk1UCyEexn6hi
         HiejQgIOOc0V3zcHcECCje3lnDsphj4tkhI2A3P5arBOSVgOpOMB9J3VjJfxE84fBZbc
         fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mU2/6Cf342BO3n5X5ntmFV0pOqBT7Zq860M5OXmEo9k=;
        b=b9Z76BpSQeVAXPDhrA3WdywmjpHpEJ16d0h7oSShSJCt1hfGg6/SNzghrszGpU1FBR
         yX3/hZmb9voQz66YH8wVlIPq9EckQ2zCpuSmV+lb9SI+Pz2QCVGlPjDR+92+xR+yuPpP
         +pDYUazl52lTwsP0qMdC3UsEmsB/pPgQS/2pJwsd7N1i1UdQF6OrodLXQTrZjx8D10Lm
         PwdBNasq441IMjbfFJcBcII6idFz0jTwJtE6SQlV8qeph3OgeIKqYaA6mSRggC7906oB
         IvdPewTlC+DPwl5NHDtYzP694P+vG1zQYWDiErXvGP+zY0FAZT87jAboWrtQ9St5X/gA
         1idQ==
X-Gm-Message-State: APjAAAUHKDdbyqCX3oASc/Cr4s7uKr7mBRQPvNprgXEbejXimZ7NQzXB
        MrKlQM4G0DwTFkLnOMs0EN9aHHLpqkgAKxohTbM=
X-Google-Smtp-Source: APXvYqyJaj1CUXqv+3sxOvpzzaKlrHrV9ntGekyilfzpxgfH6Eg9aHA9Wi4SoXiDdLhuk9Ub90Nm95hC2OmXjOafn5s=
X-Received: by 2002:a6b:cac2:: with SMTP id a185mr11908952iog.142.1566632228660;
 Sat, 24 Aug 2019 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> <97f984e84a7049bc80cdf6438d1f5f4d@pantheon.tech>
 <CALDO+SbQeRjrPg5jFEOesEjtAVZSKv8CWipnHOE6FX5CgXBbOw@mail.gmail.com>
In-Reply-To: <CALDO+SbQeRjrPg5jFEOesEjtAVZSKv8CWipnHOE6FX5CgXBbOw@mail.gmail.com>
From:   Pavel Popa <pashinho1990@gmail.com>
Date:   Sat, 24 Aug 2019 09:36:56 +0200
Message-ID: <CAHOxX0xC42SOrP9133QEHw19E4j3_6bPpRzj5jsOzH7TGvaC2Q@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     William Tu <u9012063@gmail.com>
Cc:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

I'd like to join the questions too, specifically more oriented towards
AF_XDP devs.
I understand why the choice of SPSC ring queue design, however what
would be the cost of a MPSC design (Multiple Producer Single
Consumer)? In order to have a single UMEM available to the entire net
device (i.e. bound to all net device's hardware queues), imho this
would have a huge impact because now, among other things, one wouldn't
have to bother with ethtool. And do we really want to question the
convenience of "UMEM per hardware queue" vs "UMEM per net device"?
Btw, congrats for the great work guys.

Il giorno sab 24 ago 2019 alle ore 01:29 William Tu
<u9012063@gmail.com> ha scritto:
>
> On Fri, Aug 23, 2019 at 7:56 AM J=C3=BAlius Milan <Julius.Milan@pantheon.=
tech> wrote:
> >
> > Many thanks guys, very appretiated.
> >
> > Going to take a look at OVS implementation, but I would like to ensure =
something before.
> >
> > >> I took the _user part and split it into two:
> > >>
> > >> "loader" -  Executed once to setup environment and once to cleanup, =
loads _kern.o, attaches it to interface and pin maps under /sys/fs/bpf.
> > >>
> > >> and
> > >>
> > >> "worker" - Executed as many as required. Every instance loads maps f=
rom /sys/fs/bpf, create one AF_XDP sock, update xsks record and start liste=
n/process packets from AF_XDP (in test scenario we are using l2fwd because =
of write-back). I had to add missing cleanups there( close(fd), munmap()). =
This should be vpp in final solution.
> > >>
> > >> So far so good.
> > >>
> > >> I'm unable to start more than one worker due to previously mentioned=
 error. First instance works properly, every other fails on bind (lineno ma=
y not match due to local changes):
> > >>
> > >> xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struc=
t sockaddr *)&sxdp, sizeof(sxdp)) =3D=3D 0: errno: 16/"Device or resource b=
usy"
> > >>
> > >>
> > > I don't think you can have multiple threads binding one XSK, see
> > > xsk_bind() in kernel source.
> > > For AF_XDP in OVS, we create multiple XSKs, non-shared umem and each
> > > has its thread.
> >
> > In OVS, can you bind two sockets with non-shared umem to the same inter=
face?
>
> Yes, but to the different queue id on the same interface.
> So each xsk with non-shared umem bind to distinct queue id of that interf=
ace.
>
> > Our goal is to have 2 or more processes (VPPs) listening on the same in=
terface via XDP socket,
> > while XDP program decides where to redirect the packets at the moment.
> Make sense.
>
> Regards,
> William
