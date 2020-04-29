Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF821BE0DA
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Apr 2020 16:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgD2O0z (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Apr 2020 10:26:55 -0400
Received: from mx0a-00169c01.pphosted.com ([67.231.148.124]:33048 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726484AbgD2O0y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Apr 2020 10:26:54 -0400
Received: from pps.filterd (m0048493.ppops.net [127.0.0.1])
        by mx0a-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03TEPkKO023533
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Apr 2020 07:26:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : references : in-reply-to : from : date : message-id :
 subject : to : cc : content-type; s=PPS12012017;
 bh=eCY09ljb0ov3O4IMyk+4RA2Ys4Vczg6/0oWixPPSM8k=;
 b=T3QGka/wR/ucktEHkhulBumEdqqChtBg5E4WE+ji5e6nUomc8q+K+3iZI+hFaS0ggbmg
 xz7973dIznOuqQ+i5DlfTEZjrP5nWV7jA5MbfhwFNs1794yQqW+aJKRtt63B3LSziqJt
 FlYaVjIhL4toGJCGElkdf+I07cJp1XPXza3wq12Rr1jMBTStO/+NyKgo2JIL4WIIx7XK
 e+s1tpYZ+OEFZy/ezekDNxI3FiEiSTyOuKPgi88w469Eerv7ljAqEZNSTZAsGHMrMa7T
 TJKrTf0fMFc/uEyB9yjT5bKsXNjVB9fvUpOOIlvEVTbmtgSjKEgKzIdHv1V2PC+OSPfN Vw== 
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
        by mx0a-00169c01.pphosted.com with ESMTP id 30mm8q6xk2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Apr 2020 07:26:53 -0700
Received: by mail-vs1-f71.google.com with SMTP id f19so552223vsr.0
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Apr 2020 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCY09ljb0ov3O4IMyk+4RA2Ys4Vczg6/0oWixPPSM8k=;
        b=aRxK1ZT59OgoQ9atgtbskG3HrgqCXfFEVfKFJa/VEKmQqKzLTr0DtI9zCCTehy7+Va
         9nRb9ht3wQZYRPDL5i+rMGexsPM6lUaW1/qooaKMEBgYok3pT9rK5iuVHAvMwAEqrslG
         NiC8d51cS9PbQ39p7O+LPrbtiA4g/GErgE/ueNfoanGNkLin9Fw9H4CREGCuyRj/cStR
         E0cLDsFbHbO0JHa4sZFKsOrR82lpB0KWofyJWPutkMGL6mIWb56LEo+2a2TdZW7FdsBK
         rAt8Ncdqd913/8rBKFaBbAgPuiQTWAgWf5z/yxDfL4SQhH35xsxq+A6ExlKlmfgXPlwY
         qMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCY09ljb0ov3O4IMyk+4RA2Ys4Vczg6/0oWixPPSM8k=;
        b=N02dqN+S1Z0LAFECS1CXJot+zxLeNaaWBup9h/cVUMPx2XKdm+PKe8PUQnWhllAoiN
         EQw+lre7Wie+XdT++kL2ql27pfSCPCTy8vByo3VbBej5L67oscIEvQqPrpwm4b3V54CX
         6iieGyVxvEn0RtzyBA0iYNpagDoSIK+XH+ZXxvm1axbMBVbvU37d6qGI/bVReFuZ9fW4
         EYdRgRabuGW5n0iZmra1dkik1xRKOS1VVdwPxuzgIMfEZc+H2v0emvM+e5L0yHLFwhBg
         65ADeb328UqMLt98z+eEdgv351T4v2zgyU4kg294ft+iuOHZZBLwj7Mvh9kee4P4LObr
         Q8BA==
X-Gm-Message-State: AGi0PuZMTVavk4hY+IA9BMag/VJ8mNR2NJ+GWJo6eTHmvgR0nWO7AFmK
        xXZTw7SQdtt+DWAXiYk+d5+qBeVTUh/p0+rYczWUFUJ7HzDOTZccE5wzZ8BsIBd40yfui1Alqyi
        4bam6LV7/XeEXfdxPkXaR4m0AhZonAqWzO59y5mc=
X-Received: by 2002:ab0:1413:: with SMTP id b19mr3335431uae.139.1588170411573;
        Wed, 29 Apr 2020 07:26:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypID4q3872CYIlIh5QfXdBcFuUV+jHnnKaD5297efS3+qgj3jFR5wvepjCB/2wLfGAJanFuzom+Whv3neuU/wzQ=
X-Received: by 2002:ab0:1413:: with SMTP id b19mr3335403uae.139.1588170411217;
 Wed, 29 Apr 2020 07:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
 <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com> <CAHQoOTbYvk7A3YLyGjkCK4tt_5ryu+mK6TK84OcAXRqUrF16kg@mail.gmail.com>
 <CAC1LvL11nq7HHGHHwag91d3U2j3M_rBRc+xj1O1JxXUmhxXsBw@mail.gmail.com>
In-Reply-To: <CAC1LvL11nq7HHGHHwag91d3U2j3M_rBRc+xj1O1JxXUmhxXsBw@mail.gmail.com>
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Wed, 29 Apr 2020 07:26:40 -0700
Message-ID: <CAHQoOTas3oo7FZy7v+QUO0SXM0ed3KrgQ=fUska1J0H0boLfNQ@mail.gmail.com>
Subject: Re: XDP Native mode with public cloud (GCP)
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     David Ahern <dsahern@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-29_07:2020-04-29,2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004290121
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Zvi,

Thanks, this looks promising, I will take a deeper look and see what I
can get working.

Really appreciate the pointer

Regards

John

On Tue, Apr 28, 2020 at 6:52 PM Zvi Effron <zeffron@riotgames.com> wrote:
>
> XDP just recently started supporting XDP. You will need their out-of-tree driver from https://github.com/amzn/amzn-drivers/. It does not support XDP_REDIRECT, and I don't think it supports AF_XDP, but it does support XDP_PASS, XDP_DROP, and XDP_TX.
>
> I have verified this today on a Fedora 31 based image, though it does require a few modifications to get the RPM to build.
>
> --Zvi
>
> On Tue, Apr 28, 2020 at 7:52 PM John McDowall <jmcdowall@paloaltonetworks.com> wrote:
>>
>> David,
>>
>> Thanks for the quick reply - I assumed that this was the answer. The
>> good news is that I see almost 8Gbps in xdpgeneric mode.
>>
>> Regards
>>
>> John
>>
>> On Tue, Apr 28, 2020 at 10:19 AM David Ahern <dsahern@gmail.com> wrote:
>> >
>> > On 4/28/20 11:11 AM, John McDowall wrote:
>> > > Hi,
>> > >
>> > > I am running the XDP redirect example on Google Cloud Platform using
>> > > the GCP provided Ubuntu 20.04 image as my host. The code works fine in
>> > > SKB_MODE (xdpgeneric). When I go to DRV_MODE I get the following error
>> > > message:   "libbpf: Kernel error message: virtio_net: XDP expects
>> > > header/data in single page, any_header_sg required".
>> >
>> > The most likely explanation is an old machine model for the VM.
>> >
>> > But that is just the first step. Once the VM model is updated to
>> > something modern, the cloud provider needs to enable multiqueue for the
>> > tap device with the number of queues = 2 * vcpus for each tap device.
>> > e.g., a 4 vcpu VM needs 8 queues per tap device that xdp is to be allowed.
>> >
>> > >
>> > > For all images on GCP that I have looked at the number of RX and TX
>> > > channels are set to 0 and the combined is the number of cores (ethtool
>> > > -l dev). My question is then, is there any way to run XDP native on
>> > > GCP images or do I need to try and create a custom image with re and
>> > > tx queues set?
>> > >
>> > > Second question, does anyone have experience running native XDP on AWS
>> > > and Azure?
>> > >
>> >
>> > last I looked AWS does not support XDP either. Never tried Azure.
