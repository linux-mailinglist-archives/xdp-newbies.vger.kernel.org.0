Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD7450D03F
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 Apr 2022 09:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiDXHd5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 Apr 2022 03:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238511AbiDXHdu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 Apr 2022 03:33:50 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B33C9FD8
        for <xdp-newbies@vger.kernel.org>; Sun, 24 Apr 2022 00:30:46 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id z144so1941875vsz.13
        for <xdp-newbies@vger.kernel.org>; Sun, 24 Apr 2022 00:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=Z6i/zQ3guYYhJ4Dc9JuOk2OvAuAt5DICc7FbFTW3FFc=;
        b=HJTF+3CevIfmHFsHrKxSd9PHDrqS3YliCW7zHxQ2e7TP3IT7DnFK2HpQgNDyWVfp1V
         JG4er2kG1Y1SAwnSGkNN/g5teGn6WRbWjATE2TuGDEEWR9SX7IelO5OvxYjw8ewchDtQ
         lprhXqcC0SOOZax1Br+koRQW59dQO/bde2zy/paUr9sAOoaomTfPt8g0bXT9WAMyhw/y
         dcpiEw92tVP4MVLfoKS5rixlSxoPkcUbI9AAKEiXqzFKieVo67bFwc0mnnq94gZ6gwZf
         IC4S10sohmFcaCny3cuvLrtz259msIakeZsJtnlXKE7ZqAi4mGBho2+/BFEfMAaM5EEP
         yCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=Z6i/zQ3guYYhJ4Dc9JuOk2OvAuAt5DICc7FbFTW3FFc=;
        b=p88D7NFsrrCTiMTmLu/gPQ+v5cmAcoCrjVnBPokapUb6VZQRjeMH3eqwaX6FcGMCH7
         hdVKhXL7CLcWC52LOFN64md7Cea7As5u0MNDtuyAt73CQvem2vZqjlKOLh5U8MnZqTpa
         fYwjiYyJgLAa2YkKe4Pe0eroyryN6deiQ0sya7G7gAq/hzJQ0JhwDc+cC5N/d2kqMVhu
         qiqkFgHipvblpkjLVXG7h2uHNzghXwmAgGbtiuZ+7NHIACvGQHRZH1nmB9QC/BWAzCx7
         psAd5Ba2pjtbilz4L+dwQgGcVnLMlCbKuPcnamTA35rrNrwfMmdA1OzepXafXHIZb5rM
         SWVQ==
X-Gm-Message-State: AOAM530fdVe3idpNCruiX/mWIQrATl65sKhqquFslDax1jM43t09aUUF
        CgOY7NQgIxBQKS6mqaSy/3AzNU6jReOqyeFIj3g=
X-Google-Smtp-Source: ABdhPJweX+nVwD9YAbHjsYEvQfdBwWcsMjAmn/xLn4P3VNZXXyHD7TwcZISEJp2aQetTYVdy7cxrHpGFTzkq+oNkOK4=
X-Received: by 2002:a05:6102:918:b0:32c:bc6b:f031 with SMTP id
 x24-20020a056102091800b0032cbc6bf031mr940681vsh.78.1650785445702; Sun, 24 Apr
 2022 00:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVAo4MGusmZeW6eOsx8-Ph-dJRGYENQ-eKY7h0B=3TapQii5A@mail.gmail.com>
 <87lew53qrs.fsf@toke.dk>
In-Reply-To: <87lew53qrs.fsf@toke.dk>
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Sun, 24 Apr 2022 09:30:30 +0200
Message-ID: <CAAVAo4M8HdA4yGpoVNo=-dAjXJ9tze77q5Rqvxu0TZ=VK2gNoQ@mail.gmail.com>
Subject: Re: XDP Redirect detail
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Toke

Your information is very useful for me.

Thanks for your reply.

Marco

Il giorno sab 16 apr 2022 alle ore 19:02 Toke H=C3=B8iland-J=C3=B8rgensen
<toke@redhat.com> ha scritto:
>
> Marco <ctxspi@gmail.com> writes:
>
> > Hi
> >
> > Can XDP_REDIRECT forward packets to egress interface with speed
> > different than ingress interface?
> >
> > More precisely, if ingress interface speed is 100 Gbps and the egress
> > interface speed is 10 Gbps, the xdp program can be load on two
> > interfaces and forward traffic (using XDP_REDIRECT) between them?
>
> Well, yes, it can forward packets just fine; but it'll just forward each
> packet as it comes in, there's no mechanism for queueing or otherwise
> rate limiting them. 10->100G is fine, of course, but in the other
> direction, if you are receiving at 100Gbps line rate, you'll end up
> forwarding 10 Gbps of it out the 10G interface and dropping the rest,
> semi-randomly as the TX buffers overflow.
>
> We're working on adding a  queueing mechanism to XDP to help with this,
> but it'll probably be a little while yet before it surfaces...
>
> -Toke
>


--=20
E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
