Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93206F15F5
	for <lists+xdp-newbies@lfdr.de>; Fri, 28 Apr 2023 12:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjD1KoO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 28 Apr 2023 06:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjD1KoN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 28 Apr 2023 06:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778D45275
        for <xdp-newbies@vger.kernel.org>; Fri, 28 Apr 2023 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682678609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Gu1hHykQrtGKW1JwkJJV58wm3pYGn8aA02a3wNDAc+4=;
        b=ayXIpiThDpDAkNdlsW6snCEYhbH3WlM82O8lN07E8T2/2BMqRe7a1EmmNv4+xtTMR7yPWm
        lIgldIuSe0ek5u4fcTB4wI6bpTjGcjcXsI373poOc3XyxdhWVqv3cI62QYzX9McGxtHnU3
        14ChSeJM9tdKpvXpQ2t3nRh5wt8k7lU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-9b7ADzjmM-GLhIrm_TYy_g-1; Fri, 28 Apr 2023 06:43:28 -0400
X-MC-Unique: 9b7ADzjmM-GLhIrm_TYy_g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5068e922bcaso9114991a12.1
        for <xdp-newbies@vger.kernel.org>; Fri, 28 Apr 2023 03:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678607; x=1685270607;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu1hHykQrtGKW1JwkJJV58wm3pYGn8aA02a3wNDAc+4=;
        b=RkOMi5R6rz3BMxGsEWg52MbXlHfGLVhrLOUtXLZLY+308H6ScNg9q+tl1Vb1VEpDr3
         EvsUtgk5QOLDnNb6McZjaLgXZPixbOzQ6ZfPhhf170e66w+brYLBXN3QN937QTYE/ehr
         VIcHxQKueaqh92UHjkcLASn6cvTmrocVNaWFEIgqupnBN+rXU9o4BFa1QVETjLTMWS4V
         mRLBT3UqqMkcXnbMDXceHaBGizZ2rJbJtukF0jWqhcSHnm/ZPpRzFbwyNM/2+BBNURrH
         rkMLBhMkB4mYGjAJoJjI6j5EhV5fzBpAPEhF7FQh1WwhWJRu8Ky/4JrQK/sxT0Zzh43K
         7LdQ==
X-Gm-Message-State: AC+VfDxFD71vQ1MMkIEUGvBcG5Zu8SdIKrhfA32HOih3aNIdrEEgygwD
        gve8hW4XVINTufw4sPPOaqFf1wOgDB67LQ7cpTHAqYqkIKTJ3erQnZ3x3s//Mgd8LtQ7UsWwyxt
        gFQb89WBqEmi4PfvBYkq5Py8=
X-Received: by 2002:a17:907:26c3:b0:8b8:c06e:52d8 with SMTP id bp3-20020a17090726c300b008b8c06e52d8mr4837729ejc.36.1682678606760;
        Fri, 28 Apr 2023 03:43:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ufhqcgvB7sK3JVFAWUPsn4K7G78w9yty14U9Gw0m7jJM+FgJHtlt8EH1xU2GamQbKiFj94g==
X-Received: by 2002:a17:907:26c3:b0:8b8:c06e:52d8 with SMTP id bp3-20020a17090726c300b008b8c06e52d8mr4837693ejc.36.1682678605793;
        Fri, 28 Apr 2023 03:43:25 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id gn2-20020a1709070d0200b009545230e682sm10784528ejc.91.2023.04.28.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 03:43:25 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7974CADCA4E; Fri, 28 Apr 2023 12:43:24 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     ctxspi@gmail.com, xdp-newbies@vger.kernel.org
Subject: Re: Ebpf map question
In-Reply-To: <CAAVAo4MCYB9LKeDVJ=5Eaiy2gJ00bEvbvnE6PzQEc=U67WPQ4A@mail.gmail.com>
References: <CAAVAo4MCYB9LKeDVJ=5Eaiy2gJ00bEvbvnE6PzQEc=U67WPQ4A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 28 Apr 2023 12:43:24 +0200
Message-ID: <87pm7o70dv.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Marco <ctxspi@gmail.com> writes:

> Hi
>
> Assuming to have this struct:
>
> struct hash_elem {
>     int cnt;
>     };
>
> and kernel space program want read cnt value:
>
> struct hash_elem *val = bpf_map_lookup_elem(&hash_map, &key);
>
>     if (val)
>    {
>
> # time fraction
>
>     bpf_printk("My value %d", val->cnt);
>     }
>
> What happens if the hash_map is a pinned map and in the same time
> space of 'time fraction" a user program deletes the element of the
> key?
> What happen at val pointer?

The val pointer is RCU-protected so it will stick around until the end
of your BPF program's execution. However, it's up to your own code to
protect against concurrent *updates* of the value...

-Toke

