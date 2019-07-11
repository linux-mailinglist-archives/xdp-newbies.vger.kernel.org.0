Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A356B66158
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jul 2019 23:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbfGKVnN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jul 2019 17:43:13 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:38673 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGKVnN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jul 2019 17:43:13 -0400
Received: by mail-ed1-f42.google.com with SMTP id r12so7323484edo.5
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jul 2019 14:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to;
        bh=DRCn8H8kLeTyMi4eunBj8o1tDca9BKTt6tZHu0klNH0=;
        b=iHE33qCgFf/nX1pnt2acLm8l27L8l7yhKKjw7+mlvtX18ZObxW+/Q7EYRx9FsHaTIn
         29mhWZvyitCJoGH4Y6LTbiC/RRgb1K1mtsIphwriggJUHQzj9wTfTVNvwIyp27+FUdRR
         87Rkhv/to2Flbkh2TLcsLTy+1ZgVDfK1xRrTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DRCn8H8kLeTyMi4eunBj8o1tDca9BKTt6tZHu0klNH0=;
        b=Azh9Rc1WgXOXvnw8hQcyHeIRoUTVA9C26ZISjy/rVNeUz8212EOaMm/hKlLix+7sdR
         Sx638AUKFQMOx+tjJfjuMx0ZkHQHQQUUF4st539cs87II5+uK9HFZJOJLBnVFKoKGiX4
         WBxhYJEzPb0fyQwpPpv3XIpx7pebZAaBXvQCe6ozM/ft2kb6ncRkaWl9uvh352jPBzub
         wq4r2RMMHZGzq1acPu0qupXDc8VbjlIyakZLcuJ8XACE0XNtLRd7Pwlq/QDZzpEO7GGc
         +UPqMfpIQOvKgUscdk5KErMeRIKGOE/m5SSbJdk8JoCgtrZK/GPBYQ1EI5e9x+pZqwif
         nbyg==
X-Gm-Message-State: APjAAAVd1jtzl8X6kBYzvMG30E+/OUjhdzsV5WjQncoMjvm4uQErg/pr
        DOYHcfR8DzWEavOP3p3AAKnnHntAZ2njWpLWWLutCtHPMmk=
X-Google-Smtp-Source: APXvYqzHVaqFtEELwJM3xmjcWyAKmmDe7EYVKVUQh68jZH1r36bBModVHKeIPo9YMrviX6RND02FWUn9tUrvQBNpYX0=
X-Received: by 2002:a17:906:1845:: with SMTP id w5mr5413227eje.0.1562881392054;
 Thu, 11 Jul 2019 14:43:12 -0700 (PDT)
MIME-Version: 1.0
From:   Cody Haas <chaas@riotgames.com>
Date:   Thu, 11 Jul 2019 14:43:01 -0700
Message-ID: <CAH7f-UJUTUT0YKYVMCjNaQzwN3=sFh62Bx7sBO85XyjuNyy4Fg@mail.gmail.com>
Subject: x710 Checksum Offloading with XDP
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey,

Trying to utilize TX checksum offloading while running an XDP
application; We're running on Fedora 28, using Intel x710 Network
Adapters in unison with the Intel i40e drivers and we've verified that
the Fedora sees that TX checksum offloading is enabled. On the
receiving side of an XDP_TX we don't see a proper checksum in the
transmitted packet. Is this due to XDP bypassing the Linux network
stack? If so, is there a way to have XDP instruct the driver to
conduct the TX checksum? Or is this intended behavior?

Thanks,
Cody
