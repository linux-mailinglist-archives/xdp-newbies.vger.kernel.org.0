Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8CE5549F5
	for <lists+xdp-newbies@lfdr.de>; Wed, 22 Jun 2022 14:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiFVMWd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 22 Jun 2022 08:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiFVMWc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 22 Jun 2022 08:22:32 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E9D3055E
        for <xdp-newbies@vger.kernel.org>; Wed, 22 Jun 2022 05:22:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s14so12388529ljs.3
        for <xdp-newbies@vger.kernel.org>; Wed, 22 Jun 2022 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3O8cwcH1bFBZQjoKdtL4F2H9UQTOxAzv0XI3cV4Rtlw=;
        b=fuWqvI+GvE9gxhXgst4cr2gGJ7+YwpLJdqBpluSWvnmBnJML5xn3p0MhqMPG4nVxCZ
         pnlQ4BmgVFMsvxyW76mCoV37AFKmUlAqzFJe+HCPLSvgwvn4OvlAWD/+NfXA3XZItc0q
         g8AxFqPPsHIjkq8fQvs1YoPghoIs95l1bbV/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3O8cwcH1bFBZQjoKdtL4F2H9UQTOxAzv0XI3cV4Rtlw=;
        b=LyfF6zXL/lESwd+SaEHRVY73Qar8QHucn3sEdNtbNzgf/E/tXZ8SDbDc2goqcU+rGU
         m7IoSNhe+w8JIYZ9TuiyMlfj/0oclaJpcP2InJNCn9nzbArwGKXTodAkNApzOiw5uZDU
         XtYtmyLSn98bxwnu4W+p72uHAqS3JMmOgAZqzgRD2tQYgGBfa4WLiFGc7K1UVNK9Y4pT
         MbZ95qvb9CKKQoylANaaUhvpp+yp/D3eV5FB46riHYj531yRe2/XgQaBdKvaMDXtv0wm
         ZrtSso6YcSdzabKcjrNRas1BXq54em3V16kk78oFxw5xDk0yfgoQeV8RihkV5S8GXVlZ
         w+lw==
X-Gm-Message-State: AJIora+OiBrkGV9//zgjE77f8zLmNSdxceWCseh8KH/a4ZxJJbHSJXMP
        M0eNKwjmLXfwAgZJSIJKiWIYBxs1ts1tim2VKJyU2A==
X-Google-Smtp-Source: AGRyM1s3CEqgH/z5rtWrs6vwhAU0mT6SWsJhcKbn1fHRuF8Ym54ELL/pINIVbpVvkO6abNAuCfDFIyZakxgPwiSfSIw=
X-Received: by 2002:a2e:a547:0:b0:25a:650f:eb4b with SMTP id
 e7-20020a2ea547000000b0025a650feb4bmr1806777ljn.422.1655900549051; Wed, 22
 Jun 2022 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local> <Ykwj+ycjc+F70iko@boxer>
In-Reply-To: <Ykwj+ycjc+F70iko@boxer>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Wed, 22 Jun 2022 14:22:18 +0200
Message-ID: <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com>
Subject: Re: XDP multi-buffer and AF_XDP
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     "eric@sage.org" <eric@sage.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi All,
Does anyone know if any progress has been made with respect to
multi-buffer support with AF_XDP? I would also like to help.

Kal

On Tue, Apr 5, 2022 at 1:12 PM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Fri, Apr 01, 2022 at 09:52:02AM -0400, eric@sage.org wrote:
> > On Fri, Apr 01, 2022 at 01:26:12PM +0000, Karlsson, Magnus wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jesper Dangaard Brouer <jbrouer@redhat.com>
> > > > Sent: Friday, April 1, 2022 3:13 PM
> > > > To: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>; Kal Cutter =
Conley
> > > > <kal.conley@dectris.com>; Xdp <xdp-newbies@vger.kernel.org>
> > > > Cc: Brouer, Jesper <brouer@redhat.com>; Lorenzo Bianconi
> > > > <lorenzo.bianconi@redhat.com>; Karlsson, Magnus
> > > > <magnus.karlsson@intel.com>; eric.david.sage@gmail.com
> > > > Subject: Re: XDP multi-buffer and AF_XDP
> > > >
> > > >
> > > > On 01/04/2022 13.39, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > > > > Kal Cutter Conley <kal.conley@dectris.com> writes:
> > > > >
> > > > >>>
> > > > >>> Hi,
> > > > >>> We are very interested in receiving jumbo frames (> 8000 bytes)=
 over
> > > > >>> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP?
> > > > What
> > > > >>> about in zero-copy mode?
> > > > >>>
> > > > >>> Cheers,
> > > > >>> Kal
> > > > >>
> > > > >> Looking into this more I found this comment in the mlx5 driver:
> > > > >>
> > > > >> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
> > > > >> * supported by upstream, and there is no defined trigger to allo=
w
> > > > >> * transmitting redirected multi-buffer frames.
> > > > >> */
> > > > >>
> > > > >> So at least mlx5 does not yet support XDP multi-buffer with
> > > > >> XDP_REDIRECT. What "upstream" support is required to get
> > > > XDP_REDIRECT
> > > > >> to work with XSKs?
> > > > >
> > > > > Well, the initial patch set for multibuf explicitly blocked
> > > > > XDP_REDIRECT between interfaces, which is what that comment is
> > > > > referring to (the TX side).
> > > > >
> > > > > For AF_XDP we'd also need to define the UAPI, and maybe add a soc=
ket
> > > > > flag so the userspace program can signal to the kernel that it
> > > > > understands it? Not sure about the details.
> > > > >
> > > > > You're definitely not the only person who wants this, though; add=
ing
> > > > > in some people who may have a better idea of the exact steps need=
ed.
> > > >
> > > > Cc. Eric Sage, as he also expressed interest in implementing this..=
.
> > >
> > > Adding Tirtha that has patches for the AF_XDP support of multi-buffer=
.
> > > Though, he is currently integrating his i40e multi-buffer driver
> > > support with Lorenzo's TX-patches that he sent as an RFC. Latest I
> > > heard is that Tirtha is planning on submitting this in a couple of
> > > weeks as a proper patch to the mailing list. And after that, the focu=
s
> > > is to brush up the AF_XDP and ZC support patches as we stopped trying
> > > to track Lorenzo's multi-buffer patches at version 13 out of 23 ;-).
> > > We just could not keep up.
> >
> > Ah, if there is anything I can do to help please let me know. My compan=
y needs this
> > feature so I can work on it full time. I would love to help out however=
 I can.
>
> Hey Eric! We'll keep you in loop in terms of progress around this work.
>
> >
> > Thanks,
> > Eric Sage
> > >
> > > > --Jesper
> > >
