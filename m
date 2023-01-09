Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48611662701
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Jan 2023 14:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjAIN2L (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 9 Jan 2023 08:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjAIN1y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 9 Jan 2023 08:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D122619A
        for <xdp-newbies@vger.kernel.org>; Mon,  9 Jan 2023 05:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673270829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cR7bukxpmET8y11I46SnW3irK3l2FCevLb2PqjglmKg=;
        b=TeIJn+5R7HJht+GxcMqM3Dxor1W7ZDRXA6SpIvBPXOkBF5t7gRlRKYSsSsNfpxOLl0gSJC
        OYpiur19szyd8tVkjRZahx/jZZnkhlNeqxCxE6qRwRiFgK7ds8/RcpZ9eHideFi7VnrZNg
        nazY8xc1LCob/fbq1eR30FpwKFJem5c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-ZAYTSI4IM3KuwG164LfDyw-1; Mon, 09 Jan 2023 08:27:08 -0500
X-MC-Unique: ZAYTSI4IM3KuwG164LfDyw-1
Received: by mail-ed1-f70.google.com with SMTP id l17-20020a056402255100b00472d2ff0e59so5238443edb.19
        for <xdp-newbies@vger.kernel.org>; Mon, 09 Jan 2023 05:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cR7bukxpmET8y11I46SnW3irK3l2FCevLb2PqjglmKg=;
        b=QWJhHAAiM31n9t5kMIutG8G4ji3yfD/7jrfI4vZmI2oao29R3W2cWQFVOXxbGINLEK
         zcBc3xF27lgU5ZBs4x/YhwZaNu/YjrdrmoE4JYy5k6d7fpa9vmiDiBhd1KOinTIq16eB
         B37jhIoGfPf3kPRwZ38BZEbS35nlI5vFOCYiGYF4X3eVq1AJDRAdkKRBITUK7fOsZchT
         pY5zuNOuab/1/jVJhd7KWeSY4tafJAbsn1tfSisEfeMnr9fTdqDmQBirrAhgUq+WpMNK
         Qbuot5jSPzKrzoGFvJ9PQR1EyU0I9klGnwTo2uz5YzBjYqIOK+wUhbHOJh+Yi1wZIx4D
         IsZA==
X-Gm-Message-State: AFqh2ko+shb3PiKbBprG38fgNbTjFBBHe1FJ13mZj/8QMjgAzyEiz9Q4
        a4dVS0zsCwZWppwhduS2KbreNS/1lJPg8s00yF011yF1/NTCDoizjXYuAaQgaIKC0/PZkB2dhWL
        BTiiIDM5O9yKqkkVKIiWQrd8=
X-Received: by 2002:a05:6402:3712:b0:499:70a8:f918 with SMTP id ek18-20020a056402371200b0049970a8f918mr4061897edb.16.1673270827129;
        Mon, 09 Jan 2023 05:27:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt4Xm/haG9vDz20eBvaFVOhCax9Hh5VOJ0QtN7CQ4o80cDr+CBF/qQhYJ8NZvGNo1SCxMs8lQ==
X-Received: by 2002:a05:6402:3712:b0:499:70a8:f918 with SMTP id ek18-20020a056402371200b0049970a8f918mr4061858edb.16.1673270826282;
        Mon, 09 Jan 2023 05:27:06 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id y5-20020aa7ccc5000000b00463bc1ddc76sm3735700edt.28.2023.01.09.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:27:05 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 26D0E900178; Mon,  9 Jan 2023 14:27:05 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Pause and unpause queue
In-Reply-To: <CAOLRUnDSXNhGFA_Sv=khfQnXE4CZi1jc2JeUgK_FxQTTTwLSoA@mail.gmail.com>
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
 <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
 <CAA93jw5EJ7OEo9hDJNWn8nLQhO+WezDs-rf+V0mOqUZ8ExAuLQ@mail.gmail.com>
 <87cz7qyycn.fsf@toke.dk>
 <CAOLRUnDSXNhGFA_Sv=khfQnXE4CZi1jc2JeUgK_FxQTTTwLSoA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 09 Jan 2023 14:27:05 +0100
Message-ID: <87ilhfalee.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

team lnx <teamlnxi8@gmail.com> writes:

> Thanks Toke and Dave for the response with explanation and knowledge
> which explains that its work in progress !!
>
> Thanks !

You're welcome! :)

-Toke

