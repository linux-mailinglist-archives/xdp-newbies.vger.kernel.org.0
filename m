Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7B2402EAE
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 Sep 2021 21:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238531AbhIGTE3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 Sep 2021 15:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32164 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230203AbhIGTE2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 7 Sep 2021 15:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631041401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J4hscL2eMehRiGl0NPp7eXluTwVFpUGzg2NHngXyIl4=;
        b=L6BKNGG1Fz4edDUHw3UWnXFB+LqGqIyu2vL4YxeWwkjpX4yYaUmX6Ek+O1Hp57fVzVKFLH
        X0PFL5+YknYCZuEev94hgv1Cu7keQgFGLQQSwG7O5DcRaGLX5Nz3Pno0AFlaj+oLCpiche
        pIAGpVjpW2zEur2yYeiqGZL7VqWD+WY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-BU2ZiQwUO1e5GWuvxUHFNA-1; Tue, 07 Sep 2021 15:03:20 -0400
X-MC-Unique: BU2ZiQwUO1e5GWuvxUHFNA-1
Received: by mail-ej1-f70.google.com with SMTP id c25-20020a170906529900b005c56c92caa2so32367ejm.19
        for <xdp-newbies@vger.kernel.org>; Tue, 07 Sep 2021 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=J4hscL2eMehRiGl0NPp7eXluTwVFpUGzg2NHngXyIl4=;
        b=XOYiNAbtywHDVWX4E0WEJqbM8DdjBJo2qM7TJoCpXE5qk1i6jFaCaNvp3t5wtY2T0p
         0llhSJ9xRHypHb80+EECORcHc6GW4eIBnMxa0Ihc/045e40nYEzh8pGVm/f3CrXJkHuO
         ayx9MZAgZ3g+BPjlIPPGumZVDLiIPk7hmnk2ZNXZydv64ugECJaa+oN7BR+dmdBshllu
         sXhUD0hJ2yrNP8+2f3X8kIihFYnsTSgl1wUiRREitxwjaKk+rD7XF7hV+gMRTHUdqwOk
         NciUUYqBO7bb0cn4kinT0hUHUt3VeugoiuWI+IzyXFdfbUnIvQbMG8HEBMQLen+apwcV
         Txkg==
X-Gm-Message-State: AOAM533W8t2yWJqyh7VRNPLZCMftWplYM+PxwoyEk1CfLL6fOyfuvsUf
        Z0eUj7/XBMtMBvOHP7tbFAcN0iQNj63f3RA97+PscSgZ+eS2cXcZ2Esqh1vW/oQRK9ylDlQy52U
        bMjEBxR6W/tt4ytKVzSgTDY0=
X-Received: by 2002:a50:ed0e:: with SMTP id j14mr1005588eds.305.1631041397541;
        Tue, 07 Sep 2021 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf4S8RQERZmleSk9oPJhgQocCWv6dBeFk69y34/ZPJiFyDkgtcoykytsTnkUVwNpHZNFnhoQ==
X-Received: by 2002:a50:ed0e:: with SMTP id j14mr1005489eds.305.1631041396327;
        Tue, 07 Sep 2021 12:03:16 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id gz22sm6018406ejb.15.2021.09.07.12.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 12:03:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 03F8618022B; Tue,  7 Sep 2021 21:03:13 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Zvi Effron <zeffron@riotgames.com>,
        Jose Fernandez <me@jrfernandez.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Linux laptop with native XDP support
In-Reply-To: <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com>
References: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
 <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 07 Sep 2021 21:03:13 +0200
Message-ID: <87k0jsp5se.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Zvi Effron <zeffron@riotgames.com> writes:

> I think the biggest thing might be to make sure the laptop has a wired ethernet
> port. Wireless uses different drivers, and I don't know if any of them have XDP
> support, currently. (Maybe they do, but wired is a bit more obvious, and likely
> more relevant to your use cases, anyway.)

Nope, no XDP support for WiFi. There was some exploratory discussion
about that some years ago, but XDP has Ethernet as a pretty fundamental
assumption so it's not an obvious fit to the Linux WiFi stack...

-Toke

