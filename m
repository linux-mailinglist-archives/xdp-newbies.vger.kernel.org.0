Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06135BF2C6
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Sep 2019 14:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfIZMSC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Sep 2019 08:18:02 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:33569 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfIZMSB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Sep 2019 08:18:01 -0400
Received: by mail-vs1-f42.google.com with SMTP id p13so1459615vso.0
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bXVf9RZ1GrmrnpD6Y7BTrJGa48Rnl1VXaQMaLdug/Ak=;
        b=hKwhcf8+4O2FDEkLrx1L/60SdSBa8P0bFcQtjQDeI8K4/yY/FtWaf8g2JYpwPZcIJx
         hFbk+wpPMel/VVoWEmQztsSpdBBPo9I6KWeol+2Y8jmYYW2G0s0a3S2XJfjJ8lmpTdjX
         PEnf9Nhrd1t4IBqbEEcNppt45Uv7oefhSwwXSJkCW49SZoKnrZI/Occj7dyasTQ4erC9
         tsDj68OQbmHQZmoOMCiBkkzMnutfR5rqNgmZytklD4EgezO0lypKQWChjBTeopnKhWAW
         dngYJ3qRhoXlNung1SUi2rbBPM6BtiP5trOAaAVhfx2dzkn5Nhi/BiyfKAxvQTm2iFc6
         zJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bXVf9RZ1GrmrnpD6Y7BTrJGa48Rnl1VXaQMaLdug/Ak=;
        b=ZUkrhrfWTAPdn5frWME4aPzh6Y2VxB80g16ENpCFYsZFSUaKkG5rgOWUceVJnlypWV
         gOYbAlebmy8DpAkYnof/GHfr8iD3pblTB98KWktaNRDp2cBSAbzWtKq1F1ejIi9/QZPV
         N97nNJlYmUGmOeGTiQ+3C5ESJEXL3WJ5F9yhkrgxuA6ytomUs+tJ+HI0yfHGS1Ora770
         hWfuHCbxLIK/nPTIN9iCv4Ew/vEsHCbharCYg9n1ZmBg5XTrJuKPcPDmVilTul0prnFh
         8tTo60d7NenWgMO0ljmYSBPFZgdac+mCLNW5crUmCdo/qKagfcocfOkW9IVlbDb2s3hA
         eTDg==
X-Gm-Message-State: APjAAAXqIm3I9FZM52FL0RZONsFE5lj0w4lfXWw0Z0GI91tZ4u/QBykQ
        P7RnYKG/mgX0O/WTgya8T3NLAw4l2qyvVemHchY=
X-Google-Smtp-Source: APXvYqww5mX984U8N+KiowGEm1qvPD2Zop6OPbGU4s6jRWIWRZOH0Pwi+qRjCa5igwvX69ZwX+5Lq0s22QptBrnvbkM=
X-Received: by 2002:a67:6147:: with SMTP id v68mr1559801vsb.233.1569500279512;
 Thu, 26 Sep 2019 05:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <0cbbc2e2-9eba-ad40-d819-d092b2015707@univ-lille.fr>
In-Reply-To: <0cbbc2e2-9eba-ad40-d819-d092b2015707@univ-lille.fr>
From:   Anton Protopopov <aspsk2@gmail.com>
Date:   Thu, 26 Sep 2019 08:17:48 -0400
Message-ID: <CAGn_ityTBjJ+erYRrvoFCCVYM9qwztg3tkmRuShs60xACQhvbQ@mail.gmail.com>
Subject: Re: [xdp-tutorial] : permission denied when I try to execute a program
To:     =?UTF-8?Q?Th=C3=A9o_Mainguet?= <theo.mainguet.etu@univ-lille.fr>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

=D1=87=D1=82, 26 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 05:22, Th=C3=
=A9o Mainguet <theo.mainguet.etu@univ-lille.fr>:
>
> Hi,
>
>
> Thank you very much for your xdp tutorial. Currently, I try to write a
> simple xdp program to count the number of TCP and UDP packets I receive.
> For that, I created a BPF_MAP_TYPE_ARRAY map in my kern.c file. I can
> read into this map with the bpf_map_lookup_elem function but when I try
> to update a value, I have an error message "libbpf: load bpf program
> failed: Permission denied". To solve this issue, I've try to run it in
> sudo, I've verify my kernel configuration (everything needed seems
> enable) ....

What's the error message when you are trying to load your program with sudo=
?
