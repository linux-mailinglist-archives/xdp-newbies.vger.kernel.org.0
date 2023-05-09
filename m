Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8DB6FC796
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 May 2023 15:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235322AbjEINLp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 May 2023 09:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjEINLp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 May 2023 09:11:45 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4F955A2
        for <xdp-newbies@vger.kernel.org>; Tue,  9 May 2023 06:11:34 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-55dabfbb521so2358437b3.0
        for <xdp-newbies@vger.kernel.org>; Tue, 09 May 2023 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683637894; x=1686229894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn1ZUpJ94Z85cGsp+rSvYzHE7yrpQYCRBDYLzIVI2no=;
        b=X7ktwnB9KeGAKtSiRV43SeqjJ+bPD4UIo+ss31eKhV+CMinTQCZhOuhwIdvoxe/rEu
         lc0gBC0MjkGfBP03zDy+Ita/1XAqluPuUPSM2SmWo3u8lEqnfB92FDldpfEs5TqUjH14
         zLCJ3UZL3cAoDW3rGHY1a1+Z7cYwKRNqaAeYVbL8P/Z8gtu9sFaXpHeG5BWNs1inUdvu
         xsOWHcLkCnkks3itZ6FqiYi93In70oGk74vDRSbADETFYJy7ovTbtaVzwm9QPQjp3FKx
         ZkxrHQbrZIp824N7Yd46gZ3CAlmVMMzPylwhblxkozfYPOyk5/2itHyZ+FB0W7ikEaVG
         K3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637894; x=1686229894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn1ZUpJ94Z85cGsp+rSvYzHE7yrpQYCRBDYLzIVI2no=;
        b=c+DmAaaQgcXTxVpN/LsU7DtkMwmJfrY/s6RsFUx4hr/uiJAVMxsixBmOmoEdgZ6OLm
         H6isL50YMeZdbQ3nWFCfSBBLfWNeTqfsHdcXrijNlTTfGZF6VINTsV03cH8XFkLOimP9
         igxDjSKr3PQSzEV3CzlDWer5PZ86hfOgN4ePwnT3lzaI4vJ+dL/3KDVU8CQnJlEaDSZo
         1v09Dk9Oh8Cson96sXweHqbhGEGWYyr1Tsegvc15F2/jQom3BQrG+w33LQgaRruECzMV
         lQNl/1OC0K3u2yr4dReLSplpPrDwv+mIAecnltskCgUU9u0nOW6DW9DhBqE33FT6ZpU4
         MM3g==
X-Gm-Message-State: AC+VfDwHfYtjs8HStuNs1m1rZXyH1lBvF2j77YwBRcjeDeSrdA8SUBnq
        JwSBc/UW9WthLwJlnvVG3WceDD4+qUL+IlmWCqk=
X-Google-Smtp-Source: ACHHUZ6a118RJkiHmPY0r92v340WdrQ4Brg+mHFmKz+AKWq+1cx/VVFhZ7q7BetZSjZaZQtvLFxNZhAJt3cRy6JCGgk=
X-Received: by 2002:a25:ab2e:0:b0:b9d:8d6b:aa01 with SMTP id
 u43-20020a25ab2e000000b00b9d8d6baa01mr14445438ybi.5.1683637892379; Tue, 09
 May 2023 06:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <1192ed3a86ef4ef19e25a0864ede7ffb@tu-berlin.de>
 <CAJ8uoz1e-1J1C4rnT-npfc9Op_TnPMNy6mnJOdWzHBZKkjA99g@mail.gmail.com> <3feb89faadcb449881f92dc690049076@tu-berlin.de>
In-Reply-To: <3feb89faadcb449881f92dc690049076@tu-berlin.de>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 9 May 2023 15:11:21 +0200
Message-ID: <CAJ8uoz1pkOv0kJNKwOQtZ5-8boQKQ6J-ZyU01K4NdqRXj3k-eg@mail.gmail.com>
Subject: Re: question on contributing to the xdp project
To:     "Le, Ba Que" <b.le@tu-berlin.de>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "bjorn.topel@gmail.com" <bjorn.topel@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 9 May 2023 at 15:07, Le, Ba Que <b.le@tu-berlin.de> wrote:
>
> Hi,
>
> The bpf-examples is actually my targeted repo instead of xdp-tutorial (mo=
re up-to-date and better maintained).
>
> Can you give me the tutorial for the process since I'm new to it? First a=
nd foremost: I can't 100% guarantee the accuracy of the content, especially=
 the documentation and explanations included with the programs. I understan=
d that time and interest will be the deciding factors here, but it would be=
 very nice if a senior member could give advice/correction/support during d=
evelopment. Secondly, code quality. Should the code be pre-reviewed by a se=
nior supervisor to avoid unnecessary reviews of clumsy code, or can I proce=
ed with a normal pull request?

Just send a pull request so we can review it. We are nice people so do
not worry :-).

Thanks: Magnus

>
> Best
>
> Que Le
>
> ________________________________
> Von: Magnus Karlsson <magnus.karlsson@gmail.com>
> Gesendet: Dienstag, 9. Mai 2023 14:27:53
> An: Le, Ba Que
> Cc: xdp-newbies@vger.kernel.org; bjorn.topel@gmail.com; magnus.karlsson@i=
ntel.com
> Betreff: Re: question on contributing to the xdp project
>
> On Tue, 9 May 2023 at 12:58, Le, Ba Que <b.le@tu-berlin.de> wrote:
> >
> > Hello,
> >
> >
> > I am a computer science master student at the TU Berlin and currently w=
riting my Master Thesis.
> > I have been working on the AF_XDP socket for some time and would like t=
o use the AF_XDP as the basis for my master thesis topic, which is multipat=
h tunneling with XDP socket (may be changed in the future, depends on my su=
pervisors).
> > While I was prototyping the thesis, I found that some of my code can be=
 very useful for new people who want to learn and use the xdp socket.
> >
> > The code pieces mentioned are about:
> >
> > - UDP packet sender and receiver. These are ready-to-use programs. (Pos=
sibly be useful for requests by https://github.com/xdp-project/xdp-tutorial=
/issues/307 and https://github.com/xdp-project/xdp-tutorial/issues/307)
> > - Multiple independent AF_XDP sockets bind on multiple interfaces. I us=
ed it to test the possibility of using AF_XDP for multiple path tunneling. =
This will demonstrate how to setup and configure multiple sockets without U=
MEM sharing, and reading and writing UDP packets on these sockets.
> >
> > I imagine these examples might fit the XDP project's long term TODO "Ad=
ding AF_XDP support to relevant userspace programs" (https://xdp-project.ne=
t/#Adding-AF_XDP-support-to-relevant-userspace-programs).
> >
> > These programs will be submitted with detailed instruction and explanat=
ion.
> >
> > Please let me know your thoughts about the proposal.
>
> Hi,
>
> If you have good examples to contribute, that would be great. Maybe
> they would be a good fit for the bpf-examples repo.
>
> https://github.com/xdp-project/bpf-examples
>
> /Magnus
>
> > Best
> > Que Le
> >
> >
