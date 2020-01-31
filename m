Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C8714E6FA
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 Jan 2020 03:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgAaCQJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Jan 2020 21:16:09 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:44512 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbgAaCQJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Jan 2020 21:16:09 -0500
Received: by mail-oi1-f181.google.com with SMTP id d62so5751135oia.11
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jan 2020 18:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=I6Aos7IIEtPLI0JN4sWNjhZ+s33J5x0K+zlRm4rQrxk=;
        b=aUtSW1so1V2X6UN3Cbgwfuj2rMwuf7xjrus6AppeDebEd0eUe0qDMd6sOuZVM9ilVx
         T93l7H3DZR/GUdfnewU1rdVMMWAPeQqrR7HYUcTjhTu8qZcqCKUYX0Cb4XVr1lZDC9wB
         9i/tWG43EiABB4zK2Q4fUiIbZ2XHi4NEplNGmSQZ2dWPls7djpX1Ji17/m3DMio/W3E2
         41q/Ig/58nO82xd1n+OJxK+zbdNakG/jci8wwZqiYMEgp9RpvxJlWzsLrSWTerow6dQM
         4jEW2joiCzvSTk5GunplppmHEGMmjFZ8Dht5G1SgEQyIaBEX554Qb7ETs8o+DB+2NWCC
         2xAQ==
X-Gm-Message-State: APjAAAU7pJnMi99/XsDE0Pg4MF4yumKbiBK+wwYfV40qjFFeRgoJMhJu
        1+Zud9cYkrSjJHz67EuU7BeNxKJ6T0GOG9+Z1Wdle4g9hK0=
X-Google-Smtp-Source: APXvYqwyelNqiqcBj8sOymSNQfVScrJzP9XC+BaYyQK6QdhKZuDqK/AqjDRJgu2DC54IwYYVRQBwPxsGE9jWO+xVsd0=
X-Received: by 2002:aca:5746:: with SMTP id l67mr5099298oib.60.1580436967917;
 Thu, 30 Jan 2020 18:16:07 -0800 (PST)
MIME-Version: 1.0
From:   Cameron Elliott <cameron@cameronelliott.com>
Date:   Thu, 30 Jan 2020 18:15:55 -0800
Message-ID: <CAMyc9bXvhK2a-m9KEj34rnc3EBM4mgFicdfvRWay=cwuNVDg8g@mail.gmail.com>
Subject: Cannot run multiple 'xdpsock' concurrently?
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello, I am trying to measure the maximum mpps I can push using AF_XDP
on a 40G X710

I can do ~22 mpps after resolving a few bumbles I made with drivers,
etc., (Thanks Magnus!)
when using a single instance of 'xdpsock'


Apparently the way to upto 50, 60 or 70? mpps is to use multiple cores...
And apparently the simple way to do that, is multiple instances of
xdpsock on different queues.

But, my attempts with multiple instances fail. :(



First, I checked my channel setup:

$ sudo ethtool --set-channels enp1s0f0
no channel parameters changed.
current values: rx 0 tx 0 other 1 combined 4

I presume that is okay...

Then I run these two commands in two different windows:

sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 0
sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 1

With the only difference being the queue id.

The first will start and show ~22 mpps tx rate.
When I start the second, both instances die:

The first instace dies with:
/home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno:
100/"Network is down"

The second instance dies with:
/home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno: 6/"No
such device or address"


Do I understand correctly I should be able to run two instances like
this concurrently?



Thank you for any ideas, input.



# ethtool dump / i40e driver from recent bpf-next clone
c@lumen ~> ethtool -i enp1s0f0
driver: i40e
version: 2.8.20-k
firmware-version: 7.10 0x80006456 1.2527.0
expansion-rom-version:
bus-info: 0000:01:00.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes
