Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECCD40D251
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Sep 2021 06:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhIPEXW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Sep 2021 00:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhIPEXW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Sep 2021 00:23:22 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5B0C061574
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Sep 2021 21:22:02 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id z18so10301211ybg.8
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Sep 2021 21:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gtXB9YBxJuM96DztogrES31W9A486D3YjTeWzUjFoY=;
        b=ItLNuL/ZSCtn/gAahZrQ1jn+L/53UdgPzRfEpRR9dkn7X1i3piDghnNM+YM9M9iu03
         BZaUV6FCGokbwbyL2lJQjOIzZQWfTS2B0NcmmyRoUD13us8ij24ymx8XPIpoBTXzJBdm
         I1CR2CeWrPX3f8g+nuCIaPfjjSqf5sWuJtVWdSROdIk2qF9snKxLVoVA+B8CeuPQXd6Z
         wpY6a0fdjy1GF7kaWlcAyhZVK6fE0VU1qoRdlcsD329CUrWajdco0fLFszAfYfsbeO5V
         bT6LL0UHSSFA3l4cD1Y6GMfjd5/tY2y06shJb/GH/Bui9H3NeVIz0OrreFz7c/BoyZEP
         EKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gtXB9YBxJuM96DztogrES31W9A486D3YjTeWzUjFoY=;
        b=jgoxTgv3i0CJCO4WBTXelekclQmptR7P1RD790SPBg6kuTQBwPQqVGFWH2LSn0eZt2
         iGvxCX3FcDowSK9BBIDswjPb0llAz6HT0zObhfA48JS7hO/NAvypsVb2BUgLPNo/S6mF
         ElsbJINTVWFSFoUVwUx4LU7Roholr/b9FqI04Y/ZFNGSOzIjj6pTfgqf6Mm8iQslzcb0
         YR9i4uq7Ll3bB3ayqOHchzQLEDLZatKTLvh/MOBdIID4ZBEQ8bktsSvVCea3JsIH5VW+
         1Q+br29ehmWZ5SBcIoGG7075AvX80zlQye5ywjSZEP8+zZYtRnwgm8GbWrAHeKKAlsNK
         QmfA==
X-Gm-Message-State: AOAM533zqYcV3nmev2RG6MwAO9ooiBx8vyXXAdVnVKraNDYqWymGiqQD
        hXyd7brzHC5pI5krrav3oOPu18BmexE8pQQYJi9PFXkmK22aCpyE
X-Google-Smtp-Source: ABdhPJxMBSWJ0Ie2O/jMsjdV50fab3A9T6saXb/gXBzX7c601Wxt1gdDgR4q4dJmuWrdqEirFWRtIyrXD5a/veSh1IU=
X-Received: by 2002:a25:af49:: with SMTP id c9mr4458607ybj.432.1631766121723;
 Wed, 15 Sep 2021 21:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
In-Reply-To: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
From:   Rob Sherwood <rob.sherwood@gmail.com>
Date:   Wed, 15 Sep 2021 21:21:50 -0700
Message-ID: <CAFg6Rxuh1irBwCCP2t=Yj_JMXyu=SsT3g+_a0w_HU9UkQ2=OEQ@mail.gmail.com>
Subject: Re: Parsing TCP Header Options In XDP/BPF
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Definitely not an expert but no one has replied so I'll throw out my guess :-)

Check out https://lwn.net/Articles/794934/ for more info on 'bounded
loops', but my guess is that the verifier doesn't have enough context
to verify your loop is really bounded.

One trick might be to convert your while loop to a for(;;) loop, e.g.,
instead of :

https://github.com/gamemann/XDP-TCP-Header-Options/blob/master/src/xdp_prog.c#L81
while ( optdata < 40) {... }

you could try:

for (optdata = 0; optdata < 40; optdata ++) { ... }

I know from past attempts that just because it's obvious to humans
that there's not an infinite loop, it's not always obvious to the
verifier.

Hope that helps (and is correct!),

- Rob
.


On Wed, Sep 15, 2021 at 10:36 AM Christian Deacon <gamemann@gflclan.com> wrote:
>
> Hi everyone,
>
>
> I wasn't sure whether to submit this under XDP's mailing list or BPF's.
> However, since it's an XDP program, I figured I'd start here. The issue
> has to do with the BPF verifier, though.
>
>
> I am trying to parse TCP header options within XDP/BPF. In my case, I
> want to locate the 'timestamps' option and read/write to the sender and
> receive timestamps (the option's data, which is eight bytes in total I
> believe). In order to do this, I believe you'll need a loop since the
> TCP header options are dynamic in regards to location in the
> packet/memory, etc. For more information on the TCP timestamps option
> specifically, I found below a good read for those interested.
>
>
> https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_timestamps
>
>
> Everything I've tried so far and the source code is all within a GitHub
> repository I made below. I also included a full BPF fail log in the
> `logs/` directory within the repository.
>
>
> https://github.com/gamemann/XDP-TCP-Header-Options
>
>
> In the code, I am trying to locate the timestamp offset within the TCP
> header options. One condition in the loop is when it finds another TCP
> option other than timestamps. In this case, I am trying to increment by
> the option's length (the second field within the option) so we can move
> onto scanning the next TCP option. Whenever I attempt to do so, the BPF
> verifier states I'm trying to access outside of the packet. However,
> I've tried including many checks for this (making sure the length in
> memory is within ctx->data and ctx->data_end for example). You can find
> more information about this below.
>
>
> https://github.com/gamemann/XDP-TCP-Header-Options#fails
>
>
> At first, I was only checking to see if the location was outside of
> ctx->data_end, but since that wasn't working, I figured I'd try to see
> if it's within ctx->data and ctx->data_end to see if it made any
> difference (it did not).
>
>
>
> The tests I've ran occur for multiple kernels. From 5.14 to 5.10 and 5.4
> (which is the current kernel I'm on and what I performed my documented
> tests under). This is also on an Ubuntu 20.04 VM I have at home and here
> is the output from `uname -r`.
>
>
> ```
>
> root@test02:/home/cdeacon# uname -r
> 5.4.28-050428-generic
>
> ```
>
>
> I was wondering if anybody had suggestions or could tell me what I'm
> doing wrong in the code above. I apologize if I've missed anything
> obvious as well!
>
> Any help is highly appreciated and thank you for your time!
>
