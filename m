Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C472E1CF729
	for <lists+xdp-newbies@lfdr.de>; Tue, 12 May 2020 16:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgELO2p (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 12 May 2020 10:28:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45277 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725929AbgELO2o (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 12 May 2020 10:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589293722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3wrNC7DAH3+q24vrZjvJ6c57q9ieIn7Zj1AT9B3J4E0=;
        b=KZwlidRGsJjluGA3XswQQ4t1H5wGpWulaadQ2HQ4n0+VOisrFTr/Oc3VuKdFrScQEIGD4H
        6HclX8Ui56GqgqOg7MhX9jlRGDMl/Q4xvhUMstLdYy5CjTXBXdF4G7s0Py78R6Cy0lUFBc
        qBuRmlEsXoPYXPxUDNts+mhGYY8F93Y=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-jhI5UD7UPlK6ybcJxW_s1w-1; Tue, 12 May 2020 10:28:40 -0400
X-MC-Unique: jhI5UD7UPlK6ybcJxW_s1w-1
Received: by mail-lj1-f199.google.com with SMTP id u2so1917418ljg.22
        for <xdp-newbies@vger.kernel.org>; Tue, 12 May 2020 07:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=3wrNC7DAH3+q24vrZjvJ6c57q9ieIn7Zj1AT9B3J4E0=;
        b=KL4+drhnUxnHTzuGzDLOpwr3uQmllkDAoIFscCHFPlbGyHkT1SQE8QJ6uU6NVXwS1a
         WKcsleXIu8t448Nj3nEqNsKCxtTMixxobi8RUNnbB4hY/CnL5SUQ02JT0y98/H6aMWeC
         fKhUCp61KzHjtxFgOXR6OzWZHgIr17uN/F1KEGolg36rTIjc6qvRz2KwJ2/gCbkZeFQ4
         U3J1Vd+WXZ4e8sZRazSzkN9UENFotlIm6aov5Vw7E9kn05Uzlhzd13SeAIJehGdTpnV+
         HhdZ3zwT9vdR4UKm59Qr/rEQ1OMPZtv/WBqmxTzn5WNRt9sVJD4n9DkEb9oHkxM5I1YV
         mqOg==
X-Gm-Message-State: AOAM533I9lajzRn1G6fr3toP4Xusi1EDdWXRkTMs6ozK0O/J+HUpk0Ct
        4DhwnHD7ABJZ7WqHtzefkXryQZPI3lwxdqhZemvLr2JWXmcg0MO02RIZe6iNv9VZbEmZDS7TGXn
        Gz299Mku3CzLHAGa2GcZoXCI=
X-Received: by 2002:a2e:731a:: with SMTP id o26mr14418471ljc.189.1589293718975;
        Tue, 12 May 2020 07:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQImyeQYxvHE11x0aXJvi93reyQJaNjTbYR9x9vbxPFti1nkzBnCK0mNTVrXpcENI3HD+lFQ==
X-Received: by 2002:a2e:731a:: with SMTP id o26mr14418460ljc.189.1589293718773;
        Tue, 12 May 2020 07:28:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id h3sm14421276lfk.3.2020.05.12.07.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 07:28:37 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 18FA4181509; Tue, 12 May 2020 16:28:37 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP Software Issue - Payload Matching
In-Reply-To: <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com> <878shyg3e9.fsf@toke.dk> <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 12 May 2020 16:28:37 +0200
Message-ID: <87ftc5ut0q.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey Toke,
>
> Thank you for your response and the information!
>
> I actually found out last night about this as well, but when setting the=
=20
> max payload match length to 1500 bytes (instead of 65535), I receive a=20
> new error:
>
> ```
> invalid read from stack off -488+0 size 8
> processed 46277 insns (limit 1000000) max_states_per_insn 4 total_states=
=20
> 617 peak_states 617 mark_read 599
> ```

Hmm, this sounds like the verifier can't prove that your stack variable
(presumably the 'byte' pointer) is actually safe to read from the stack.
Not sure why - maybe because the variable is declared in the inner loop
and the verifier loses track? IDK, really...

> Here's the new code:
>
> ```
> if (filter[i]->payloadLen > 0)
> {
>  =C2=A0=C2=A0=C2=A0 uint8_t found =3D 1;
>
>  =C2=A0=C2=A0=C2=A0 // MAX_PAYLOAD_LENGTH =3D 1500
>  =C2=A0=C2=A0=C2=A0 for (uint16_t j =3D 0; j < MAX_PAYLOAD_LENGTH; j++)
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if ((j + 1) > filter[i]->payloadLe=
n)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 uint8_t *byte =3D data + sizeof(st=
ruct ethhdr) + (iph->ihl * 4) +=20
> l4headerLen + j;
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (byte + 1 > (uint8_t *)data_end)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (*byte =3D=3D filter[i]->payloa=
dMatch[j])
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 continue;
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 found =3D 0;
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>  =C2=A0=C2=A0=C2=A0 }
>
>  =C2=A0=C2=A0=C2=A0 if (!found)
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 continue;
>  =C2=A0=C2=A0=C2=A0 }
> }
> ```
>
> This error occurs when initializing the `byte` pointer (if I comment out=
=20
> any lines with the `byte` pointer, the XDP program runs without=20
> crashing). Though, to my understanding, I am doing things correctly here=
=20
> along with ensuring the `byte` pointer is within the packet's range.

Well, "doing something safely" and "convincing the verifier that what
you're doing is safe" is not always the same thing ;)

> I am also going to look into implementing your second suggestion! I've=20
> been trying to think of ways to improve performance with the software=20
> and initially, I planned to only have filtering rules activated after a=20
> certain global PPS/BPS threshold is met (specified in the config file).=20
> However, it sounds like your suggestion would be more efficient.
>
> Thank you for all your help!

You're welcome! :)

-Toke

