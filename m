Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48075EE980
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Sep 2022 00:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbiI1Wht (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Sep 2022 18:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbiI1WhW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Sep 2022 18:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7263FA0F3
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664404637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ylbV1s6EqK1agldHskuOQYqSoj5WiwUDEO+G+ujFvY8=;
        b=hVmjiIzL0EyirI/PIcCTcb6FNHbWc+c5nB1Fl/RlZ71q+B9Disl/Vx9vIjbOd9ScuGdulv
        pVzOnObtRXWH33AyTXC9zwEL8F99eKYnWimRres0PuNpMzHMrMXrF76sJoK2EVlxLZyxtF
        jcmtP6EPSq9wO/Keb8XIY0iKnY400SM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-0GARUXGzPumSUE8w9h_5-g-1; Wed, 28 Sep 2022 18:37:16 -0400
X-MC-Unique: 0GARUXGzPumSUE8w9h_5-g-1
Received: by mail-ed1-f70.google.com with SMTP id b17-20020a056402351100b00453b19d9bd0so11178427edd.4
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 15:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ylbV1s6EqK1agldHskuOQYqSoj5WiwUDEO+G+ujFvY8=;
        b=NtkctsmAyyH6X7hBXdTbnWydoc0Nn7SXge+xlLTGRy/jDK54glIKD1VJ+V87OntcBQ
         eOY2OOLVtpS4UM2Xaqw53+TF81NfUzVrb0CCfaf79HvDc+g+x1XdT5rV1WpyooClpIPL
         K2wrhkfOqqGzSzyLYw3ltRgtwTKPbxEmILLgtVYI06YGINLXtJdxCF0PQVoLm4fb9jpE
         9J1QW8nbUm9KBaFM1IUMd1kOJxk4AY3e2D462TF8UALo5IDy9VVLlUWjeTMH0o7g0+d0
         Yga7gZOPWJnz1pHotSITVjYj7yxiaG6U5nLKy8i0xmHy7HqM35yOT5ZK5vFnlcWiVKNg
         3DLQ==
X-Gm-Message-State: ACrzQf16V/89LVJ0rrzOl6e/55e1nO65W8aNtDTosdV5wXgsgmlRclGl
        7lGhXdjjGtJ4l1pahEocJa1Mei+yWIiVOf2HI5hBQRs65YRhlvdg4JXSXFBlOV211Dx1D8hZyZX
        xdQDQ3/zZDFS4bA+aqiG8+aA=
X-Received: by 2002:a17:907:980b:b0:783:6e65:c0c7 with SMTP id ji11-20020a170907980b00b007836e65c0c7mr114304ejc.355.1664404634643;
        Wed, 28 Sep 2022 15:37:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4neYGBDkW7is3zhPoGWuf/P/N3wf3m5YI0C5BdVAnyW7cw1IY90ROyThdajHWaHG6Me2y71g==
X-Received: by 2002:a17:907:980b:b0:783:6e65:c0c7 with SMTP id ji11-20020a170907980b00b007836e65c0c7mr114290ejc.355.1664404634397;
        Wed, 28 Sep 2022 15:37:14 -0700 (PDT)
Received: from localhost (net-93-71-3-16.cust.vodafonedsl.it. [93.71.3.16])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906200100b0073d9630cbafsm2912538ejo.126.2022.09.28.15.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:37:13 -0700 (PDT)
Date:   Thu, 29 Sep 2022 00:37:12 +0200
From:   Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To:     David Ahern <dsahern@kernel.org>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net,
        brouer@redhat.com, Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jason Wang <jasowang@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Subject: Re: [xdp-cloud] Questions about Offloads and XDP-Hints regarding a
 Cloud-Provider Use-Case
Message-ID: <YzTMmGuZjiO8+dVu@lore-desk>
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
 <2d2d13bd-da93-2e04-3fd1-a5fd4713d7df@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6eyb7yNhRdAXg7/W"
Content-Disposition: inline
In-Reply-To: <2d2d13bd-da93-2e04-3fd1-a5fd4713d7df@kernel.org>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


--6eyb7yNhRdAXg7/W
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 9/28/22 11:07 AM, Jesper Dangaard Brouer wrote:
> >=20
> > On 28/09/2022 15.54, Marcus Wichelmann wrote:
> >>
> >> I'm working for a cloud hosting provider and we're working on a new
> >> XDP-based networking stack for our VM-Hosts that uses XDP to
> >> accelerate the connectivity of our qemu/KVM VMs to the outside.
> >>
> >=20
> > Welcome to the community! Sounds like an excellent use-case and
> > opportunity for speeding up the RX packets from physical NIC into the
> > VM.=A0 Good to hear someone (again) having this use-case. I've personal=
ly
>=20
> +1
>=20
> > not been focused on this use-case lately, mostly because community
> > members that I was interacting with changed jobs, away from cloud
> > hosting companies. Good to have a user back in this area!
> >=20
> >=20
> >> For this, we use XDP_REDIRECT to forward packets between the physical
> >> host NIC and the VM tap devices. The main issue we have now is, that
> >> our VM guests have some virtio NIC offloads enabled: rx/tx
> >> checksumming, TSO/GSO, GRO and Scatter-Gather.
> >=20
> > Supporting RX-checksumming is part of the plans for XDP-hints, although
> > virtio_net is not part of my initial patchset.
>=20
> Lorenzo and I both had versions of a patch to propagate rx csum
> validation to the VM on xdp redirect. I do not recall a version after
> this one:
>=20
> https://lore.kernel.org/netdev/cover.1622222367.git.lorenzo@kernel.org/
>=20
> and I lost of track of what change is needed for it to go in.

iirc the blocking point was the missing CHECKSUM_COMPLETE support (we suppo=
rt
just CHECKSUM_UNNECESSARY). We can conver it with XDP hw-hints.

Regards,
Lorenzo

>=20
> >=20
> > XDP-redirect with GRO and Scatter-Gather frames are part of the
> > multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
> > multi-buff is disabled (except for cpumap), because the lack of
> > XDP-feature bits, meaning we cannot determine (in kernel) if receiving
> > net_device supports multi-buff (Cc Kumar).
> >=20
> >> Currently, these offloads (especially TSO/GSO) are incompatible with
> >> XDP_REDIRECT and result in packets being dropped. Because disabling
> >> these offloads in all our customer VMs is not a good option, we're
> >> searching for ways to support these offloads with XDP.
> >>
> >=20
> > To David Ahern, didn't the kernel recently loosen up on having to
> > disable these offloads for KVM virtio_net?
>=20
> not that I am aware. Still need tx offloads disabled.
>=20
>=20
> This summarizes what I was looking into back in 2020, along with the
> current state of XDP for VM use case:
>=20
> https://legacy.netdevconf.info/0x14/pub/slides/24/netdev-0x14-XDP-and-the=
-cloud.pdf
>=20
> source code is still on github too.
>=20

--6eyb7yNhRdAXg7/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYzTMmAAKCRA6cBh0uS2t
rAb1AP46mTX/8L0CNJ7KgoyvprxAob/+6Z8DXfSkCRpCLrmlNgD/e1qwO5C+iqDZ
JDI2z4K3lOWWlmM0oXUv+CIfyBms+Ak=
=TkvO
-----END PGP SIGNATURE-----

--6eyb7yNhRdAXg7/W--

