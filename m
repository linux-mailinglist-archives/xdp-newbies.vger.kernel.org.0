Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79D6443817
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 22:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhKBV5G (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 17:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36340 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229525AbhKBV5F (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 17:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635890069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hg5IlXIOXeJO1187/xa1gkBUxwPjbWmgH/vnUofDkGQ=;
        b=Ex7kuJHcN6m723C02dR7Z3h+UrqT8Asaz1mL4rMj8TGg65kI0OM6s0tqaRVcUUfAbPdKhk
        Jo4G9BaeGMZw1NkjT88yROcb3Pv/INB77jBvadvOPLo0kxfzI6Ov4uSoaAZUYgG3DrZOzF
        1pYzh8m+vkipsXi0sOV+8s2888NhEuk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-tQtMiuemO6-SkXF0kXCKRA-1; Tue, 02 Nov 2021 17:54:28 -0400
X-MC-Unique: tQtMiuemO6-SkXF0kXCKRA-1
Received: by mail-ed1-f72.google.com with SMTP id m8-20020a056402510800b003e29de5badbso643926edd.18
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Nov 2021 14:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=hg5IlXIOXeJO1187/xa1gkBUxwPjbWmgH/vnUofDkGQ=;
        b=nCFo2259wfp89aRG5WxbGA/qseBoUaxrIUNb0uJ355ZvPuTT5SAvN3z27SzULW4yeK
         TUUJdwMUyASuJBupJ0qafdEY0DAjrIYnkjtz/tOLblr2efq+SgkB+xjb/KCR7K0d67iA
         C93KfQx6w3jw1pMc3a141EL/jYgRBXHN7Ql5YWB484us46XSwVaM9QL9VSGPf5ngAl63
         jrK1pEP1AwsxDNp1k4IFucC7B6DfmNCaMi0xetw32XUgnhLcHpf5LFkUits8fOEiSN/g
         61RnKnDQPXtDqcbNCvKfyjgvknAXbtXnCk0ykhC3WXRWcsmhT2fKnC7/wby1/7wyuNnQ
         6aSg==
X-Gm-Message-State: AOAM531PkzlGcc5LZz2xE58zdsgjqCIiUrgOO3486BgFbl1M8MyulMY0
        9/bLKWvqdv0h6bbJv8jepuITAV/Ky64QX0VcjgaNrVX5tEB9I5e11NsONS01gOe99+CzlWlw/T4
        zxCdhCRo57dELP6AnybP+uVU=
X-Received: by 2002:a05:6402:40cd:: with SMTP id z13mr52705054edb.220.1635890066085;
        Tue, 02 Nov 2021 14:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoArJc5PJyFmrgP5x9ehQ8UaYai5yJ4ikd16u/rcYfqTGV7+IQpwGsj/N6mh6nOl5pALWDfQ==
X-Received: by 2002:a05:6402:40cd:: with SMTP id z13mr52704835edb.220.1635890063645;
        Tue, 02 Nov 2021 14:54:23 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id z2sm99880ejb.41.2021.11.02.14.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 14:54:23 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 626FE180249; Tue,  2 Nov 2021 22:54:21 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: RPM for the kernel samples?
In-Reply-To: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 02 Nov 2021 22:54:21 +0100
Message-ID: <87lf265ilu.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jesse Brandeburg <jesse.brandeburg@intel.com> writes:

> Hi there, does anyone here know if the samples/bpf directory from the 
> kernel is built as a part of an RPM from fedora or RHEL/Centos?

It's certainly possible to build it from the existing kernel .spec file:

https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_1046

I know we have this available as an internal package for RHEL, but I
don't think we ship it anywhere. And it seems like the flag is turned
off for Fedora as well.

What do you need it for? Opening an issue asking for it to be built for
Fedora might be a good start; feel free to Cc me on that as well :)

-Toke

