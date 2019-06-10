Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3119E3BBCD
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jun 2019 20:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbfFJSYI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Jun 2019 14:24:08 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:40408 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387500AbfFJSYI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jun 2019 14:24:08 -0400
Received: by mail-qt1-f171.google.com with SMTP id a15so11564252qtn.7
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jun 2019 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sj8rsMlZyydMLPG5wPF4i4lEtS2cq/a2YiRB9cPu0Ss=;
        b=afkEOw3G43/RbBRbpjz9fgLtrfHzG1y90yLnR533Rv8x1/rr/E8AdX/VuLWOQOMrIZ
         6EMtJ/VCNrnJBZugjotrM0jsjmDmK1peojmY9t6qZF0MPUi+V0BL8k5JX5tYzCXsohIj
         4akJ/Yp82PUveQMF4PdgvMiR12cW9OyhxkyhJaHJ4Vwut5wT3lQucBYmmfyU0WrTzzKJ
         ar1VNAAO64j0TsRDwG3qA0KNOZC8zWp4iz8ExMu2kBpHKfv62fumtlupT+T0Z/b7lDwk
         TVnDcOfRo+PDIWSCziuB9EjtnceoguiBY/GIaKHprONic7HhGK4h6WgWrgupofgHF5zx
         UFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sj8rsMlZyydMLPG5wPF4i4lEtS2cq/a2YiRB9cPu0Ss=;
        b=pCASZ0I1u2rnbAAXKWzqIbrR3UPu9Dln0bnXMb4KSofwld5HxVi69Uho1ejmkJZyIC
         04DNGfvR4Th9dhD/y+F4L+xcyuF+Iud37nNMZ9h48j1fo2BP9qXqCSfkEgDOtKVZ1Vq1
         2R/xAnOVMewHgIlXtZHWd4NtkW+3MdL5E079SZE4Oie2ktYXB4JI8f72oVazOes9Bq3H
         VckENnCn2/nj9rvfuUXFU7tXVChATrDoCYFRmT98uYZsfY13G4dZ4G9eUkFLt9IRPPym
         0r91iP3U/n7i03szajdA/hmOaG6c6WnfSfpmClqS6untXXRZx+VySSILiF7Ro5qpvfkz
         ZCtg==
X-Gm-Message-State: APjAAAV1jSzzKVI/tJACFYRu1h6+p5ChDt42Rvp3yM68weL5YEATjSRt
        kUqc32YhWeTaWco6m4oKvkI3FBZDdps5ELe1L3U=
X-Google-Smtp-Source: APXvYqzLPMN674EBKluO7kBA049tHp1s5Avbv4M0lR/WXYgVQQHrgc4vWLe3BkxjKvCf2nEM6UBclirGX4VUjqLht8c=
X-Received: by 2002:ac8:2a46:: with SMTP id l6mr59745894qtl.309.1560191047334;
 Mon, 10 Jun 2019 11:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALDO+SZ_y2crYSXGtFxQtk8zZz2X=Fr-rJTPr_zm6rbtD8h9iQ@mail.gmail.com>
 <20190608141948.65e77b75@cakuba.netronome.com>
In-Reply-To: <20190608141948.65e77b75@cakuba.netronome.com>
From:   William Tu <u9012063@gmail.com>
Date:   Mon, 10 Jun 2019 11:23:29 -0700
Message-ID: <CALDO+SbhtcZfK-re9JLyss8VoHaVJgyrH7tzgRkFK0OMK1JSVQ@mail.gmail.com>
Subject: Re: AF_XDP with QoS support question
To:     Jakub Kicinski <jakub.kicinski@netronome.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "<dev@openvswitch.org>" <dev@openvswitch.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Jakub,

Thanks for your feedback.


On Sat, Jun 8, 2019 at 2:19 PM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> On Fri, 7 Jun 2019 19:55:34 -0700, William Tu wrote:
> > Hi,
> >
> > When using AF_XDP, the TC qdisc layer is by-passed and packets go to
> > userspace directly. One problem is that there is no QoS support when
> > using AF_XDP.
> >
> > For egress shaping, I'm thinking about using tc-mqprio, which has
> > hardware offload support. And for OVS, we can add tc-mqprio support.
>
> What is your end game?  Once upon the time Simon was explaining the QoS

I thought I could do s.t like
1) combined to 1 queue only using ethtool
2) using AF_XDP in OVS to send packets to queue0,
3) program the mqprio to do some ratelimit, and set prio by SO_PRIORITY

ex: use queue 0-1, 2-3,  and 4
tc qdisc add dev eth3 root mqprio num_tc 3 map 0 0 0 0 1 1 1 2 queues
2@0 2@2 1@4

> stuff in OvS to me, but IIRC it used CBQ and/or HTB.  The XDP TX queues
> are not exposed to the stack, so we can't set per-queue QoS, setting a
> root Qdisc (like mqprio) and expecting the XDP queues to have the same
> settings would be very limiting (then again even with mqprio IDK how
> you'd select the prio? by using the TX queue ID? hm..).
>
I see.
So the hw queues used by AF_XDP is the same queues used by QoS?
Then I guess the above command won't work.

> > For ingress policing, I don't know how to do it. Is there an hardware
> > offload ingress policing support?
>
> There is support for act_police in a couple drivers.  Although using it
> per queue could be a challenge...  (At least we do have a real queue ID
> on the RX, hopefully the mlx5 fake queues never get merged.)

Regards,
William
