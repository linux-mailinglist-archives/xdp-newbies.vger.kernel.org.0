Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5713973EE
	for <lists+xdp-newbies@lfdr.de>; Tue,  1 Jun 2021 15:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbhFANOA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 1 Jun 2021 09:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233922AbhFANN6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 1 Jun 2021 09:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622553136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2BsHmtTMtNaPt0hckW577FQlbcYQXb6aAgPIavLaedc=;
        b=BzhG6/jM+MiMQA3gg5Wuwvk6LcyQKjeRCTsj1bNQEcYr+UNglLKFAFVCsBkFQ6HzzBhgd/
        x8Tz4OPVRHsJK6A72VIdpsNmaxpwI+UHKGy3jWadAsFqalO65h+eBJPKla2YtOAjaba+2O
        DCobTgCqF6SRBSypyX4wU2zvTTpauNw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-bo7XJhfpPlyCySwLmpiBSA-1; Tue, 01 Jun 2021 09:12:15 -0400
X-MC-Unique: bo7XJhfpPlyCySwLmpiBSA-1
Received: by mail-ej1-f70.google.com with SMTP id dp16-20020a170906c150b02903f1e4e947c9so1587930ejc.16
        for <xdp-newbies@vger.kernel.org>; Tue, 01 Jun 2021 06:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=2BsHmtTMtNaPt0hckW577FQlbcYQXb6aAgPIavLaedc=;
        b=TlKpHTha3aJHpAYRYOQZrG6nu/vVF/D+a24egZVKEo7AiaHv2ivTNyvS5JuCTpptrJ
         Zr+cU/baE0j2hMhHfunB+Gq4CWto6R+4Se9w1Mcj2+7RSr4f0uhGjhXy7FfanmVuCr77
         8nVcEIN9QKwnPyTGh1xw+xgM10PjODqJieTUYHAEf1ZLlNZz06WubJRyO1kZmKlm5hmt
         9zdTvCHLjuXS42aX3t+X5DGW6498YCo3lZAvICeZYR7r21i0XbYGalSzQEJtaBd/O0MR
         KTuY9bJyJ6hsLO476T/2WvpSI8C2V74Pv5t54e/keh3wBxZiWaxsm+HNSFVxtmsP4+9o
         Y1ig==
X-Gm-Message-State: AOAM533Kn7OJ71N5qnYIvz7xBpwXA3pstJc4mn5nr96kr8axdxeysOXL
        bxileU/gcqsUhRFP+NAyEx9t6GcsBNFsOX2/rWEnW7tRIiYYEMCBH1unD/HDltN+0WWzmJ+pEAq
        E2KuXBjTlFRmTYxTW41WDk/A=
X-Received: by 2002:a05:6402:4256:: with SMTP id g22mr31818861edb.214.1622553132877;
        Tue, 01 Jun 2021 06:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/EHim5ieOJCbrbT+AHT9WI9s7qAV2tWNIPmlylwB6b6mcx60mFUmwiMI3lnub3CPPLAkZog==
X-Received: by 2002:a05:6402:4256:: with SMTP id g22mr31818349edb.214.1622553127826;
        Tue, 01 Jun 2021 06:12:07 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id p13sm500054edq.67.2021.06.01.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:12:07 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B5574180726; Tue,  1 Jun 2021 15:12:05 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     =?utf-8?Q?Sebasti=C3=A3o?= Santos Boavida Amaro 
        <sebastiao.amaro@tecnico.ulisboa.pt>, xdp-newbies@vger.kernel.org
Subject: Re: XDP in virtual Ethernet devices
In-Reply-To: <9a3f2989ee83a43263efc9fce02fe63b@tecnico.ulisboa.pt>
References: <9a3f2989ee83a43263efc9fce02fe63b@tecnico.ulisboa.pt>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 01 Jun 2021 15:12:05 +0200
Message-ID: <874kehd90a.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sebasti=C3=A3o Santos Boavida Amaro
<sebastiao.amaro@tecnico.ulisboa.pt> writes:

> Hello!
> I am trying to use xdp_stats[1] (this program prints packets=20
> passed/dropped) on the ethernet devices created by docker=20
> containers(veth). I have iperf exchanging messages between containers=20
> but xdp_stats does not capture any of the packets (XDP_PASS values do=20
> not change) and CPU usage goes to 100%. It works fine on my laptop's=20
> network device, but I have these issues with the docker network devices=20
> and I don't understand why.

I don't think there's anything special about the veth devices Docker
creates; so my immediate thought would be that this is due to
differences in the kernel versions you're running on your laptop vs on
docker. Some more details on this would be required to say anything
more, though...

-Toke

