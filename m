Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FFA26C4C2
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Sep 2020 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIPP7W (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Sep 2020 11:59:22 -0400
Received: from mx0b-00169c01.pphosted.com ([67.231.156.123]:4254 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726381AbgIPP4a (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Sep 2020 11:56:30 -0400
Received: from pps.filterd (m0048188.ppops.net [127.0.0.1])
        by mx0b-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08GEnTWY028617
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:49:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : references : in-reply-to : from : date : message-id :
 subject : to : cc : content-type; s=PPS12012017;
 bh=NtwuLtPcR27zadjvH9zUlN5bYqWPZS9eDolkUxbpI44=;
 b=Phu5jl5j+INgTAwLzq95bzQV7q8PlHCfxWnVHKuPzoiwBWSkuA0XKjitV7Qf0JMB2v5K
 K0MtwE9Q9XP7B1umBE3gvdXaYjoc3xNFlpSjSE7ddfSmTgbOv0yRL5G66L6Sx75H5Q3T
 NLXWBT/4yeS9rV8W6f6uScVisvKOc7RAkOfhS95B8mrCtHn2+bBWuG91II5LBHrxCxk8
 LvnBS9i148ehFCePmExDSO90CHSR7Gosq36TCK698o6vmQEyGlwinOfF9G6fFFTEhZcK
 77YxNHHNhJ5MZKUimMgcW0Y2CguseG0bFJKcjdMIjNHR7PIO+ku4F5ljhfRzmEzMqCB9 aQ== 
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
        by mx0b-00169c01.pphosted.com with ESMTP id 33k5n2ttd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:49:44 -0700
Received: by mail-ua1-f70.google.com with SMTP id k6so845931uab.3
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NtwuLtPcR27zadjvH9zUlN5bYqWPZS9eDolkUxbpI44=;
        b=KoWOytqQx3wvxAV11EFuacaT8LKwHJ42uGvKXGg7LnKY4xZXaeTq2H/iTp7255DCz5
         l9fyFV+bi32ZJBxM1yq393dM84G5f1LQDfIC6QhmUKivDs9Dm9T0L0PjbU0TeDEfObGt
         Xpu7+Rpb21DV8I2GK2p9HhRnmc64llw+ShB7Zwea/0tCWq5JC3ehZEAM5bVwfAHVJqxm
         2Vr99LpKJ8jwBETuYMKFXLmTU7Obf+ARiNpPxRrfwEykB/P6MfllhfbTPFN5sswpvMo3
         /d3QBQhrbF+f9IQeolXUxOaKGfLZ0WyuVEwHFC2UP3E74FrBpd9oxQP8/DW3lyryFI7Q
         Cixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtwuLtPcR27zadjvH9zUlN5bYqWPZS9eDolkUxbpI44=;
        b=S8pE1GNAdHQvpR+0jaBOnHAAk+eYBEOvvsuT3+vd9JVWS5Tk6nZVOuMw27QETRl8Hp
         J/o4GitQncFUiDt5ibzUTxeLIjZVdqs3kC0hG2vDcoS/P/hP5rUV9KNMsIoHFtvTV7Un
         AyjLzCsAeAbdeZEXwv7W0xKAZyfJPTEyxaon8AAzsf8FQhYkWTKOXvqbLjB0u0Z0pY5P
         aYEW8XoWON31IYyIMJpP5yviFOcXVjpfbGf+vfJBynd5hFRAmuXkbEvMu4suwOFhwcpU
         FxT6zCcXcpfABi1cp6kzAgswvQJGJnt/hVGcT1XnPCkapuFgKAjMhFljRsmM9IiYhgGd
         2JrA==
X-Gm-Message-State: AOAM532TgSDqAXS7FchQA2Zi0hIqDk+/y2fkgAcBjnid61ty1Jxkmd+7
        tEWCPQNZCAcEBOBSGa1zi3PuNUfG2QoHMsMDlaI7L8mHu4gIn2vmVfu3JpZnWql1tQXt+Mw5WbK
        ZviI/Gq0T7+lTXJvTlI7Q3JHsVJGkVYej6dBC0UE=
X-Received: by 2002:a67:17c6:: with SMTP id 189mr5055422vsx.36.1600267783709;
        Wed, 16 Sep 2020 07:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWHhkh1yp8h0+lS6bE6sX3ZkTy8831V4DQm4nfd7Z+GsS9Qx+bct7Zx4ntNNh2RgcmERKEHFIqJqjaw5nqdQY=
X-Received: by 2002:a67:17c6:: with SMTP id 189mr5055390vsx.36.1600267783256;
 Wed, 16 Sep 2020 07:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
 <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com>
In-Reply-To: <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com>
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Wed, 16 Sep 2020 07:49:32 -0700
Message-ID: <CAHQoOTYi7Pfyoaxpz1a7hkPA7fEC6gPhdRgWz=6BOLuFHB4zVg@mail.gmail.com>
Subject: Re: Using pinned maps within a network namespace
To:     Y Song <ys114321@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-16_10:2020-09-16,2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 clxscore=1015
 adultscore=0 spamscore=0 suspectscore=1 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160112
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Song,

I think it is something to do with the namespace, when I run the same
code on the host os (not in a network namespace) it works fine and
creates the map and writes to it.

The error coming back from bpf_pin_obj is errno: No such file or directory

I can see /sys/fs/bpf in the namespace after I do.

$ mount --make-shared /sys/fs/bpf

but just cannot access it.

Thanks for the help

Regards

John

On Tue, Sep 15, 2020 at 10:12 PM Y Song <ys114321@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 11:46 AM John McDowall
> <jmcdowall@paloaltonetworks.com> wrote:
> >
> > Hi everyone,
> >
> > This may be a dumb question, I have set up a simple test environment
> > with multiple network namespaces running on a ubuntu 20.04 vagrant
> > box, with the latest github libbpf.
> >
> > I want to use a pinned map, I can make /sys/fs/bpf shared by:
> >
> > $ mount mount --make-shared /sys/fs/bpf
> > $ mount --bind /sys/fs/bpf /sys/fs/bpf
>
> Similar commands `mount --bind /sys/fs/bpf /sys/fs/bpf1` in the same namespace
> works fine.
>
> Maybe there are restrictions related to namespace? Maybe it becomes readonly?
> Could you print out the error code below?
>
> >
> > but when I try access the maps from a C program running in a namespace
> > using bpf I get
> >
> >  Access to /sys/fs/bpf/lwtconfig map failed obj_pin errno: No such
> > file or directory
> >
> > The code snippet is:
> >
> > mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
> >         if (mapfd < 0) {
> >             jed_info(jed_logfile,"Access to %s map failed obj_pin ",
> > CONFIG_MAP_PATH);
> >             pin_fd = bpf_obj_get(CONFIG_MAP_PATH);
> >             if (pin_fd < 0){
> >              jed_error(jed_logfile,"Access to %s map failed with
> > obj_get ", CONFIG_MAP_PATH);
> >             }
> >         }
> >
> > Is this possible, and if so what am I missing?
> >
> > Regards
> >
> > John
