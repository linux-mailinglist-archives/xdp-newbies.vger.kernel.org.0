Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B64AA13D025
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 23:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgAOWbx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 17:31:53 -0500
Received: from mail-ed1-f45.google.com ([209.85.208.45]:35739 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgAOWbw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 17:31:52 -0500
Received: by mail-ed1-f45.google.com with SMTP id f8so17074838edv.2
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZHsmIUidVNuC7DmR8G+ZRfXhJpH5PelD+kFafck4tok=;
        b=ORYIl4zCR+zPyWWliXbY+xj5Vh17X9TBxHKH6SXw49Ad6GTxsPOlx4audAOnwUOM1I
         nlczgioPZxOtlXWbE6GFRPeOnxbFFCNNgRgdFrBMAJSOHBAbu94OdB8lFBxvK6YQJYz2
         PrNOhgKhWaxi4LuPWCMWrpDqcqw4Dm2KN0oIet750EGNUUdrAMAWPWRfeJj5UrTZDBWn
         JwBAFzUaw//pKqd7xCry7+IdzZjnyQwsvhtS2cshHoo/US7VGUSo3itWrHPZ8AtCLa3h
         tvCFAaSRBU1vO2jrqWxKRzAbGZAod58UiLgW+6PVIRMtmgevWH+cztACw1KuX71FmSQf
         7gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZHsmIUidVNuC7DmR8G+ZRfXhJpH5PelD+kFafck4tok=;
        b=j6rab7YrihCKmz4nq8bkx/G4QW698SaCOjX5q/GzTY/DBz/sWSr/in4gG6dOqc1NVb
         E613FnLZsFLu7yqTGQKGKhfy3PQ0c/aqrJx6br6iZv95obP5IhO5ldHRMTGgFiHFt26c
         6u6Lq1T0lOpqBm7cAKXZuRlqGozwF33LNYLsW/oVuyRzSDOc9tY/5ofP1p9qLxVafboE
         ZBozZEu6bKooFQ0gw65U/BBEKE54pHwmfSWNnVBFvjrEv2dCX5YwKINEbfuDw8cK1RY5
         aGVXmaUK29nWeFoUo/5TU6QnJ6ZuysnOFIHw8ZH9CIPCj1P0TMCsFr3xI5/MuX9rzk8D
         1pOw==
X-Gm-Message-State: APjAAAXMjE4+2jGHQY/hgpqGpqWxx4732uxnOVlRC19tzw5TIM1tNHyb
        KCOIJXzBNOEvuzB2xYMMrkoPcjTvzyB/JOYKzTtAsN83
X-Google-Smtp-Source: APXvYqwZU7QKdb9h9myAuBQQ+uhcMgtXKWkOyj1zYU+ONcxiLxVpF3/FAANn98NcAu4JMVcwqE1VN2J2wnM8f35y9ko=
X-Received: by 2002:a05:6402:1742:: with SMTP id v2mr33445302edx.171.1579127510727;
 Wed, 15 Jan 2020 14:31:50 -0800 (PST)
MIME-Version: 1.0
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <87ftggtl7t.fsf@toke.dk>
In-Reply-To: <87ftggtl7t.fsf@toke.dk>
From:   Vincent Li <mchun.li@gmail.com>
Date:   Wed, 15 Jan 2020 14:31:39 -0800
Message-ID: <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
Subject: Re: XDP invalid memory access
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 15, 2020 at 2:21 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:

> You have to check that you're not reading out of bounds before
> dereferencing the bytes in the TCP header...
>

I have below before the optlen

   47 /* sanity check needed by the eBPF verifier */

    48 if ((void *)(tcphdr + 1) > data_end)

    49 return 0;

this is not enough, how do I check the out of bounds properly?

Regards,

Vincent
