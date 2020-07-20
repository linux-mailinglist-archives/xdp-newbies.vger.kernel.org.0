Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F6122626F
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jul 2020 16:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgGTOqn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jul 2020 10:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGTOqn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jul 2020 10:46:43 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149F2C061794
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Jul 2020 07:46:43 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id q74so17896402iod.1
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Jul 2020 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rlclkZ6cTJyj5qGR7Qj1XSyeITVD5pHkvKyKyENuqxY=;
        b=XQkic2mN6cF21kFYiyO4gEnTK9xN7Pct/EVVzE+/Jmd8t0x6RM+cwbH0wnlqjL4+gy
         YFwuixw/lJcl+vQ/ZOTtbwX0Q1xP6lPpveuVYEkfe1F4ntMgvBnC/g8QoBefTCKFddQu
         F0TiLU6B8c7loZksTnAj/d2iqqy/JVM4sxAk02gA93duNzQh2vCWNHH1+4/wNs+4M4jv
         JBIvKEr6uGNJMrMD0dVBXbAgCUJCOe0jdKBgfBbwzzYdPlbJSJrdZISb80OF+g/Tv/Lt
         BsaRfwrbLNdyaSaSs3uyMgqiW7xYi9OmqfS4Ewqhrv9nTl5xuG7FW/DW8fvdUApwVUVA
         QsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rlclkZ6cTJyj5qGR7Qj1XSyeITVD5pHkvKyKyENuqxY=;
        b=s0O7ldMJWwUx8qXexLiQnL4hyukdziXPKt5Wm9Eesdly31lCsJ9YQHmcxEsE8kRDeM
         7d88i9EQaG/8TUgGysXkjRFllPPWgqQEeZl4FYSNbKfgfri4vsOyr9FC6qCGPFHaL3n9
         IfEwOZhwG93qSTTG94Dmx9D/40LFjtY8pGcqm/NNfIGm7ySkzbUjzylBokEvgPchGIuO
         j/YoJF06UU9DkO4TLCjz9npZUi/+sFvDUdrG2B8AuxVbKZD2NBzgkNsB8bRN4RY2v6s/
         zSEvJ+1zPMyvbV5BwREKd0zcCESpavK3BjhZHGK45+6uZ/p6ojDSAvohx4FAihJHIDrz
         Eiig==
X-Gm-Message-State: AOAM532uDUHawNOwnaxzs7Ui8efuwiKk6mWmi9sjfzE01WBxkO6fdB6J
        DQ6bBbK0wYTSxOSLUE9sb8TqAtXXxP22O1OuGntCkPNhWaU=
X-Google-Smtp-Source: ABdhPJx1mncnqEOi5UAC1vJNcyS68E4Di93OJN4q3kSddM/Xp3A/FvhV5I1B9UuiMI/uB9bOp7TRNVwrDI+iCw8z0es=
X-Received: by 2002:a05:6602:2ac8:: with SMTP id m8mr23763457iov.36.1595256402356;
 Mon, 20 Jul 2020 07:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAH57y_Rxm9_eB5jyjJ2OryLd6HB6mXSG8s-MR3BWs-99PVNG0g@mail.gmail.com>
 <6de242a4-263a-bbde-7af4-68532904e4b3@solarflare.com>
In-Reply-To: <6de242a4-263a-bbde-7af4-68532904e4b3@solarflare.com>
From:   Alexander Petrovsky <askjuise@gmail.com>
Date:   Mon, 20 Jul 2020 17:47:23 +0300
Message-ID: <CAH57y_T9_K0L_cGjBQ+2C9UuRtw28Nqjk1FUB+F+3=WJVVZaqg@mail.gmail.com>
Subject: Re: IP fragmentation
To:     Edward Cree <ecree@solarflare.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

=D0=BF=D0=BD, 20 =D0=B8=D1=8E=D0=BB. 2020 =D0=B3. =D0=B2 15:17, Edward Cree=
 <ecree@solarflare.com>:
>
> On 20/07/2020 09:15, Alexander Petrovsky wrote:
> > But, the main problem for us it's fragmented IP packets. Some times
> > ago I tried to use for such packets AF_XDP, fast pass them into the
> > user space, accumulate and after that pass back to the network, it was
> > a PoC.
> Not 100% sure this works because I haven't tried it, but as long as
>  packets aren't being re-ordered, you can do it without needing to
>  save the payload in a map.
> All the map needs to store is (for each IPID being tracked) what host
>  this connection goes to.
> If you receive a First Fragment (frag_off=3D0, MF=3D1), you look up the
>  tuple through the regular LB to pick a server, and record that host
>  in the map entry for the IPID.
> For any other fragment, you look up the IPID in the map to get the
>  destination host, and if MF=3D0 you delete the map entry.
>  (If the IPID wasn't found, either drop or punt to userspace.)
> Then TX/REDIRECT the packet to the appropriate host.
> You might want to add some kind of simple ageing to this so that map
>  entries from interrupted/spurious fragment chains don't stick around
>  and build up over time.
>
> The problem comes when 'middle' fragments can either come after the
>  last (MF=3D0) fragment (technically this can be handled by tracking
>  the byte range seen for the IPID, and not deleting from the map
>  until all bytes up to the frag_off+total_len of the last-frag have
>  been seen), or worse, before the first fragment.  If the frag_off=3D0
>  fragment isn't the first one received, then this doesn't work
>  because you don't know at the time of receiving fragments what L4
>  ports they belong to.  But I don't know how common that situation is
>  and whether having it take the slow-path is acceptable.
>
> HTH,
> -ed

Unfortunately, for UDP I can't pick some _random_ host in case the
first _seen_ fragment it's not a First Fragment (frag_off=3D0, MF=3D1). In
this case, I have to accumulate ALL fragments in map. And on each
received fragment check, is all fragments are collected. I did it in
my PoC with AF_XDP, but in PoC all seems unreliable.

--=20
Alexander Petrovsky
