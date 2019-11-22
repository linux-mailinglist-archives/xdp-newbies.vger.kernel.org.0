Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B2E106D3A
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 11:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfKVK63 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 Nov 2019 05:58:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52507 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730803AbfKVK62 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 Nov 2019 05:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574420307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NmWFC3+nQw9c5RyzYjdDe+3Iuxvk/JUmxO0P++kgl/8=;
        b=Si7Heinh68s3sCXMMDMHDmO29tn4ByMoeCOLKutE/fpsbBq6fIXIBVBTT42p3HgHwHxuA9
        TE2uVKiWWtnRNwsw5n9APmJnPyLYbgBM2vOM8WATGFKVEybZbRtO7jlphubpFjuRF+LBDn
        a40+Z2qWj8wCkIHsTzmxh5B3QGCEyTM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-HBM99jjlP7WbrhT6d1oxjw-1; Fri, 22 Nov 2019 05:58:26 -0500
Received: by mail-lf1-f70.google.com with SMTP id o140so1688508lff.18
        for <xdp-newbies@vger.kernel.org>; Fri, 22 Nov 2019 02:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=X0s5FjT3NrpV+hsSv+Fkgyq0zuiCLUn906wObwbU8Kw=;
        b=MwVfLs0AT4lRXze9xNVdRWeQFMJBwiZq+yQPvqzJZgaZA6DyJ6OsBPD7t2glJ0crqN
         njWoWVuyS/3/k1kF+2HK1QUd45PBXK8J0YIXRVZfk+pSuKXHeGaydNOonfhYzrjf2AnT
         yYfQwSK9Niayf+qS/GMKwj3oJK0e2Rg+SwZAILi9OTnAHikCPAEiiX0AX7WUyaWLjRis
         CwjDs/0zYldT/+z0mWDIMHRQ1dnq1j0gBqtDdldPkNSIUYRdJ8zd4ftGeubE5wUVnt1N
         58dlOD7TfOYLEnQEkGEZgsnqaLCUl6MY1/4kkf1Ba0gXlFp1LtCnfUHSYzoyqd+qpSEM
         J1qg==
X-Gm-Message-State: APjAAAUBpMa2BPmsW2BHZiKWs1hcldCxAb1J1wgUX5k6niIxmXZCgXbD
        2CRdsv/0zHcYXNN3bg0RkmpGj5wp2rVaKyDCwM9z86+Y6WQVyZWqey3Jk66RC84oPStUcaC2Zus
        uWJl5OR5fGixux3rUBK+jCX8=
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr11612439lfq.46.1574420304919;
        Fri, 22 Nov 2019 02:58:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHF2el8gosWDlDGDK19GUqJ5StASmqLNT5lgAUnSHJa7T42Vip/EK3frffMVHUMzQL6GYBvw==
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr11612424lfq.46.1574420304773;
        Fri, 22 Nov 2019 02:58:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id v30sm2986412lfn.41.2019.11.22.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 02:58:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 26DFB1800B9; Fri, 22 Nov 2019 11:58:23 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <thoiland@redhat.com>
To:     Piotr Raczynski <piotr.raczynski@intel.com>,
        Christoph Kuhr <christoph.kuhr@web.de>
Cc:     "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Access Hardware Timestamp in eBPF Program
In-Reply-To: <20191121231636.GA5888@DEV.igk.intel.com>
References: <ce15150c-01e4-5621-0d13-ebe0f7cd2333@web.de> <20191121231636.GA5888@DEV.igk.intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 22 Nov 2019 11:58:23 +0100
Message-ID: <87imnc5ga8.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: HBM99jjlP7WbrhT6d1oxjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Piotr Raczynski <piotr.raczynski@intel.com> writes:

>> Is there a way to access such timestamps in a XDP eBPF program?
>
> Unfortunately, as of now there is no universal way for XDP programs,
> even in native mode, to access information taken from hardware,
> e.g. from Rx descriptor. Technically it would be possible, but there
> are no interfaces now that would allow common scheme for different
> drivers.

Adding this is on the TODO list, though:
https://github.com/xdp-project/xdp-project/blob/master/xdp-project.org#meta=
data-available-to-programs

-Toke

