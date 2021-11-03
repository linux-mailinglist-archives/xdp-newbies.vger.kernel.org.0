Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4E443FDE
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Nov 2021 11:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhKCKQe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Nov 2021 06:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41106 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231278AbhKCKQd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Nov 2021 06:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635934434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H4R1oYyrK1dsjBPbjV4TV/82GSXpM6crCjUg39EoWEg=;
        b=Mgx1Mb5ABWJMCflFU8n9u1+LcJErpYsOsEbeyKNCYdJLSwuZevKWM0wPDKfAyx/z0fIO6L
        fgFpJyBx7D3m7WerFUsluhmMclIGTAiiCLOMpSoND8l1+L4I31E8a8mCSMojyD7/BkSrmk
        +Asr8GUoLCmgPZyp4cCj+G/hUitdPjI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-5DI76sK1NfuAEoXPtew89A-1; Wed, 03 Nov 2021 06:13:53 -0400
X-MC-Unique: 5DI76sK1NfuAEoXPtew89A-1
Received: by mail-ed1-f71.google.com with SMTP id q6-20020a056402518600b003e28d92bb85so2001657edd.7
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Nov 2021 03:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=H4R1oYyrK1dsjBPbjV4TV/82GSXpM6crCjUg39EoWEg=;
        b=ci899Ywg0V90Dc4uIXLS8tKbP/s4tXPAwKKrKnZ2M1hr/q20IMQnEUTLovGyS2HgRV
         lqNSqJACVhVazKCsSup78p2uyijh2KFDfAgilhDpxT1j+87blDpW7umhcBXkmHw8fxcT
         XcjjpIuPGPGku1dfucLp16M+vZLFH9NovY5hwGah2O3RRMREIpBhZNRo+1z2sc6oaeQS
         XUt6OF9yvIem7Iu9LeQiA0OrynILcrZNZsQSVhFO+7pYANlk2VGTzrMbLIsr+5NtJC1A
         t8n08haeOcyvBIdFbyeRdfdnlzwcvSzsOnvCiRZRkEQ+j8g+0sHj3jKe9h/DlSUm7/xE
         e9oA==
X-Gm-Message-State: AOAM532otHMw+SOcugiLFa730lpbxWGYuCZSNCUJ7GOXdL8Zu8m6kQyu
        con9LiSJ/V4yQ1fTcgXvrWn6Tym8W+6OgTSSt0P+2FugN3FVxNlY3XX1i6LES6J/A4ERCqFfVf4
        d8yuAB62DR5cAxTUtXlIYwiQ=
X-Received: by 2002:a05:6402:2756:: with SMTP id z22mr21296106edd.88.1635934431212;
        Wed, 03 Nov 2021 03:13:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO0PtSciwW1M2LB0OGnlUmjEkWw6W8E5p4DHrLAc25V1HF0oBhnrvvkeA+JKd1BWQ0PpmDmA==
X-Received: by 2002:a05:6402:2756:: with SMTP id z22mr21295996edd.88.1635934430202;
        Wed, 03 Nov 2021 03:13:50 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id h17sm1216133ede.38.2021.11.03.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 03:13:49 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0EFFE180248; Wed,  3 Nov 2021 11:13:49 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: RPM for the kernel samples?
In-Reply-To: <7af6d2d6-502c-6733-30e6-63210dec8348@intel.com>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
 <87lf265ilu.fsf@toke.dk> <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
 <87ilxa5e0j.fsf@toke.dk> <61408aa4-e21d-6073-1481-042379124517@intel.com>
 <7af6d2d6-502c-6733-30e6-63210dec8348@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Nov 2021 11:13:49 +0100
Message-ID: <87fssd5yxu.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jesse Brandeburg <jesse.brandeburg@intel.com> writes:

>>>> I'll file a bugzilla.
>
> Filed as https://bugzilla.redhat.com/show_bug.cgi?id=2019616

Cool, thanks!

>>>
>>> Great!
>
> I tried to add you but, toke@redhat.com is not a valid bugzilla email 
> address?

No, that's my prettified alias; added myself now :)

-Toke

