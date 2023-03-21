Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791CE6C3883
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Mar 2023 18:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjCURoV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Mar 2023 13:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjCURoU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Mar 2023 13:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02922CC7C
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679420608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WSYqVcf8v8UF6iEMWsubL3bhTe66pfsDOh67crY2zGk=;
        b=Lg5dEhxq6bvPsg3Qhspt6DA8xOAa4Btb25ohdn5ZSKZwjKMuWXILz7zg9IPNbn0pepQ5XY
        m3HxVDlO6TnZOHkf6x3Hd17vh9a+lGM4UR96SnwCvilYxsDHAFr+/drUB//DNTOfvJDaXa
        pMdXhaj6XWIbknvdZpc73YCwKB/knlo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-tQ9w8iqZMP-SUUryL_122A-1; Tue, 21 Mar 2023 13:43:26 -0400
X-MC-Unique: tQ9w8iqZMP-SUUryL_122A-1
Received: by mail-ed1-f70.google.com with SMTP id j21-20020a508a95000000b004fd82403c91so22874523edj.3
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679420605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSYqVcf8v8UF6iEMWsubL3bhTe66pfsDOh67crY2zGk=;
        b=mN4LZB2MrtDCgFJwvoQMvwasCY8LG8LJpHWUyaSx95CRemDz4zPlcuMBtKgkkNd/ph
         SYsmqdzTmbV6ggcrmgWK1bjsMCj6zRWIdiawTNCGxeSisOEhI0o3AJnXlxe1wYf8o7GR
         8igDx0bSv/16WQ6cRfFWrFe1kihkpiFb3tYNJL8j9A8N245BpdTq7OKvJcaUspH4cLfy
         0pXmXibGyA0w69IsvSgsXqIkfPHdiSP2SKpDsf4xYdB0uXZiGVsWPANzbX+GrPkHhI2w
         UCHHqXLRp+XJkvBeqo18WmNCxxqGp7EdQ3dTb8CQvAr9UVyP31boOzjyNXdhfiP8gjKB
         Dsuw==
X-Gm-Message-State: AO0yUKVx3JHuPs+SsJwiUHtuWhdr9vEqRdI3B7Fh6lVTeMp9Rqgk086w
        5eqMxYsSHGUq8dmAtGQUjpY/LJOl6cFwvCJMsG66J/Njwjcxmjbk4qM8UvGxGxsQqNEpt3CDxjn
        huIYr1+3xe3zSyPo9XtwI1WI=
X-Received: by 2002:a17:907:761b:b0:878:711d:9310 with SMTP id jx27-20020a170907761b00b00878711d9310mr3404192ejc.1.1679420605214;
        Tue, 21 Mar 2023 10:43:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set/KtSnDKXFM55IYFKsWIjiQ0wy0uwYQjzEMy3rl5fev8AP3uH12IGDpnKSVr68wzifGxkad3g==
X-Received: by 2002:a17:907:761b:b0:878:711d:9310 with SMTP id jx27-20020a170907761b00b00878711d9310mr3404178ejc.1.1679420604832;
        Tue, 21 Mar 2023 10:43:24 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906c20800b0093a2160168esm973761ejz.35.2023.03.21.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:43:24 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 9AB839E34A0; Tue, 21 Mar 2023 18:43:23 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: How to get system localtime/wall time from eBPF?
In-Reply-To: <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com>
 <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
 <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 21 Mar 2023 18:43:23 +0100
Message-ID: <875yau80g4.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Vincent Li <vincent.mc.li@gmail.com> writes:

> On Mon, Mar 20, 2023 at 2:57=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
>>
>> On Mon, Mar 20, 2023 at 10:15=E2=80=AFAM Jesper Dangaard Brouer
>> <jbrouer@redhat.com> wrote:
>> >
>> >
>> > On 20/03/2023 16.33, Vincent Li wrote:
>> > >
>> > > if I have a XDP based firewall to block ip  access based on system
>> > > localtime/wall time, is it still impossible like what mentioned here
>> > > https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment-=
819419800?
>> > > If so, is there any way to workaround this?
>> >
>> > You could use the BPF-helper named: bpf_ktime_get_tai_ns()
>> >
>> > See man clock_gettime(2). It is the same as CLOCK_TAI, which is
>> > (currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock.
>> >
>
> sorry a follow-up question, the bpf_ktime_get_tai_ns will return time
> as nano seconds, right?
> I do not need the nanoseconds precision, I only need HH:MM like hours
> and minutes of the day, for example 10:30 =3D 10 * 60 + 30 is good
> enough,
>  any trick get that from bpf_ktime_get_tai_ns()

Populate the time at latest midnight from userspace when installing the
program and calculate offsets from that?

