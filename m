Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C71D846D
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 May 2020 20:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732490AbgERSCR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 18 May 2020 14:02:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24716 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731181AbgERSCQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 18 May 2020 14:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589824934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YWsnl4IY0e1jB9VkIGxF4j2ofW7aeycItCRFtD3Fd3k=;
        b=JcVwy8qwHrkpaAKR2gNljoVTBrgbS3gYmUbf7Nj7vQ7zGbBNflK3j+Ih1gJpAZ4JLoNadm
        0b3SMDAA7APCYrjvZkJRkGbFKcVoObx7zvTne0k2+nF6YqPGEPUvQ6MVFljP5xu4WVtvN/
        83y+X9eGdMpmeaPjVdz3BqNq8DZhg4g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-15l7TxenN0-zwCNzf8ziRw-1; Mon, 18 May 2020 14:02:12 -0400
X-MC-Unique: 15l7TxenN0-zwCNzf8ziRw-1
Received: by mail-lf1-f71.google.com with SMTP id r143so3906721lff.13
        for <xdp-newbies@vger.kernel.org>; Mon, 18 May 2020 11:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=YWsnl4IY0e1jB9VkIGxF4j2ofW7aeycItCRFtD3Fd3k=;
        b=WnQl1yYn2U5/kaX1dVnvVbTRIEE8h33xYx6xr3p0LAkazIHnezQu79emYGezWZyEqZ
         VZgM7XYvRpJSzFj8HqdDr6T4cJfl6sDYl0dNQlULdRwZxySr9M+52fTSnuLMjzKLKwxv
         QJb02vu2UeP/J6wyO1Izj+Hky9Z3+j9IcHueiEYKRKG+0ar7qjPP0/MpvNNOs9CWpCq/
         57K3AXnqXbqhS7ByAXAKtxkn2kRKLfWIze3zfl9OWFm9ulDSPr0mKN21P/ZAtB0I1Sji
         HWQ1iiJHPJM73Wq/98ED3C2AfqHgWNr8vvpNnk+lH6dCmQ0HoHOOIhOudotDGwTgbDeT
         VlVw==
X-Gm-Message-State: AOAM5336Qk6hsdE+ZnFPfexsHHkcvMshDIBld92OY4E1q+BWTQL+aKFQ
        f8csA13CRwqYoC0/bXGIwErFgIL7wxhdmxBzY/ilbf5q0QCQ/d2ERwAG0J0il3raGK4oQwZkZqS
        9YEu4ZuwZ7eoGyrzP6TOgmgk=
X-Received: by 2002:a2e:9ada:: with SMTP id p26mr11623265ljj.14.1589824930229;
        Mon, 18 May 2020 11:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbd0sn5Ev8zaAXRshv3R8fGFiwP4HXVCqMjTaaZT8pwTP3tEp2aUssvQCcN+KT0mGJOpr1fA==
X-Received: by 2002:a2e:9ada:: with SMTP id p26mr11623256ljj.14.1589824929987;
        Mon, 18 May 2020 11:02:09 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id u8sm7533039lff.38.2020.05.18.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:02:09 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id BEB08181510; Mon, 18 May 2020 20:02:08 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Main\, George" <mainge@rose-hulman.edu>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: XDP_PASS and XDP_REDIRECT
In-Reply-To: <DM6PR18MB2475DD12FB5A8D747CA6ABEF9CB80@DM6PR18MB2475.namprd18.prod.outlook.com>
References: <DM6PR18MB2475DD12FB5A8D747CA6ABEF9CB80@DM6PR18MB2475.namprd18.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 18 May 2020 20:02:08 +0200
Message-ID: <87eerhnmu7.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Main, George" <mainge@rose-hulman.edu> writes:

> Hello All,
>
> I am working on an XDP Content Based Router project. The basic concept
> is that a machine running an XDP program acts as a gateway and accepts
> TCP connections from outside machines. Upon receiving a message it
> converts the packet to UDP and uses bpf_redirect_map to send the
> packet out through another interface.
>
> The problem I am encountering is that I want to be able to pass the
> message to userspace (where the TCP server resides) using XDP_PASS in
> addition to the redirect. I'm somewhat looking for a way to emulate
> the functionality of bpf_clone_redirect, but with support for XDP
> driver mode.
>
> Is this even possible right now? Are there any workarounds?

I am not sure I quite understand what it is you're trying to do, but no,
there is currently no way to get more than a single action for the same
packet.

-Toke

