Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291D81EB7CA
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jun 2020 11:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFBJBy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Jun 2020 05:01:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55908 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726160AbgFBJBx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Jun 2020 05:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591088512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sK3WiQXtgpaWClyVB5ijt9CaY/tWjd1uv2b5imFTmxE=;
        b=hdRTzFbpzFgxLM7nEB1G+hvU70gIKDBAwZHY043eW5noo62MpV3YhLrL1xbqisExdrn4lh
        RfKOOyBvsdqBjO1Gb7REbGgMrr22mcTlI1ZmHsUV4hI3TxM8CBufJVDgf6ssq/CRZIv35X
        6Ug24MOPNV80FPJBaFEHZZMz02IV3tE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-tgMi4e2aOXqvfzKNH_cVIw-1; Tue, 02 Jun 2020 05:01:50 -0400
X-MC-Unique: tgMi4e2aOXqvfzKNH_cVIw-1
Received: by mail-ej1-f70.google.com with SMTP id e14so3837396ejt.16
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Jun 2020 02:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=sK3WiQXtgpaWClyVB5ijt9CaY/tWjd1uv2b5imFTmxE=;
        b=Pmz8dU5/Sp63YLjqiZq5bFnmpO2lKbQ52Q/92E6ScSm2JF/66UY2LXtzSo5UP3xGHX
         TOpl9wNatL1LAKkhbboJ5IxrV77nghQZCmjCHOSx7WPJ6hJvHHHsGjdyKyGmK0TeFMyB
         yRocAy7WzN2MZpIp+lGI4VctkYZ7BddJMUIAQEJu449vAT7+ET6Flm2Zn5Ce+nsgiRKp
         tJn5agEiFj8cX4oocB64Lgpu84z3ZwQ3afYJi7PCrdSnO8YUrOagUhOTH0FMl+UNW0Vs
         Ly1E0o1F+z08s58R46TbqF1nfLHREFmIsCkc/k0LflzLuNaE6WtoXwl+JioQTtoyi6Gx
         VXew==
X-Gm-Message-State: AOAM5321kpA1rRyaMR9Tw9zUgq/0hF+7VRrZ04ukvchH/TxMyyTyFxAv
        OV2/9EoUEx6g3ombFLXJvgLLq5kWPf38n03/QNNMx9AtVSRImxxsZQxS+DGmypz8uviFpKxyKku
        ZbR4bxGzsNMRC0zeibpt0GLk=
X-Received: by 2002:a17:906:cede:: with SMTP id si30mr18445505ejb.315.1591088509136;
        Tue, 02 Jun 2020 02:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHzmCJGATRXhMDZapM+BCJodTnGB/aici3/CevsEuPFA+MVB/T6266n6E0p0AdmhOjkBbsFA==
X-Received: by 2002:a17:906:cede:: with SMTP id si30mr18445488ejb.315.1591088508964;
        Tue, 02 Jun 2020 02:01:48 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id y26sm1228641edv.91.2020.06.02.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 02:01:48 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C1789182797; Tue,  2 Jun 2020 11:01:47 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     maharishi bhargava <bhargavamaharishi@gmail.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 02 Jun 2020 11:01:47 +0200
Message-ID: <87d06hzvr8.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

maharishi bhargava <bhargavamaharishi@gmail.com> writes:

> Hi, in my XDP program, I want to redirect some packets using AF_XDP
> and redirect other packets directly from driver space.
> Redirection through AF_XDP works fine, but redirection through dev map
> stops after some packets are processed.

Do you mean it stops even if you are *only* redirecting to a devmap, or
if you are first redirecting a few packets to AF_XDP, then to devmap?

Also, which driver(s) are the physical NICs you're redirecting to/from
using, and which kernel version are you on?

-Toke

