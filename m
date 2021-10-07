Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD15E4258C4
	for <lists+xdp-newbies@lfdr.de>; Thu,  7 Oct 2021 19:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242893AbhJGRFB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 7 Oct 2021 13:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20128 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241576AbhJGRFA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 7 Oct 2021 13:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633626186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oKSMYa8wwy+ggrLvldFiIorIyR7gtc/vHIv5lbtTS8c=;
        b=GME0lR5016Ug2NCNv9UTWLUvxAjaHz0a5Bhm7IKZ4BBn5+c1T6/drbH2bfEDcNHlWtsH2c
        FsJm8uXLlMqUC0JvHrmR0MynmuZV6GYg1bsSU8qrrKV1IdgTTmwCRPfpRusPEUqjv2oIEt
        u6uEA6G9IJTkLDd5K/6Gi5sIWSzWQTI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-DpvaQCAGNWCg6g5ofzYVnA-1; Thu, 07 Oct 2021 13:03:05 -0400
X-MC-Unique: DpvaQCAGNWCg6g5ofzYVnA-1
Received: by mail-ed1-f72.google.com with SMTP id u23-20020a50a417000000b003db23c7e5e2so6530794edb.8
        for <xdp-newbies@vger.kernel.org>; Thu, 07 Oct 2021 10:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=oKSMYa8wwy+ggrLvldFiIorIyR7gtc/vHIv5lbtTS8c=;
        b=gxNMjLK/0y8+9t2seO0z5RGPE6VMfQatrAUkadt5xAKuhqFL1KJ9U6WQkktEpC6gj+
         vFadjEkMZjktqBeTMCDaYdidsA8sioZhOTVAVDCnwgC3gq4XJIZ21V5xA7NL9V+5mHAQ
         Hae1E4oFjsaydXNlRLHBHkHucqjskAHOE0ceodmkTnUTvGirPUd4G8ABgyxkS8HLNRAe
         ZcabaAWDLweQN85mZkjyA/RvU5dalQbMeT7vj4iMys1PS5svOfSxOWK53LI3Bhhr4pY6
         ntrPl46SiYhx/D74Zhs3NbUHuhjnsLQ6VSj0iTpU/IaG6eTP2nLv5OCoBHtEI8S+9B5a
         6IRQ==
X-Gm-Message-State: AOAM530BF+KicEExKMYOBaMzcBY9idlkjhleneOCkfCxkFph1NWgro0d
        oyoutJjH5kpIRylYbN/Tf1LCsDNYW5idu01lcBjDmovpZx5oFzd30nMi9gAU81NxROoujC5blTj
        BK3dnBECMdrmOLjCiwEkfNSk=
X-Received: by 2002:a50:da4e:: with SMTP id a14mr7783678edk.154.1633626181397;
        Thu, 07 Oct 2021 10:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9714mfwGhdXfhw/6brrOXKFFWZKuoWiFrq4pmRAiCXuOcYbtQyUhY14KRAt/crVNJuhkTIQ==
X-Received: by 2002:a50:da4e:: with SMTP id a14mr7783466edk.154.1633626179212;
        Thu, 07 Oct 2021 10:02:59 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id jt24sm69347ejb.59.2021.10.07.10.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:02:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 2245B180151; Thu,  7 Oct 2021 19:02:58 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>,
        xdp-newbies@vger.kernel.org
Cc:     Jesper Brouer <brouer@redhat.com>
Subject: Re: xdp-cpumap-tc multi queue schema and traffic mirroring
In-Reply-To: <20211006181848.20300152@pulsar>
References: <20211006181848.20300152@pulsar>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 07 Oct 2021 19:02:58 +0200
Message-ID: <875yu8n4xp.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Ethy H. Brito" <ethy.brito@inexo.com.br> writes:

> Hi All
>
> Before I moved to XDP cpumap bandwidth control "philosophy" I used to snoop inside the htb classes (mainly the default one) mirroring traffic to a dummy interface then run tcpdump on that like:
>
> 	tc filter add dev eth0 parent 1: protocol all prio 0xffff \
> 	u32 match u32 0 0 flowid 1:$shp action mirred egress mirror dev dummy0
>
> Then "tcpdump -npi dummy0" used to show me all that classid "1:$shp" was carrying.
>
> Now, with the multi queue environment XDP creates, I can't make mirroring to work.
> For instance: I need to see what is going on with HTB classid e:102, so I tried:
> 	
> 	tc filter add dev eth0 parent e: ... e:102 action mirred egress ...
>
> and "tcpdump -npi dummy0" prints traffic that has nothing to do with classid e:102. 
> I can confirm the traffic is pored thru the class since its bandwidth is
> controlled/limited correctly.

The xdp-cpumap-tc utility will attach a filter to the egress interface,
presumably that is taking priority and short-circuit your mirred filter?

-Toke

