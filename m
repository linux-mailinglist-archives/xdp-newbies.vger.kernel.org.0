Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0060A33B2D4
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Mar 2021 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCOMeB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 15 Mar 2021 08:34:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32148 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhCOMdh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 15 Mar 2021 08:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615811616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ECOWahUY1cHhSCkcG/TAKcvkBpFFABhyUuh/wmecIBQ=;
        b=FOhVYesBusDx3M4zcLrYlA4NHNe2WmaeFRu47hvBHlCvK/W3NVA2Xa9T9lgH4deOkVBYbY
        SAyvN5J8l2s9vsdOrueVOoUYzOV8q8JtyhUhKvQrKMpZLJgFFqwVGikxfv/WL9mi7Q5h7V
        5/JCkoo8fQD12HPBbtmH+YvtRUiKRJ4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-9NbzRIKENcCQ7Mb75o9fOw-1; Mon, 15 Mar 2021 08:33:33 -0400
X-MC-Unique: 9NbzRIKENcCQ7Mb75o9fOw-1
Received: by mail-ed1-f70.google.com with SMTP id r19so15449230edv.3
        for <xdp-newbies@vger.kernel.org>; Mon, 15 Mar 2021 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ECOWahUY1cHhSCkcG/TAKcvkBpFFABhyUuh/wmecIBQ=;
        b=VJRP4J+UOqFmFtbFsCLgg+kWFtmo/hiuAq9fxQD9e4p9C1HxGH8sI5Xc7lwiqDMtsB
         WmMWvcLm+fVU/o9+LWL4Wt8xnkrgysy9394bVhFLXPnv/2LLtyNhdweT0b4sjiZhLDdi
         lQjhRfKt/SkYuS6tXlPByoMo9qupfN5rM4tX2qoJJ8niMWt570DlJVDwBBDTncN6TInC
         LYkIcCoVZkzZqyEa57GToPUli92yHR4cwIuAJdrReVaQVlHkGy7VFxm/dxmKPCYVtNa8
         JO3Vc5Nd0ySkpU9xTfrBM94Q+utU/ZTpIyASRBrX/5SbOcNXLEJOAWt2meusOYpKB9R8
         4XYA==
X-Gm-Message-State: AOAM530bwyMOXfvlzovYi6dPUPI+g1tscGIc0PKVmG0UKXFeHWswoykf
        Vsyy76PdVmIt+Qv8i+e1eLp4DZvt8/nR0y5jSwJH8oaW2QL2GGYB1BnIhh4AmS3EMKBzJG7X1zq
        TITj2659nxUkMuld9zKRwxEg=
X-Received: by 2002:a17:906:81c9:: with SMTP id e9mr23044593ejx.456.1615811611959;
        Mon, 15 Mar 2021 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzibUira9mPxbnEbDsMeDOWBAudOJReo3MbBbwETIjJrOKLALqvcT0ta4FdG3zyLiON2AXdnw==
X-Received: by 2002:a17:906:81c9:: with SMTP id e9mr23044581ejx.456.1615811611828;
        Mon, 15 Mar 2021 05:33:31 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a17sm3968647ejf.20.2021.03.15.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:33:31 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B8DEB18027E; Mon, 15 Mar 2021 13:33:30 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Rohit M P <rohitmp99@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Queuing disciplines with XDP_REDIRECT
In-Reply-To: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
References: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 15 Mar 2021 13:33:30 +0100
Message-ID: <874khcppet.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Rohit M P <rohitmp99@gmail.com> writes:

> Hi folks,
>
> I was experimenting with XDP where I'm able to route the packets using
> XDP_REDIRECT.
> Could anyone point me towards using kernel queuing disciplines along
> with this if it's possible, or other possible alternatives for queuing
> disciplines while using XDP_REDIRECT?

This is not currently possible. It's on our radar, though:
https://xdp-project.net/#Queueing-and-QoS - and we have a PhD student
who has started looking into this.

It may be a while before anything concrete materialises, though; in the
meantime you'll have to rely on TC if you want proper queueing with
BPF...

-Toke

