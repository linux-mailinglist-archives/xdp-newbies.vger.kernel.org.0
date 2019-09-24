Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A63BCAEB
	for <lists+xdp-newbies@lfdr.de>; Tue, 24 Sep 2019 17:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbfIXPNs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 24 Sep 2019 11:13:48 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35432 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731050AbfIXPNs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 24 Sep 2019 11:13:48 -0400
Received: by mail-qk1-f194.google.com with SMTP id w2so2156388qkf.2
        for <xdp-newbies@vger.kernel.org>; Tue, 24 Sep 2019 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NfDzQ8OMy+8DMaBUk2lCVEzvt0r9jG52BcIW4oYNniw=;
        b=VSI5zK+N7ZoO9rKD8RTCjxbrH8oWXfaSIoFHI0zb6WcjHx3LxcnHQ58YHjLtB6OlCo
         x2CZuJrLEf5IApN89o8e+KRTVsCLt7E6PLk66xaGkU1m9TZBHu5s3NQ72bwKCwty3hQ6
         BhnFGUoJAvJ0l2HYjVsnxq0VzbzJWF5yR171SfRBhx66hLluwS9wtpr8Xarnzs92tLut
         xT4+Lnr+wHmLuYE4UofnrsMcwaAzKW51RVMeQjVGEcPoGbNL8kjS13TYvsJ8tEbGONbo
         YQ/xfL8YojVr9hymd+jdn24Nc+w27Wp5PRqZu2UOpM/M2WDInhTF2/NTtuFIaZcT7PbK
         ea3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NfDzQ8OMy+8DMaBUk2lCVEzvt0r9jG52BcIW4oYNniw=;
        b=mXOLumUdDkuFZl15ZiaIWyzLRwMs66V4g4xhWUfN9JlPrWPle56r3JXpBv3Z3vYMji
         bp3VKR1TEvqtMvowi7W217UyFeh0uUaUBMO5VN2BW9f76ZPunHuhNtUeiXPaaSbCcC2r
         4p92rXn4WL8mDFudmXxlSZpfQYLvg5JH5lM3d9pe/E0veqGAA9CbqtRmTfmGV9ECwIOx
         G7EOFmrOIKZKmPAdsRuFu0HBor2FG9YwhMNAIPU47/1kvauEsvUIz4P2oy+zDxomYTLq
         4m4N4CbO0WEJaxpLthSwdeb28VdAG19bTb6/ykGEZx3528Q7QFPDPJ4Zh3uwv8+rF380
         KO4g==
X-Gm-Message-State: APjAAAU4POEAIvFRveHGjqYpAjL65WjXCXapLSIpU9byHUAdIzE1pRV/
        WYbJABop0wJmAxSV1pQe6WBrJLnpKNYlhrg2/HQGSDng
X-Google-Smtp-Source: APXvYqxZzMpPpUP9an2JhbtKM2jB0yEOWhYUtmyVWcc2OjfvwTadfhmVXY8mArKKEf4XVL2MhI8fbvJGixTLQ2IJLoY=
X-Received: by 2002:a37:4f4e:: with SMTP id d75mr2794382qkb.137.1569338026741;
 Tue, 24 Sep 2019 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
 <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech> <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
 <966e40dda4654444a420b935ad970d18@pantheon.tech> <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
In-Reply-To: <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
From:   William Tu <u9012063@gmail.com>
Date:   Tue, 24 Sep 2019 08:13:09 -0700
Message-ID: <CALDO+SZBtetYC2pjnLM-PZ4HOFC1K_edyuQKuoZ_HdjJkTvjcg@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Sep 23, 2019 at 6:01 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
>
>
> On 23 Sep 2019, at 11:00, J=C3=BAlius Milan wrote:
>
> > Many Thanks Magnus
> >
> >>> I have next 2 questions:
> >>>
> >>> 1] When I use xsk_ring_prod__reserve and successive
> >>> xsk_ring_prod__submit. Is it correct to submit also less than I
> >>> reserved?
> >>>     In some cases I can't exactly determine how much to reserve in
> >>> advance, since vpp buffers have different size than xdp frames.
> >>
> >> Let me see so I understand this correctly. Ponder you reserve 10
> >> slots and later submit 4. This means you have reserved 6 more than
> >> you need.
> >> Do you want to "unreserve" these and give them back to the ring? This
> >> is not supported by the interface today. Another way of solving this
> >> (if this is your problem and I am understanding it correctly, that
> >> is) is that you in the next iteration only reserve 10 - 6 =3D 4 slots
> >> because you already have 6 slots available from the last iteration.
> >> You could still submit 10 after this. But adding something like an
> >> unreserve option would be easy as long as we made sure it only
> >> affected local ring state. The global state seen in the shared
> >> variables between user space and kernel would not be touched, as this
> >> would affect performance negatively. Please let me know what you
> >> think.
> >>
> > Yes, You understand it correctly, I implemented it the way you
> > suggested, i.e. by marking index and count of reserved slots (not
> > committed yet, but works well), thanks again.
> >
> >>> 2] Can I use hugepage backed memory for umem? If not, is it planned
> >>> for future?
> >>>     Yet it does copy pakets from rx rings to vpp buffers, but
> >>> speculating about straight zerocopy way.
> >>
> >> Yes you can use huge pages today, but the internal AF_XDP code has
> >> not been optimized to use huge pages, so you will not get the full
> >> benefit from them today. Kevin Laatz, added to this mail, is working
> >> on optimizing the AF_XDP code for huge pages. If you want to know
> >> more or have some requirements, do not hesitate to contact him.
> >>
> > Kevin will the API for using hugepages change while optimization
> > process significantly or can I already start to rewrite my vpp driver
> > to use hugepages backed memory?
> > Also please let me know, when you consider AF_XDP code optimized to
> > use huge pages.
> >
> > William, if I may ask next question.
> > Does OVS implementation of af_xdp driver copy paket data from af_xdp
> > mmaped ring buffers into OVS "buffers" (some structure to represent
> > the packet in OVS) or is it zerocopy
> > in this manner, i.e. OVS "buffers" mempool is directly mmaped as ring
> > and so no copy on RX is needed. Since in 2nd case it would be very
> > valuable for me as inspiration.
>
> Currently, OVS uses the mmaped memory directly, however on egress, it is
> copying the memory to the egress interface it=E2=80=99s mmaped memory.
> Currently, OVS uses an AF_XDP memory pool per interface, so a further
> optimization could be to use a global memory pool so this extra copy is
> not needed.
>
That's right, thanks Eelco!
For OVS, it is zerocopy in the RX.

William
