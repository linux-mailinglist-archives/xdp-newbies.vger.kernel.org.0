Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9073115C53
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Dec 2019 14:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfLGNQJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Dec 2019 08:16:09 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:41999 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfLGNQJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Dec 2019 08:16:09 -0500
Received: by mail-vk1-f175.google.com with SMTP id u123so3116246vkb.9
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Dec 2019 05:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4rul3mnEYFONvKiP6XZdA6eBPjClCRkhlAE44xm7h5c=;
        b=OrTwZtI0Jki1fk1tt2/6jE3s6zdXxoY0yjBLrBh4mUparreEayN+vZFi2Bjuv9lg9H
         B/Ixi4kyayJ1E4FbZfddrOFjYflvuV1B/z/EJU012uF2AJI3rhu41dxhJYK72nd4n7NQ
         My87alxPS/7fRM9AGbJByeKU1Nnh3F1cfAYvfu7P+YRysipJTF0A4nMz1ywmiloJ65R9
         +1V6t0/X16IPA7b7CZcvJ34U3/GkgX+bDi6WICctgSQnHFf54GfZAS2+RP/NW7BxECE1
         oqT71rDaHkIuJcOw5Knq9BYpc8lz8HdDcUEgQXX+ZwHnJIQD5oyvUvtEFtxNkr6/kf6k
         sh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4rul3mnEYFONvKiP6XZdA6eBPjClCRkhlAE44xm7h5c=;
        b=f6V1GR4p17P+t+O+eCebzTCDu1304Kf7nOldOHW+oLTNMf6wYqPAUldPmQwKEXsOjt
         FOVg4z72RqimgBu2/dwbqDVvPk4MjuuUI56vqa8YvYd7nRFFe3IKw5cTW23dMAsKiGJj
         qq9xEMPuGfLHnXDhXGj0ni2xu/u3jeXljk9eRUIBtFDky8iPB2WvChM78Dmrg+suENrX
         wrfA7wybQQtHwne2AfVhYk2WRdgpmFCZI8cIXP+DwbL7LXh6OAc5Vopn22qOq+mcmWWa
         dY5C7CnS/qPK9CfRN6vr1RFFX1s51Ef3vi5Emhy6lI28CuiD/vPV8JfV/QqTwJ9IzFpY
         7XRQ==
X-Gm-Message-State: APjAAAWuMG1jAmsGSM64WsPCym2zvTkrv0oi/PkXXM2NU2VpWdlWTLnr
        9IklHcGDp7+uvB/8i/wc8kQFGdEk/ZWnIy4iu2w=
X-Google-Smtp-Source: APXvYqzU5Dy3oYYOfYAJpMsULNDY5gGzrTLC8qd00dbltrugn/nEpfDNqxwbX0KrBchjVzVS1UzVgQ5TeVkvMf4krRY=
X-Received: by 2002:a1f:9941:: with SMTP id b62mr16267884vke.48.1575724568129;
 Sat, 07 Dec 2019 05:16:08 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR11MB26157ACA256993F0F15D65E7B45F0@BYAPR11MB2615.namprd11.prod.outlook.com>
 <BYAPR11MB261504C332D91F584F054345B45E0@BYAPR11MB2615.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB261504C332D91F584F054345B45E0@BYAPR11MB2615.namprd11.prod.outlook.com>
From:   Anton Protopopov <aspsk2@gmail.com>
Date:   Sat, 7 Dec 2019 08:15:57 -0500
Message-ID: <CAGn_itw1=3+dH85NL-4NtdKgLnXPgCZe4xrjQRx_Tu3iwySaiQ@mail.gmail.com>
Subject: Re: bpf_csum_diff - R3 offset is outside of the packet
To:     "Francesco Ruta (fruta)" <fruta@cisco.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Francesco,

=D0=BF=D1=82, 6 =D0=B4=D0=B5=D0=BA. 2019 =D0=B3. =D0=B2 19:12, Francesco Ru=
ta (fruta) <fruta@cisco.com>:
>
> Hello,
>
> I am trying to use bpf_csum_diff() to recompute a corrupted checksum in X=
DP; unfortunately, in this specific case, I am unable to just perform an in=
cremental update.
> I understand that the verifier will reject code that uses dynamic length,=
 but even the stripped-down test shown below is rejected.
> I tried directly in assembly adding extra range checks for the r3 registe=
r to placate the most phobic verifier to no avail.
> Is there any workaround -or any alternative?
> BR
> F.
>
> SEC("test")
> int intercept(struct xdp_md *ctx) {
>     void * data =3D (void*)(long)ctx->data;
>     void * dataEnd =3D (void*)(long)ctx->data_end;
>     void * dataPnt =3D data;
>     if (dataPnt >=3D dataEnd) {
>         return XDP_ABORTED;
>     }
>     __u32 dataLen =3D (__be32 *)dataEnd - (__be32 *)dataPnt;
>     if (dataLen > sizeof(__be32)){
>         (void)bpf_csum_diff(0, 0, (__be32 *)dataPnt, sizeof(__be32), 0);
>    }
>     return XDP_PASS;
> }
> char _license[] SEC("license") =3D "GPL";
>
> Prog section 'test' rejected: Permission denied (13)!
> - Type:         6
> - Instructions: 18 (0 over limit)
> - License:      GPL
>
> Verifier analysis:
>
> 0: (b7) r6 =3D 1
> 1: (61) r2 =3D *(u32 *)(r1 +4)
> 2: (61) r3 =3D *(u32 *)(r1 +0)
> 3: (3d) if r3 >=3D r2 goto pc+12
> R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2=3Dpkt_end(id=3D0,off=3D0,imm=3D0) R3=
=3Dpkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv1 R10=3Dfp0,call_-1
> 4: (1f) r2 -=3D r3
> 5: (18) r1 =3D 0x3fffffffc
> 7: (5f) r2 &=3D r1
> 8: (b7) r6 =3D 2
> 9: (b7) r1 =3D 17
> 10: (2d) if r1 > r2 goto pc+5
> R1=3Dinv17 R2=3Dinv(id=3D0,umin_value=3D17,umax_value=3D17179869180,var_o=
ff=3D(0x0; 0x3fffffffc)) R3=3Dpkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv2 R=
10=3Dfp0,call_-1
> 11: (b7) r1 =3D 0
> 12: (b7) r2 =3D 0
> 13: (b7) r4 =3D 4
> 14: (b7) r5 =3D 0
> 15: (85) call bpf_csum_diff#28
> invalid access to packet, off=3D0 size=3D4, R3(id=3D0,off=3D0,r=3D0)
> R3 offset is outside of the packet
>
> uname -sr
> Linux 5.0.0-1022-gke

You need to check pointer boundaries, try something like this:

SEC("test")
int intercept(struct xdp_md *ctx) {
    void * data =3D (void*)(long)ctx->data;
    void * data_end =3D (void*)(long)ctx->data_end;
    const int N =3D sizeof(__be32);

    if (data >=3D data_end)
        return XDP_ABORTED;

    if (data + N <=3D data_end) /* lets verifier to know that
data[0,...,N-1] is valid */
        bpf_csum_diff(0, 0, data, N, 0);

    return XDP_PASS;
}
