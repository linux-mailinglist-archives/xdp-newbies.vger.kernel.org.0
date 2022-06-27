Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA82355DD55
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Jun 2022 15:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbiF0Kv1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jun 2022 06:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiF0Kv0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jun 2022 06:51:26 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955A06446
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jun 2022 03:51:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w20so15867440lfa.11
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jun 2022 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AHqvCEHWoRiv6l8pWkxK4Jy7oot4KU3OcIArvMk37a0=;
        b=nOb17W00hdIk2/9ykK2B3J8hhW6eHtoDbVvx4idaNfyazaLc9mz88tUDSFgA5h7vm6
         Id6amuM571M8/8C4vnwoNdN+uU8nTRKzIEwBvnpvZA+JwBbN4xByIeFA+uwoBd11h+DZ
         CxTLvOgp6R6fbbWz04Kw6XtrbtrC7i8XzMlJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AHqvCEHWoRiv6l8pWkxK4Jy7oot4KU3OcIArvMk37a0=;
        b=RJC2MZW1dWGD7fBS1RCgVgcIvmT6dby9SfpKmRDUv4+A8IJrxAxRvtS9BjfZJ/LZqG
         kiAm60Eb3+FDIdmGNWFrZeIeFlhGY9IAzFYnZ90cQdTOP3XYL+TR+OzylttJh1omAG//
         +z1EqeCIpRpkqsJ7oy29ve20Ek6yTBcck5DqiV25aH2/Eo3kbkPQudstBt0WLUXIqTHG
         8tLINubuvqRjPffxiMZHQMtvEtvQYG5DffTgmlDvwb4GP/gt5qTmCB1mFbLBJ8jMykIs
         jtgThkCVJw23T/zup9FhKyg2rF20fJDuHklWJlI3TqPxuZRQXsqq13xruMbQI99hlz3N
         uc9w==
X-Gm-Message-State: AJIora8N67p6jaoqXy19DyO5qJUBaz8KD+P+Mc5pbvWjKroJBSkl5eyf
        Q85VY52ZQtUTrK53rFmTOOPFr4Lm8q5xbpL73MhsWQ==
X-Google-Smtp-Source: AGRyM1uwfWVqCyDwCPIpVJW0JWEQ0qPjqioxt6U+Ov5dHnBn1OUv27iyorXeOeEipcdgV95thVPR6XNmR73I8Q1p9nM=
X-Received: by 2002:a05:6512:2806:b0:47f:af40:a44e with SMTP id
 cf6-20020a056512280600b0047faf40a44emr8270637lfb.80.1656327083945; Mon, 27
 Jun 2022 03:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local> <Ykwj+ycjc+F70iko@boxer>
 <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com> <CY4PR1101MB2360C2F07AEC4EAB9043A64B90B99@CY4PR1101MB2360.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR1101MB2360C2F07AEC4EAB9043A64B90B99@CY4PR1101MB2360.namprd11.prod.outlook.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Mon, 27 Jun 2022 12:51:13 +0200
Message-ID: <CAHApi-na1Oq9gvho92gAMtLJT5OKE9z7nNbopZ4Br7uCZom9ug@mail.gmail.com>
Subject: Re: XDP multi-buffer and AF_XDP
To:     "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
Cc:     "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "eric@sage.org" <eric@sage.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
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

What about using huge pages for the UMEM and the unaligned chunk flag
to receive jumbo frames with AF_XDP? Last time I checked this wasn't
supported. Is this something that works today without XDP
multi-buffer?

Kal


On Mon, Jun 27, 2022 at 11:12 AM Sarkar, Tirthendu
<tirthendu.sarkar@intel.com> wrote:
>
> Hi Kal,
>
> I have been working on implementing the XDP multi-buffer for i40e but got=
 stuck with performance issues. I also have the AF_XDP patches and may be w=
e can focus on them instead. What NIC are you working on?
>
> + Magnus
>
> Regards,
> Tirtha
>
> > -----Original Message-----
> > From: Kal Cutter Conley <kal.conley@dectris.com>
> > Sent: Wednesday, June 22, 2022 5:52 PM
> > To: Fijalkowski, Maciej <maciej.fijalkowski@intel.com>
> > Cc: eric@sage.org; Jesper Dangaard Brouer <jbrouer@redhat.com>; Toke
> > H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>; Xdp <xdp-
> > newbies@vger.kernel.org>; Sarkar, Tirthendu <tirthendu.sarkar@intel.com=
>
> > Subject: Re: XDP multi-buffer and AF_XDP
> >
> > Hi All,
> > Does anyone know if any progress has been made with respect to multi-
> > buffer support with AF_XDP? I would also like to help.
> >
> > Kal
> >
> > On Tue, Apr 5, 2022 at 1:12 PM Maciej Fijalkowski
> > <maciej.fijalkowski@intel.com> wrote:
> > >
> > > On Fri, Apr 01, 2022 at 09:52:02AM -0400, eric@sage.org wrote:
> > > > On Fri, Apr 01, 2022 at 01:26:12PM +0000, Karlsson, Magnus wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Jesper Dangaard Brouer <jbrouer@redhat.com>
> > > > > > Sent: Friday, April 1, 2022 3:13 PM
> > > > > > To: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>; Kal Cut=
ter Conley
> > > > > > <kal.conley@dectris.com>; Xdp <xdp-newbies@vger.kernel.org>
> > > > > > Cc: Brouer, Jesper <brouer@redhat.com>; Lorenzo Bianconi
> > > > > > <lorenzo.bianconi@redhat.com>; Karlsson, Magnus
> > > > > > <magnus.karlsson@intel.com>; eric.david.sage@gmail.com
> > > > > > Subject: Re: XDP multi-buffer and AF_XDP
> > > > > >
> > > > > >
> > > > > > On 01/04/2022 13.39, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > > > > > > Kal Cutter Conley <kal.conley@dectris.com> writes:
> > > > > > >
> > > > > > >>>
> > > > > > >>> Hi,
> > > > > > >>> We are very interested in receiving jumbo frames (> 8000
> > > > > > >>> bytes) over AF_XDP. Does XDP multi-buffer support
> > XDP_REDIRECT with AF_XDP?
> > > > > > What
> > > > > > >>> about in zero-copy mode?
> > > > > > >>>
> > > > > > >>> Cheers,
> > > > > > >>> Kal
> > > > > > >>
> > > > > > >> Looking into this more I found this comment in the mlx5 driv=
er:
> > > > > > >>
> > > > > > >> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not
> > > > > > >> yet
> > > > > > >> * supported by upstream, and there is no defined trigger to
> > > > > > >> allow
> > > > > > >> * transmitting redirected multi-buffer frames.
> > > > > > >> */
> > > > > > >>
> > > > > > >> So at least mlx5 does not yet support XDP multi-buffer with
> > > > > > >> XDP_REDIRECT. What "upstream" support is required to get
> > > > > > XDP_REDIRECT
> > > > > > >> to work with XSKs?
> > > > > > >
> > > > > > > Well, the initial patch set for multibuf explicitly blocked
> > > > > > > XDP_REDIRECT between interfaces, which is what that comment i=
s
> > > > > > > referring to (the TX side).
> > > > > > >
> > > > > > > For AF_XDP we'd also need to define the UAPI, and maybe add a
> > > > > > > socket flag so the userspace program can signal to the kernel
> > > > > > > that it understands it? Not sure about the details.
> > > > > > >
> > > > > > > You're definitely not the only person who wants this, though;
> > > > > > > adding in some people who may have a better idea of the exact
> > steps needed.
> > > > > >
> > > > > > Cc. Eric Sage, as he also expressed interest in implementing th=
is...
> > > > >
> > > > > Adding Tirtha that has patches for the AF_XDP support of multi-bu=
ffer.
> > > > > Though, he is currently integrating his i40e multi-buffer driver
> > > > > support with Lorenzo's TX-patches that he sent as an RFC. Latest =
I
> > > > > heard is that Tirtha is planning on submitting this in a couple o=
f
> > > > > weeks as a proper patch to the mailing list. And after that, the
> > > > > focus is to brush up the AF_XDP and ZC support patches as we
> > > > > stopped trying to track Lorenzo's multi-buffer patches at version=
 13 out
> > of 23 ;-).
> > > > > We just could not keep up.
> > > >
> > > > Ah, if there is anything I can do to help please let me know. My
> > > > company needs this feature so I can work on it full time. I would l=
ove to
> > help out however I can.
> > >
> > > Hey Eric! We'll keep you in loop in terms of progress around this wor=
k.
> > >
> > > >
> > > > Thanks,
> > > > Eric Sage
> > > > >
> > > > > > --Jesper
> > > > >
