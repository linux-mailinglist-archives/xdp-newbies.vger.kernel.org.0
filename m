Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABF23BDACD
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Jul 2021 17:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhGFQCO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Jul 2021 12:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40268 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230110AbhGFQCO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 6 Jul 2021 12:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625587174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o14FcLOqcb46VjrM3czBqI69ypWJOXq6lU6RVhMHdT8=;
        b=JgM0xCqfMwc9mlbDR5Kvj0EbvQDPM+UPAZBKTpOldm/3M0ltZLcX15njTaIpTrBBAvZ0Hf
        7zcHgvwDX904KjiBWTQGRD+p0VQR3JBzCl7nnBqK7LlCUfbEuA+pl30UET0897cgCmGyZu
        xuZW4MWagNd72niKOWN1aq6kCPTREzg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-WnKZD5tCPbSIRAGYuRH5uw-1; Tue, 06 Jul 2021 11:59:32 -0400
X-MC-Unique: WnKZD5tCPbSIRAGYuRH5uw-1
Received: by mail-ed1-f71.google.com with SMTP id i19-20020a05640200d3b02903948b71f25cso11039654edu.4
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Jul 2021 08:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=o14FcLOqcb46VjrM3czBqI69ypWJOXq6lU6RVhMHdT8=;
        b=fcU+/fnuebT6MZgfiVs9kFBsyxMa6y40Y1UjwAq6Jx/ImOsMr86qPMJcY0oPFcYIMw
         J3bJpWRxhuYkomGdtMG+W1bW6KYE31J8UrANSQiuokYZrkXhvJdxo0Dn2lPZ7JN9yPG+
         OaCfDk/AT7CM4Yj13ohI04ziAIYKhrJH2ypJaiMUbnimseM6nIobucwfHiChB5TwNm1c
         5kYxUCflejVWnoEFjJm7mjIt3LCOsnpD5oZP7+HZ/j8oTHjprjMGy6RVjjxDRh3MOfyR
         R9gIlzKKvuAqr2+kAwYby97/VQl9xu5EsilIn5CoQX4PORrjfLadKG6ipehGr6PL4BUU
         pFpg==
X-Gm-Message-State: AOAM530h6pRR1/OUVgiFwaFtxzMFbKBdtQPR8yvr+Hc4JGk05Ayrkknt
        ZjQcx+7X6oCAoTj7pFH1BYVXMdmzXsB+mnLNHerBrHSGyyCe5lPF6/IYRGc7EMfUs7TB87xXbgn
        a3qMmaNEGyYVTnPcvOixXRNg=
X-Received: by 2002:a05:6402:148d:: with SMTP id e13mr23694051edv.28.1625586838984;
        Tue, 06 Jul 2021 08:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5N03IQ/+rt6z+E+SJ0Djhxguk0Jj/08fkwPNMhspj+0mMhpyKsj+srxDv9cYRlLwE9YQMA==
X-Received: by 2002:a05:6402:148d:: with SMTP id e13mr23694045edv.28.1625586838879;
        Tue, 06 Jul 2021 08:53:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id e22sm7570909edu.35.2021.07.06.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 08:53:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D3F0218072E; Tue,  6 Jul 2021 17:53:56 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     =?utf-8?Q?Sebasti=C3=A3o?= Santos Boavida Amaro 
        <sebastiao.amaro@tecnico.ulisboa.pt>, xdp-newbies@vger.kernel.org
Subject: Re: Using XDP in docker swarm to track outgoing traffic
In-Reply-To: <36491a913ed7da582ef3d264de1a8046@tecnico.ulisboa.pt>
References: <36491a913ed7da582ef3d264de1a8046@tecnico.ulisboa.pt>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 06 Jul 2021 17:53:56 +0200
Message-ID: <878s2jxwtn.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sebasti=C3=A3o Santos Boavida Amaro
<sebastiao.amaro@tecnico.ulisboa.pt> writes:

> Hi everyone,
> I am trying to use XDP to track outgoing traffic from docker containers=20
> deployed using docker swarm and running in a network using the driver=20
> overlay. I am using a simple xdp program based on [1], and I run this=20
> program on the network namespace of the container using nsenter and=20
> attach it to its eth0.
> However, I am only able to detect the incoming packets and not the=20
> outgoing ones. When running tcpdump on the container network namespace I=
=20
> can see both incoming and outgoing packets. So I am a bit confused as to=
=20
> why XDP would not detect the outgoing ones.
> Does anyone know why the reason for this or a general idea as to why=20
> this might happen?

Yeah, XDP only works on ingress - you'll need to use the TC hook if you
want to look at egress traffic (or attach to the veth peer outside the
container) :)

-Toke

