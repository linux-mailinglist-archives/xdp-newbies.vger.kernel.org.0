Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D117C885C
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2019 14:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJBMZx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 2 Oct 2019 08:25:53 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39817 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfJBMZx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 2 Oct 2019 08:25:53 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so56412963ioc.6
        for <xdp-newbies@vger.kernel.org>; Wed, 02 Oct 2019 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R4r50NfgqdiTHltRmKljJWOjYztqV7sUGzNbN8Vfh0k=;
        b=aYbE4nTtoSnPHLnpj4oMdRtzo6TxZCQ90XybVAV13qtmxQKVyWTOTNQtwQFreOHqy4
         VS33U2G/kh1sQHrVfR+uRW6XrnEqIj+GvUD2UgWwPKOiE4RY+Z8HVxcHWpa/QamF6ihG
         QdOIiD25u1McWHgCXZ02NbbObKqsRzS7zqtvw2KDzcx8nE07EoCONH1QdExZDREOIaZr
         1Ic0urFougZ9qaq9BlyG9dW5AoclruOhq3GJJlXK1/9o94JwWx6Ptw50K2QXErd1u5Sx
         U+29mzLPcDw+zbwogNCS/Dl91NK/L5LerV7mIiy9F9ze0Q4fM4tiGTmZ8nhWV++N7yFd
         ZDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R4r50NfgqdiTHltRmKljJWOjYztqV7sUGzNbN8Vfh0k=;
        b=s9ZGzKII7F6y7PcBUEURnTu4/jMlP9S97erOUyV1ceKpczmXvgwh3Uq+NsxbyVwQ12
         HWYSYe4zQ2zdUajoo9wPLYWhPpjI4VDAl1eRDl+2Qs6WCPJ5RgODKSGhOEvk2p5Jur3A
         Qt98Et95K6o6vL4g7JNnVIjdkE3v3wn1M9jXjvCjPE9O988olNkB7IwPFePl9atSxtYB
         XYz/FyE/muRvjvg/N9IT9GRVo++2DQkuFj4NA1Sv3BWWuo1AFr7lr/gSf8qBfPBuEhFf
         bqtZnWXg0+gi2koVLwEyN/j3ESEI5TEGEGjg2d1XMkQO6SQ0ZcTQC8CMhgDKhN1PFylo
         IM6A==
X-Gm-Message-State: APjAAAVq0d43sKUNKekXGrAzRzM8YY7tTDgF5cdU9HxI/Em8YVRiaIyL
        vnXiAZ45dJgZXIWaYbpnU+uWgxGOgn5NeJoheFc=
X-Google-Smtp-Source: APXvYqx8Ok98HBYZgkKh1cAhQhzxWxtN7e/cIlTLr24yF8/kXHyvF8cjefmh3UtvycYFHZrO2i2oskWPG0bymVtcbE0=
X-Received: by 2002:a6b:6514:: with SMTP id z20mr3027385iob.50.1570019151103;
 Wed, 02 Oct 2019 05:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
In-Reply-To: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
From:   Pavel Popa <pashinho1990@gmail.com>
Date:   Wed, 2 Oct 2019 14:25:39 +0200
Message-ID: <CAHOxX0ykVVTPopnSwnzL75RLj4-dnFWttdw0zS7jYe6Z4HcF2g@mail.gmail.com>
Subject: Re: xdpsock problem testing multiple queues
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I don't think vmxnet3 has XDP driver support atm, thus just generic
(i.e. skb) mode. Anyone confirming?


Il giorno mer 2 ott 2019 alle ore 14:11 J=C3=BAlius Milan
<Julius.Milan@pantheon.tech> ha scritto:
>
> Hi all
>
> We are trying to test multiple RX queues with sample program xdpsock from=
 kernel on vmware virtual machine with 2 queues.
> The driver on the NIC is:
> # ethtool -i ens192
> driver: vmxnet3
> version: 1.4.16.0-k-NAPI
>
> NIC has 2 queues, I can check it by ethtool -S.
>
> But when I try to use queue 1, I am getting following:
> # ./xdpsock -i ens192 -q 1
> /home/jmilan/ws/pt-xdp/linux/samples/bpf/xdpsock_user.c:xsk_configure_soc=
ket:315: errno: 1/"Operation not permitted"
>
> Any ideas what the problem could be? Maybe vmxnet3 driver does not suppor=
t some necessary operations related to queues?
>
> Best Regards
> J=C3=BAlius
