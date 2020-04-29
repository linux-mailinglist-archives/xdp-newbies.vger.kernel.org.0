Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E8F1BD16D
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Apr 2020 02:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgD2Awm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Apr 2020 20:52:42 -0400
Received: from mx0a-00169c01.pphosted.com ([67.231.148.124]:52902 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726381AbgD2Awm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Apr 2020 20:52:42 -0400
Received: from pps.filterd (m0048493.ppops.net [127.0.0.1])
        by mx0a-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03T0lZ6t014225
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 17:52:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : references : in-reply-to : from : date : message-id :
 subject : to : cc : content-type; s=PPS12012017;
 bh=5f8gCOzWgbiEHKAONZ11mC0mqNpqUEA5pir91gmiYj8=;
 b=k3q2aDz0dGgAzPbZigTu6KGrwwxO/7NS3OSaQ/ZnJmGV4YLHenrpZece24jnbNWPMPzK
 kq32fAWVtIuOyKguGUCekBxiNEbrnvqhQ8PO3mso45v7AEMsQ51x/5Cums8l8WR3iMDS
 kDk39rt4/DxFIGqahmTQWM2qyEQ5SDZAwNLcmJ6rc44HHnpaWjEBOvm+JvhA+WrSV+E2
 478Wr3IFGHDHzBg8Ll4+eQTXdZW6XTVIn/rtS8i/C09XpmMl/Z/j/bYEuuzPzXp5PNFT
 av6SW0H5HcfMADuZWiU0abq59fXdiIaRvjFQA8EIGpoOml7iYW6DHo7aT9+A0HsW9Vr4 OA== 
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
        by mx0a-00169c01.pphosted.com with ESMTP id 30mm8q4q99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 17:52:41 -0700
Received: by mail-ua1-f70.google.com with SMTP id 59so321372uaw.6
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 17:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5f8gCOzWgbiEHKAONZ11mC0mqNpqUEA5pir91gmiYj8=;
        b=ozLHVIJ50POAS0NwWuYCGxyz5Vvir0fGL7gnYFCcz4YrKcWUEuWRzgKCpwzQ9yQsGj
         xlz8BcJplxps6sQtDwQ4nq//KdwvpRO2fMoNOIKxCJeWIBjGRRIFmxcvzG+NJb1AZcRy
         rAjnh2E5qH61mJb2hQmINPrAn17HFA7V5Bm093DydTzeyOre30D3sjTiNX2cCbMqfB/7
         ZdrfvAkWWfIS75RseS7HjcuFIsvV+wRBZfDa7iXkzpcKZEsU9/F0EItbm/ShPOfQEx9q
         /kwXMyuwti0LDAF+hxcWZYVu9a+QjNr7QlgV/2teHBQO2V9SshZlxt9nzjPZd7KLNWh1
         Hzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5f8gCOzWgbiEHKAONZ11mC0mqNpqUEA5pir91gmiYj8=;
        b=iYok9V+4IySV5d8Op+VjaeGY19QOX/NOMaMVh6WBv0013cu1dHiyHwBdPJnSyRUwL6
         wbwxCeNuEW4SKeqARVMJzOIFNkDhT/oUdGwj2wCaiKbN3V2csq0BxKpu1ZfnoBwuJ4+u
         RhgmA+4gfRxwDxsBgOIV8QZZDr6ajgt5VIFmo8H/3wAnHmLuP+FzYpVhb9V+i6lU2plM
         6kYtMYNuukH1708i+l1P22Re/06x2dZw5Xhe+HpOfvthu4irwA5d9HD3u2oNfDBILD9i
         89siAisu/k7Y+GpixJa/3HXtbGoVHRgkKacVWZ6EkpvLN1b89a755VhttOJfehTGESQv
         8Bmg==
X-Gm-Message-State: AGi0PuY28ISm1cTq/P6Uh958+4T1xkkRd2U4btwVK+VQy04lXEaH+4Q+
        WoriK1IqUG/A7ztcpq+mR2p2U8afhHBkCOBWNT3rujIs+JDgdR0q8ucQsyAin9R+x4rIHe4b70s
        NR2fIqnSXDjvmH09isFs4iODPJ8kDTgFrHWBx2aE=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr25576670vsr.190.1588121560077;
        Tue, 28 Apr 2020 17:52:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJQva4k2yzapXZmCIZIj16sPikG3nFdDwbeApHnStQwAUaKfNe2hRTHdMNoFi05b3pjA3fsmt/MgkqcWVjHa7s=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr25576657vsr.190.1588121559763;
 Tue, 28 Apr 2020 17:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
 <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com>
In-Reply-To: <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com>
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Tue, 28 Apr 2020 17:52:28 -0700
Message-ID: <CAHQoOTbYvk7A3YLyGjkCK4tt_5ryu+mK6TK84OcAXRqUrF16kg@mail.gmail.com>
Subject: Re: XDP Native mode with public cloud (GCP)
To:     David Ahern <dsahern@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-28_15:2020-04-28,2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=1 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=905 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004290003
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

David,

Thanks for the quick reply - I assumed that this was the answer. The
good news is that I see almost 8Gbps in xdpgeneric mode.

Regards

John

On Tue, Apr 28, 2020 at 10:19 AM David Ahern <dsahern@gmail.com> wrote:
>
> On 4/28/20 11:11 AM, John McDowall wrote:
> > Hi,
> >
> > I am running the XDP redirect example on Google Cloud Platform using
> > the GCP provided Ubuntu 20.04 image as my host. The code works fine in
> > SKB_MODE (xdpgeneric). When I go to DRV_MODE I get the following error
> > message:   "libbpf: Kernel error message: virtio_net: XDP expects
> > header/data in single page, any_header_sg required".
>
> The most likely explanation is an old machine model for the VM.
>
> But that is just the first step. Once the VM model is updated to
> something modern, the cloud provider needs to enable multiqueue for the
> tap device with the number of queues = 2 * vcpus for each tap device.
> e.g., a 4 vcpu VM needs 8 queues per tap device that xdp is to be allowed.
>
> >
> > For all images on GCP that I have looked at the number of RX and TX
> > channels are set to 0 and the combined is the number of cores (ethtool
> > -l dev). My question is then, is there any way to run XDP native on
> > GCP images or do I need to try and create a custom image with re and
> > tx queues set?
> >
> > Second question, does anyone have experience running native XDP on AWS
> > and Azure?
> >
>
> last I looked AWS does not support XDP either. Never tried Azure.
