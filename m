Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF881075F9
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 17:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKVQuY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 Nov 2019 11:50:24 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:46548 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfKVQuX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 Nov 2019 11:50:23 -0500
Received: by mail-pj1-f53.google.com with SMTP id a16so3258802pjs.13
        for <xdp-newbies@vger.kernel.org>; Fri, 22 Nov 2019 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=VSbkiE9zQzZnuFnYcZw6X5U5gTZWe34F6wmy1yzc/gc=;
        b=13TpWrb5F14nmArd61b64+QXP9oRh9WAR4njq9FWrPUeEHAA3q2Jmf3XHvtTkzsIDS
         TMD5gjTS3cRF8LftfAaJSqNG6R8cG1UEuOZmBoP3ZSWnXm3aF0uiIZtkEJZI96gW23q/
         GU37nqq89s/wGZy3HXyZBZ9h19+83NyEEkW2J7fALNmKBtGaoMOkwSYhwlN2YzClFfP4
         9B2yOtqJE4GmMiCzFA9+ONxMIvnLTaSD14nItJz1o+iZewqDAGyz3sruKWu121Iq26uw
         1N634F342h/IXZs39gKBbuhuA9fifAMgsqRHmePlpKlPkc1q9r98exn1taEtADiUboT6
         2Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=VSbkiE9zQzZnuFnYcZw6X5U5gTZWe34F6wmy1yzc/gc=;
        b=nFiH2oIuhTp2r2AF5/oFHslsq17Y6HPSt7iH1oP8Mw3uXYmtPfqjZJLK2Lrgwd94ub
         o0pXNtBDwhfsbIx8WsZgQvp2RQ9YGy2TBqhHzoOpEwxw4cdySaxc8c8bzYW+4R1Cb7UR
         29pEOHzGRc97rdg2YAiCpeDZzVrmjJAtsmh30Wm0jjeXo3H5caU+EBUUob3VqrY6OWay
         SKIOYaeCEWpr4BZCs9Vt+O11RkDkKlcMShgLUPQuEeGHYozgIScwpbK0cEodj2N4PT8o
         LN7KHJcvv2DDetKF47lN8Ue0R8ILPMPeDQ9zTQUnrQPRWVlvWDGNkOmK5J9jbJS0rOEM
         SMsg==
X-Gm-Message-State: APjAAAWeaN2E6NdcrxWBMsrjrd5kEok655WWUypXoWIwhT0Xdk+YnOiR
        r2S1VBWUyZGN4y6YRsasF0zvLw==
X-Google-Smtp-Source: APXvYqzL+RL0BeMR/pLtj9M1omYG30+g6emTRHZehc3S8JZtpVRtM+WYFp1l6PnXmEcJZLXEOQu1oQ==
X-Received: by 2002:a17:90b:4006:: with SMTP id ie6mr20042843pjb.50.1574441423031;
        Fri, 22 Nov 2019 08:50:23 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id q184sm8146252pfc.111.2019.11.22.08.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 08:50:22 -0800 (PST)
Date:   Fri, 22 Nov 2019 08:50:18 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     David Ahern <dsahern@gmail.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: error loading xdp program on virtio nic
Message-ID: <20191122085018.0f866a6b@cakuba.netronome.com>
In-Reply-To: <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
        <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
        <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
        <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
        <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
        <20191121072625.3573368f@carbon>
        <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com>
        <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com>
        <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com>
        <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 22 Nov 2019 08:43:50 -0700, David Ahern wrote:
> On 11/21/19 11:09 PM, Jason Wang wrote:
> >> Doubling the number of queues for each tap device adds overhead to the
> >> hypervisor if you only want to allow XDP_DROP or XDP_DIRECT. Am I
> >> understanding that correctly? =20
> >=20
> > Yes, but there's almost impossible to know whether or not XDP_TX will be
> > used by the program. If we don't use per CPU TX queue, it must be
> > serialized through locks, not sure it's worth try that (not by default,
> > of course).=20
>=20
> This restriction is going to prevent use of XDP in VMs in general cloud
> hosting environments. 2x vhost threads for vcpus is a non-starter.
>=20
> If one XDP feature has high resource needs, then we need to subdivide
> the capabilities to let some work and others fail. For example, a flag
> can be added to xdp_buff / xdp_md that indicates supported XDP features.
> If there are insufficient resources for XDP_TX, do not show support for
> it. If a program returns XDP_TX anyways, packets will be dropped.

This is covered by the always planned but never completed work on
richer queue configuration ABI by yours truly, Magnus and others.

Once we have better control over queues we can do some "manual mode"
config where queues are not automatically provisioned, are provisioned
even when program is not bound or are provisioned on a subset of cores
(if all NICs' IRQs/NAPIs are pinned to those core all should be gut).

=F0=9F=A4=B7=E2=80=8D=E2=99=82=EF=B8=8F
