Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B6EBF32D
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Sep 2019 14:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfIZMla (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Sep 2019 08:41:30 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44981 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfIZMla (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Sep 2019 08:41:30 -0400
Received: by mail-ua1-f65.google.com with SMTP id n2so699943ual.11
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4vYg3oEy3YGzXWMMf790TAzad+VbyNg5+Vfne4AN5d0=;
        b=fmjFLrX58pmHUduApcBclkavUERwx/IZlmflZvESOseEYoxSKUxLIYuVSeoMyXzS9r
         QlzwVR5oKlA9HFBkYp8NzvEEZp4Y2dXYyBl764tPvOKakDXJyH8TnisFNjH5vomW60gT
         VaFlyaO16+FdMfvhA9hR9v3XGzVaSs3c8H+66dv8gyvtdS6W1mPtDqQ61Jvh2pJ4flA2
         uB1Mc/HGA6HnJJVu1JO7PcDvmhAOiJzI9yYW/7ubq778GVFW26P11+oL+ijgOTDmkx5N
         TO8BCZDDxagXgxv+q/Jm+WYVH5k4TbuEa5FNgUPa5d2aMCPZFQwlUfOHFEKhTWEXSrwo
         6ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4vYg3oEy3YGzXWMMf790TAzad+VbyNg5+Vfne4AN5d0=;
        b=OLupiAKucHb61JdROHpLf6HyOcN1DgBJaSdWur8s4kf7sd+Ot1BxH8+bUbRoKf6Yzl
         FhoR0VmXu51dGuB1O1nyENJgxj+PBTJ8A/ZRjwgO43eX0eZgQN4qlbPqkQMlpX8zLLpd
         I6ejpS5wCHl+0vUe9grTY8uDo8AMHShuLrBR62NSDo/xocDIsN2iOF1T3iKbnAW80gF9
         DKohw6wztIBkQUkhz32D2d0JXOMuisGHpFGWT13FNs2xWcOKXAVFSToUAMBg4jzaR5nf
         jPgUkEYH6ipzI808b4ORzrJvV1WjV7XyoESbXBWlzssYg1Gci+WTBXw/eKhWm7Qkd3Dv
         lHVg==
X-Gm-Message-State: APjAAAXmShw9fO/H881n4obAgwUH7hTBCHrCTJ2FfT3eIO1QQRa5dXAr
        SgWfjSUmwp23x+Zbo3Nc4SDasgd3H2x+inEOFrA=
X-Google-Smtp-Source: APXvYqxJx1XelRphsKiHS1SChq5a8+WIi15sL7H1G8yY7S0bXvRLqXm2Lak1du0XSqVXns8jiyEbIUKxEanxnXh4dJ0=
X-Received: by 2002:ab0:4ea4:: with SMTP id l36mr1570216uah.37.1569501689246;
 Thu, 26 Sep 2019 05:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <0cbbc2e2-9eba-ad40-d819-d092b2015707@univ-lille.fr>
 <CAGn_ityTBjJ+erYRrvoFCCVYM9qwztg3tkmRuShs60xACQhvbQ@mail.gmail.com> <20190926123450.GA39817@C02YVCJELVCG>
In-Reply-To: <20190926123450.GA39817@C02YVCJELVCG>
From:   Anton Protopopov <aspsk2@gmail.com>
Date:   Thu, 26 Sep 2019 08:41:18 -0400
Message-ID: <CAGn_ityL9anR3BHKr_fZhV=Z-9KDtkrbH+TDAHKEtsM9w7Q48Q@mail.gmail.com>
Subject: Re: [xdp-tutorial] : permission denied when I try to execute a program
To:     Andy Gospodarek <andy@greyhouse.net>
Cc:     =?UTF-8?Q?Th=C3=A9o_Mainguet?= <theo.mainguet.etu@univ-lille.fr>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

=D1=87=D1=82, 26 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 08:34, Andy =
Gospodarek <andy@greyhouse.net>:
>
> On Thu, Sep 26, 2019 at 08:17:48AM -0400, Anton Protopopov wrote:
> > =D1=87=D1=82, 26 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 05:22, T=
h=C3=A9o Mainguet <theo.mainguet.etu@univ-lille.fr>:
> > >
> > > Hi,
> > >
> > >
> > > Thank you very much for your xdp tutorial. Currently, I try to write =
a
> > > simple xdp program to count the number of TCP and UDP packets I recei=
ve.
> > > For that, I created a BPF_MAP_TYPE_ARRAY map in my kern.c file. I can
> > > read into this map with the bpf_map_lookup_elem function but when I t=
ry
> > > to update a value, I have an error message "libbpf: load bpf program
> > > failed: Permission denied". To solve this issue, I've try to run it i=
n
> > > sudo, I've verify my kernel configuration (everything needed seems
> > > enable) ....
> >
> > What's the error message when you are trying to load your program with =
sudo?
>
> That information would be helpful as some distros will not run some of
> the sample BPF programs without some ulimit changes.  For example the
> command:
>
> # ulimit -l 1024
>
> or even
>
> # ulimit -l $VERY_LARGE_VALUE
>
> may be needed on Fedora or Ubuntu, but not on other distros.
>

Or even

# ulimit -l unlimited

:-)

Also this can be done from the loader itself, as, e.g., here:
https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/a=
f_xdp_user.c#L557
