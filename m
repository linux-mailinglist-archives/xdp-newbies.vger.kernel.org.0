Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C2A279464
	for <lists+xdp-newbies@lfdr.de>; Sat, 26 Sep 2020 00:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbgIYWzA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 25 Sep 2020 18:55:00 -0400
Received: from mx0b-00169c01.pphosted.com ([67.231.156.123]:14972 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727067AbgIYWy7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 25 Sep 2020 18:54:59 -0400
Received: from pps.filterd (m0048188.ppops.net [127.0.0.1])
        by mx0b-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08PMoYhe002225
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Sep 2020 15:54:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : references : in-reply-to : from : date : message-id :
 subject : to : cc : content-type; s=PPS12012017;
 bh=Kgw8s6tzMoUCJNpa60MMrzxq6+4FnNz1Jjq+WHccVNo=;
 b=BWYs86hpBvJzvwLv0AAOs0+5FZdw116ig5+xwv8bWlF2mxiTCYSR2fBeMkqbLN+rTR/6
 qNOSf7zPvHMr2sd1sf17EGgQJxrC1c56NcPyfe7KqJXGqobDQR3N/q3jdKGN8djrReZA
 Z/Hb7UxOUhyNw0mPUuoeWvWF6G4m2yZG6FxerSc1IxqaSZzp6GqeE7d4+S7jobjQH2os
 KfwvwYaugdHIOSh4UK+VihLOwmLqZxMV/9TqFZkABpT73+0IDj28lCO6X9sHi2aCyu0k
 5p4seM7NRQCzVeF5p8GUj6Nnc/J8vjTATdVtDkGO2KXXwHeJcU2U6otRbjEuzdGcLKGt /Q== 
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
        by mx0b-00169c01.pphosted.com with ESMTP id 33ndna9wmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Sep 2020 15:54:58 -0700
Received: by mail-vs1-f69.google.com with SMTP id k190so1228267vsk.17
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Sep 2020 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kgw8s6tzMoUCJNpa60MMrzxq6+4FnNz1Jjq+WHccVNo=;
        b=I5vwnzjIyHx+RF5GjgkYywvzwtJGAz5bhGRn6aG4syW3zlmqlohFsoIS5Czwr0KKjP
         TuDPV2XuTKrYakLD4F+rC13aUs9JkHixS4IKmEMdl9/PhIimsVaKhXCrmdUBKBjLVYr2
         dzB4PN1w0MiEgVulJ0RDGq+gL/2D4X2H4uZfBjYaN1dX7p6BFppceUAV1udDgnhY/tVE
         Jc26a+murLp79zEiTZhDJjamF9h/Kf8C1EKtbwhyJwf1CrErbqRyAGp3Lm/oYup9okF4
         kA4gn8sq5tcvdCQT2PYB42XhOfnd3DbIYcSotTxNfZYxOfzBUyAX4ptxLfCoaFpZr9Wg
         Ksew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kgw8s6tzMoUCJNpa60MMrzxq6+4FnNz1Jjq+WHccVNo=;
        b=XBz56f5abfXMRNskQlAVt9bQamcBzNbWdJFJVf20xjmCu/76faQy8zwjJuH0lgepri
         nHeJSSSy4Nm1Dl1P+xaRm7i13wcfmzwU5yGOceLyzWLAI27PEzr0Vdi9yzfgT22ur84m
         b3pSyQktZ0Z/izEvsIp4TBmRH+LmUPgn5A6Uh6qL4Q74dFr9loiyrsQRIofo3KaexJZC
         bLYqPQHXBA5HRexHaFK9vJHE3cn03zdF25dL4hSO4iG0cbp2ydksVXxKqMT4aMiRKwj2
         Dlvml76zrI6NgLl9g6qjyFYv0jvN0fs5T3gJ8Ho2WHMRzJ5PkmYxyNQkQhFWnuncKj5k
         Hjpg==
X-Gm-Message-State: AOAM533A0Ap/PXvWTrM8OquTDEnJtLXeuTQVteehGu+63PR2waHha/PX
        5q+ODEp9kjRoL++1h8XpholsfZyQbCq9diuz/+U9JPRtUP/bNsOXT6RDBEfOsOFP67nE73yGA5V
        qbg2QiKsXdYvD+x1YQkGu8amdkv145+Wwmfoh+Z4=
X-Received: by 2002:a67:f803:: with SMTP id l3mr528131vso.45.1601074497332;
        Fri, 25 Sep 2020 15:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkBPwFoIJyG2kbalqkqJhAi7hhNx4WAECrJF7M18q8hBrrc3mEcgxLO0vY5MrgNgtQ31n3LeoPvLajWuZgxEM=
X-Received: by 2002:a67:f803:: with SMTP id l3mr528124vso.45.1601074496935;
 Fri, 25 Sep 2020 15:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
 <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com>
In-Reply-To: <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com>
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Fri, 25 Sep 2020 15:54:46 -0700
Message-ID: <CAHQoOTa2zd6zQ0h+YaGK7b_p=O5u9hN-H8SgKRp9yMVqPCjfOQ@mail.gmail.com>
Subject: Re: Using pinned maps within a network namespace
To:     Y Song <ys114321@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-25_19:2020-09-24,2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 suspectscore=1
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009250169
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Song,

You are right the issue is that in a new namespace /sys/fs/bpf is readonly.

On host system (Centos 8.2)

[jmcdowall@jed102 framework]$ ls -al /sys/fs
total 0
drwxr-xr-x.  9 root root   0 Jul 15 16:01 .
dr-xr-xr-x. 13 root root   0 Jul 15 16:02 ..
drwx-----T.  2 root root   0 Jul 15 16:01 bpf
drwxr-xr-x. 14 root root 360 Jul 15 16:01 cgroup
drwxr-xr-x.  4 root root   0 Jul 22 11:58 ext4
drwxr-xr-x.  3 root root   0 Jul 16 11:05 fuse
drwxr-x---.  2 root root   0 Jul 15 16:01 pstore
drwxr-xr-x.  7 root root   0 Jul 15 16:01 selinux
drwxr-xr-x.  5 root root   0 Jul 29 18:58 xfs
[jmcdowall@jed102 framework]$

Then create a network namespace

[jmcdowall@jed102 framework]$ sudo ip netns add test
[sudo] password for jmcdowall:
[jmcdowall@jed102 framework]$ sudo ip netns exec test ls -la /sys/fs
total 0
drwxr-xr-x.  9 root root 0 Sep 25 14:31 .
dr-xr-xr-x. 13 root root 0 Jul 15 16:02 ..
dr-xr-xr-x.  2 root root 0 Sep 25 14:31 bpf
dr-xr-xr-x.  2 root root 0 Sep 25 14:31 cgroup
drwxr-xr-x.  4 root root 0 Sep 25 14:31 ext4
drwxr-xr-x.  3 root root 0 Sep 25 14:31 fuse
dr-xr-xr-x.  2 root root 0 Sep 25 14:31 pstore
dr-xr-xr-x.  2 root root 0 Sep 25 14:31 selinux
drwxr-xr-x.  5 root root 0 Sep 25 14:31 xfs
[jmcdowall@jed102 framework]$

and the bpf directory is readonly.

There does not seem to be a way to make the directory writable.

Does anyone have any ideas?

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
