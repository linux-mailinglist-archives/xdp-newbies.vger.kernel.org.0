Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADC821B44F
	for <lists+xdp-newbies@lfdr.de>; Fri, 10 Jul 2020 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgGJLzf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 10 Jul 2020 07:55:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59659 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726820AbgGJLze (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 10 Jul 2020 07:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594382133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lWcUS7/Jdvuidpb9zMcAh0QInQQG0m+Uk4yXib6bKO8=;
        b=Et/Zaf/mOVlaQhd+a1a0KP2kn9fM3UAMjIsqKqb3lk3T793ijlpqKZ+9wWjW+Zn7Bx/2jE
        PjEy06jdWzHGfxfi0ycKUjvDWgRkJueENClQ8tbZhzS/lxYjTt4jmX+NduQhRS/Hylxllb
        YzfCqBZeFk5adATCyLlU/DZ3kgjjKXk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-TX6eXeLVO8Gnr0RlxqfTTA-1; Fri, 10 Jul 2020 07:55:31 -0400
X-MC-Unique: TX6eXeLVO8Gnr0RlxqfTTA-1
Received: by mail-pj1-f69.google.com with SMTP id gp8so3960000pjb.9
        for <xdp-newbies@vger.kernel.org>; Fri, 10 Jul 2020 04:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=lWcUS7/Jdvuidpb9zMcAh0QInQQG0m+Uk4yXib6bKO8=;
        b=mg/5Qhn2xeVLoJFZSTa6QV4VbrXufYvL5/18hfE0AvSnlz9DcV87RteMfm6ODM2Spn
         qryiNJsTS/5U3pDjuhZRXLZmb8TaG3ZLwjHfTWiPH77w92gyznU9oMkL9bMf6MOTB89g
         07T2UPI0sPgB1R+UbGns75ZHXGEyCyaFnm7lR57xF11U8fWPu1d3YuXo80vk3koIXUK9
         Ud1rrsSyVDmZIEBXWq24H2y7DHDfhJIlyFZBorNAMTD1aynE+Mc2uADKDMF7r/HSAvW4
         ziwdhZZZr4JKsgcbum/hd67O76uni4LSuYmx9jkxW2cEeVCqY8c3E3q3vNALyDprk8Yt
         LI1w==
X-Gm-Message-State: AOAM5316wWZ45uq3hh09BVeFllMmeA2fJTXf7TU7Rb4t0L/pWqz70v6I
        QYv2l+9PJqryQpc/KlE4bB54IvUijdAHJnqxk7i5HRbTLMYDk/5oa7CHtbbF3j0MemEZ+Br4Gph
        F6rb4lPMhHGX5+7bXK7Zp09o=
X-Received: by 2002:a63:d911:: with SMTP id r17mr56113126pgg.202.1594382130838;
        Fri, 10 Jul 2020 04:55:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYE43QTKnaKucai93EG0wce54drshO4iDApEhNE9OfQy1NqiG+E0jKHdkIzcRY4vkJx4IkWw==
X-Received: by 2002:a63:d911:: with SMTP id r17mr56113109pgg.202.1594382130574;
        Fri, 10 Jul 2020 04:55:30 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id r191sm5708085pfr.181.2020.07.10.04.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 04:55:29 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0450C1808CD; Fri, 10 Jul 2020 13:55:24 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Cameron Boness <xdevps3@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: TCP Payload
In-Reply-To: <449BEAB8-F4ED-489D-BF59-8993637268DB@gmail.com>
References: <449BEAB8-F4ED-489D-BF59-8993637268DB@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 10 Jul 2020 13:55:23 +0200
Message-ID: <87o8onk2j8.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Cameron Boness <xdevps3@gmail.com> writes:

> Hi,
>
> I want to be able to read the data being sent in TCP payloads using
> XDP (in c), but so far all I can read is a number of headers
> (eth->iph->tcp->dns). Is it possible to get the TCP payload (i.e.
> client sent data) from xdp_md at all? Been looking online for hours,
> doesn't seem like anyone who's done XDP that's posted about it has
> ever parsed such data, hoping it's possible :(

Could you please be a bit more specific about your problem? What,
exactly, have you tried, and what is the reason why it doesn't work?
Posting code samples and error messages may be helpful...

-Toke

