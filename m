Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AEF26C6B0
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Sep 2020 20:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgIPSAS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Sep 2020 14:00:18 -0400
Received: from mx0a-00169c01.pphosted.com ([67.231.148.124]:18214 "EHLO
        mx0b-00169c01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727711AbgIPR76 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Sep 2020 13:59:58 -0400
Received: from pps.filterd (m0045114.ppops.net [127.0.0.1])
        by mx0a-00169c01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08GEjCxM013360
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:53:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paloaltonetworks.com;
 h=mime-version : references : in-reply-to : from : date : message-id :
 subject : to : cc : content-type; s=PPS12012017;
 bh=ocrXvr57GQfNs8CRTUaCpyu6P0ZI5gMX3CzWl59fWkg=;
 b=fQl36OuG9Sqd7Lf94ECv7uyuf0u93oEeN6zwThiW/1rbHDAuZOGt26BsN6Srnx05I5Q4
 YntbpWOFwcchhoNQtCBu4swh/kYHOzx6poZsLnhr56ig081yEa9KKSCqjlBi5Qwg8LSG
 qjvGN/Tli7YmX8KrlzeOwZ3Kk9b9l6v0tOAh4bgo7qoeutB38BYc2okZEvhbZ52f0Mcd
 bZDQHqDByeTqgEIjkGSfTvkscsOv0l06XueT4DyaXbT/fCeC9uDwm/Fdq8JDCl/jJJi1
 mEfCZg2D7TUdOwN0ClxpLMcQahpzTBA/c+o8xZKlpHo/EI+W2jkSwfp0i7r5cVJNUQqj oA== 
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
        by mx0a-00169c01.pphosted.com with ESMTP id 33k5nvatut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:53:38 -0700
Received: by mail-vs1-f70.google.com with SMTP id d21so2223050vsf.16
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Sep 2020 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paloaltonetworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocrXvr57GQfNs8CRTUaCpyu6P0ZI5gMX3CzWl59fWkg=;
        b=1OB2WWWitrO9dmteunMHBGeyrQV5hL7FiGCGvr4KL/JKhWvPo3fMCToUwv75fPKQXX
         erSC9PnKaJ0Vb1EGdqBnx66LFxhCoFW20mSyH0tIOuYqmY1W4lR7jY17x7BDhL04l7ot
         ZIMoQ9RRtNlaORZdiiEPTPSb8vSDkenFORgmk4I4p61qeSWH1Abivt7ADhDpPQOTm1QP
         NImND1K6iQfqT2YnknhY0tso0gOPwMyxdTkfaRHXMPI8QjchLjhhMoUjDpgKtmx7+m6h
         KbOPbODn6FDf0c3BvqRQNug6n3g+/Yl+YRT83Bd7F5v3n5dy9xU06Vk8FB9agBxn3Esw
         WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocrXvr57GQfNs8CRTUaCpyu6P0ZI5gMX3CzWl59fWkg=;
        b=EyM7iDClsa0iB7Bit8qtiW/2nXxktmlYTyjm76Zx7FqemgsK5mqjYCokDX1xEOrt45
         pkCPOK5CYIOYYnEiPWJlBREGQJEsEKvQ++pQn3e1zs/ErmjMiK2QpJ+nI+OQ1lmmI+Ls
         CjnSpySi9xPUtd/4tG1rmGl+CAA71heh6UKvv+lWZ+6FtLjwX8Ss1SMhGnRMow2Y5wA6
         +A9S3ih86GVjyKy7fYll/FyJOTuv+SduTx1TaWE50VvzDeGw9eUPeJcy6ISmC2kFF8oi
         Qq2tPZFOLLWoiHRA2pYmvyaeSTy0KMLpYAx9tUoQGrYAymfcndGj2XcIWp9RaEbfjWYV
         A3wA==
X-Gm-Message-State: AOAM532w6//IaCHFP799oTGc1ixsYJgWk6e7U1jQBPVsn7vr+e9Ri0jT
        VlDplyO3b+vBKMzgvQYwPwtwudJAjpUP/YmEUIhonrancdKMpaoIFF4RwRvjlWw/a3k/M7xXKlX
        AWnylXCqHxQPxt7tJcnoobSKtg6PaRr9+VHSqzcw=
X-Received: by 2002:a05:6102:20e:: with SMTP id z14mr14005143vsp.17.1600268017053;
        Wed, 16 Sep 2020 07:53:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6QbPTJqZDI8ZltQqbYIcJ9pYRKn351JBtgIBcejr/b7ZJpUFv8S/COshgcrJI8iXMXkP+/4tn7ucjjQvNAuQ=
X-Received: by 2002:a05:6102:20e:: with SMTP id z14mr14005124vsp.17.1600268016733;
 Wed, 16 Sep 2020 07:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
 <de4d3860-dca9-a516-cf40-208c12abb3ca@isovalent.com>
In-Reply-To: <de4d3860-dca9-a516-cf40-208c12abb3ca@isovalent.com>
From:   John McDowall <jmcdowall@paloaltonetworks.com>
Date:   Wed, 16 Sep 2020 07:53:26 -0700
Message-ID: <CAHQoOTaT+WzkJnGnursDidGYb7jSDusWNR+VOc=C6Pme=uLsbQ@mail.gmail.com>
Subject: Re: Using pinned maps within a network namespace
To:     Quentin Monnet <quentin@isovalent.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-16_10:2020-09-16,2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160112
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Quentin,

You're right, my code is a little messy but it does what you
suggested, as I mentioned to Song it works on the host system just not
in the network namespace. The error from bpf_obj_pin is

errno: No such file or directory

Here is a larger code segment:

  pin_fd = bpf_create_map(BPF_MAP_TYPE_ARRAY,
                     sizeof(uint32_t), sizeof(config_data),1, 0);
        if (pin_fd < 0){
            jed_error(jed_logfile,"Failed to create map ", CONFIG_MAP_PATH);
        }

        ret = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
        if (ret < 0) {
            jed_info(jed_logfile,"Access to %s map failed obj_pin ",
CONFIG_MAP_PATH);
            pin_fd = bpf_obj_get(CONFIG_MAP_PATH);
            if (pin_fd < 0){
             jed_error(jed_logfile,"Access to %s map failed with
obj_get ", CONFIG_MAP_PATH);
            }
        }

        key = 0;
        ret = bpf_map_update_elem(pin_fd, &key, &config_data, 0);
        if (ret < 0) {
           jed_error(jed_logfile,"bpf_map_update_elem %s ",CONFIG_MAP_PATH);
        }

Thanks for your help

Regards

John

On Wed, Sep 16, 2020 at 2:22 AM Quentin Monnet <quentin@isovalent.com> wrote:
>
> On 15/09/2020 18:00, John McDowall wrote:
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
>
> Hi, from your log message ("obj_pin") it looks like the error occurs
> when you try to pin the map, not when you try to access it. The way you
> try to pin it:
>
>         mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
>
> looks suspicious. If I remember correctly, bpf_obj_pin() returns 0 on
> success, it does not return a fd. It does use a file descriptor to the
> map as a first argument, can you double check that this is what "pin_fd"
> contains? How did you retrieve this fd? It looks to me like "pin_fd"
> does not point to an existing map, and that the kernel fails to find the
> map to pin.
>
> Good luck,
> Quentin
