Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12001DEB8B
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 May 2020 17:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbgEVPMN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 May 2020 11:12:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47576 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729929AbgEVPMM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 May 2020 11:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590160331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mOBJ1K4CsaBxMtEntVcpbDORGSn+FkewJoB9nND8i+0=;
        b=NjWS4PxPM7DvpNJ4WPGZVnqkCqyG01MNb4Vg7XDBHykXSHIfPLoR25l4RrguhgjYFnJV5K
        QQ7jDX9+cYxUpd8lmiMx39ap5byCFk30FPTMK3au4WtRTdd+FS6FITK75AtI9OvxFOKVH5
        EFp4JWO1pTEavv5uTBGHqP5Je00/VkI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-NbiiUuCtPAGj-SVymQtCaw-1; Fri, 22 May 2020 11:12:09 -0400
X-MC-Unique: NbiiUuCtPAGj-SVymQtCaw-1
Received: by mail-ed1-f71.google.com with SMTP id bs5so3812355edb.18
        for <xdp-newbies@vger.kernel.org>; Fri, 22 May 2020 08:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=mOBJ1K4CsaBxMtEntVcpbDORGSn+FkewJoB9nND8i+0=;
        b=KiiSCabK3L4uih3SnwTeoP8OAV3QxxJ9kpJB8RWSN4SoMx3WmP/ciQwXR9BZvRoDm5
         Sel968GrPGsicjsnbyNDii2dbcZyUaEt4W2oaGY+8IBPq9ldup67an4+Y5H/2h2WBVIj
         lYoT6rSTptUU4ae5/ZzEjgFcAGbh3sRxAHQIkt1dmC46GBFHmJN+8gcvFNUXWHIe68+S
         oc2SxzGALZC0FCr55x3M6mcdl0dKpskqw8Z7SV0t1NIvvj7fX0fvjE4tTSQFBrUE6NQp
         3Q2FFvxv1rQzgqA9NgIG3tZK77EzcYHAoAfE5H2TM9gAsmEgVXzVEyfzHpuwYx+q9Zb6
         Z6Ng==
X-Gm-Message-State: AOAM533UjI2fvV+qfnOyZCiqFib3/Ct+5yFx6+/4kGJdBYLZ2lOcN1WK
        IOK0LzntFjr8437RPmNODR/SLKmwJecpYn2m5wJzTCPg8J8teG0G5LqcJhJmGQyAouPZ4HeCshL
        5NtfTpAI9oIC7M4hJpvekqtw=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr8146902ejc.92.1590160328290;
        Fri, 22 May 2020 08:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxejrjEsxOT9mS4dee+RhKafrs/+ApyD3URRLqWucHMXvU0IKr75Lkq38aW1IUxknRSyzxPPg==
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr8146890ejc.92.1590160328081;
        Fri, 22 May 2020 08:12:08 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id bd10sm7106439edb.10.2020.05.22.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 08:12:07 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0734218150E; Fri, 22 May 2020 17:12:07 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: XDP Software Issue - Payload Matching
In-Reply-To: <a8acdb19-2d7d-43d6-67a7-3ad926ae27c4@gflclan.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com> <878shyg3e9.fsf@toke.dk> <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com> <87ftc5ut0q.fsf@toke.dk> <edbf300d-a687-7652-d702-d58be09fd541@gflclan.com> <874ksjuca6.fsf@toke.dk> <a8acdb19-2d7d-43d6-67a7-3ad926ae27c4@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 22 May 2020 17:12:06 +0200
Message-ID: <87tv08j96h.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey Toke,
>
> I apologize for the delay on this. I've been working on a couple other 
> XDP/BPF projects recently.
>
> Thank you for the information you provided!
>
> Do you know of any open-source projects/examples that uses the method 
> you're suggesting to compare packet data without using for/while loops? 
> I haven't tried implementing the code yet, but I'm not entirely sure how 
> I am going to do so.

Well, having a map that uses IP addresses as lookup key is kinda the
same, I suppose, it's just a very limited part of the payload that's
being used as the key. But other than that, no, please consider this a
completely off-the-top-of-my-head idea with no warranties, implied or
otherwise :)

-Toke

