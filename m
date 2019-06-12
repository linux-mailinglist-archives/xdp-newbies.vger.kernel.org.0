Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEBB42036
	for <lists+xdp-newbies@lfdr.de>; Wed, 12 Jun 2019 10:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfFLI7l (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 12 Jun 2019 04:59:41 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:40272 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbfFLI7l (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 12 Jun 2019 04:59:41 -0400
Received: by mail-io1-f49.google.com with SMTP id n5so12298121ioc.7
        for <xdp-newbies@vger.kernel.org>; Wed, 12 Jun 2019 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tp4beDpCCF/x9p/ltw5aaM7XXD+jkNrn2sSBrje8dHE=;
        b=TP8Hf4YxnHfQ4BjbZUPwwGMD9Qx0bJt8JB090nr3sBPorLOX8Gk42eB7w9k3jo0DCB
         LDJzFLMroj1rERmepmsRSMU8A3g7c7J4imKe1nexDKbSmnqsqokaHeMo43Z9bkDKqYwi
         Bewjsy4jWToUSa8e3AIhR7OvZJc5dUmYaTJ/ZhTeJVSLD0sAqfVU+++IO6+OlVNFZwuO
         LBDuvn9hsPzKaTIUZIh+6tajwY9EOFat79zb/RlIx3S+1zjRWPKv8xbBSM7QPTAEFxgs
         NhJk2ny8u+bbrbSK3MIyjvIczD2Uxd8CsSaZ0+vUtpSzV6OlDIV5tHXXYZiL2KpEfXFi
         Dj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tp4beDpCCF/x9p/ltw5aaM7XXD+jkNrn2sSBrje8dHE=;
        b=V8JCibN+s84E7vAL6egHQurgsUNsD2DincsBoo2S/6eRbOjkSRYJjGQAeHh11Ehozn
         aw6KDWlq+bDh4tOIc4c0YSaAphikcjGkCSq19ZWTDuG2Yh6VjYDe2pxfMYVOTwIDccED
         HA+EBNzKdj+GkhtA/xLDEtaGFAMsS8QxrOMl0HYjVFoVP5wDvGj7I5OadHidxQPgSZOH
         Wxjkb+cRcntkKyA1Nx0At7Kw1So3ebk3sUJjq+nNPxTZgJASmTckeVOajnPW2XbxYfJY
         3WopAQv+Lx3jpBJ21tM5PD3X5cnJx+10plJvHXbmncw1mEUGuooS3XhM92S2nhaFZVk3
         nEGA==
X-Gm-Message-State: APjAAAXHvPgDQyAOftS00GO/8DkkxqfhFbpxwdqTQMPANDrjV9QColji
        pautBnscc+dKHnBBYFXe0s3YBO94zMSSOKgckq8=
X-Google-Smtp-Source: APXvYqyc3mLG4T775qPxY/H2zR8WNuAW38VRPEvu2Cqljw5Jejn5YnnSHcmTNP4R9ZaFy4NS1tyk2zVVWXWAFunU69I=
X-Received: by 2002:a5d:8508:: with SMTP id q8mr2831610ion.31.1560329979563;
 Wed, 12 Jun 2019 01:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
 <20190610121540.36391dc3@carbon> <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
 <20190611124119.49a0e440@carbon> <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
 <20190611164525.6f8e845c@carbon> <CAK6Qs9kbWdRSer1LTz53BunJkvpQaa02YExen65Tha3HpGrW+w@mail.gmail.com>
 <20190612095323.620c0791@carbon>
In-Reply-To: <20190612095323.620c0791@carbon>
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Wed, 12 Jun 2019 11:59:28 +0300
Message-ID: <CAK6Qs9k0t82_aDFx7xp=Lgz2tdQDUWdhZ4wSB-wJ-oCLHoevdw@mail.gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I removed switch but still see rx_missed_errors.

Ethtool(enp7s0f0) stat:       374068 (        374,068) <=3D fdir_miss /sec
Ethtool(enp7s0f0) stat:     22269145 (     22,269,145) <=3D rx_bytes /sec
Ethtool(enp7s0f0) stat:    566912795 (    566,912,795) <=3D rx_bytes_nic /s=
ec
Ethtool(enp7s0f0) stat:      8568315 (      8,568,315) <=3D rx_missed_error=
s /sec
Ethtool(enp7s0f0) stat:       371152 (        371,152) <=3D rx_packets /sec
Ethtool(enp7s0f0) stat:       297774 (        297,774) <=3D rx_pkts_nic /se=
c

I also tried it with another copper NIC (Intel I350 Gigabit Network
Connection) on same firewall. I loaded same xdp code and send about
1.5m pps. Here I didn't see any error
Ethtool(enp9s0f0) stat:     95234803 (     95,234,803) <=3D rx_bytes /sec
Ethtool(enp9s0f0) stat:     95234803 (     95,234,803) <=3D
rx_long_byte_count /sec
Ethtool(enp9s0f0) stat:      1488043 (      1,488,043) <=3D rx_packets /sec

Then I tried to change SFP module (with same model) but got same
results. I compared 'ethtool -m' output of attacker and firewall. I
noticed signal powers different

on attacker side
# ethtool -m enp9s0f1
        Identifier                                : 0x03 (SFP)
        Extended identifier                       : 0x04 (GBIC/SFP
defined by 2-wire interface ID)
        Connector                                 : 0x07 (LC)
        Transceiver codes                         : 0x10 0x00 0x00
0x00 0x00 0x00 0x00 0x00
        Transceiver type                          : 10G Ethernet: 10G Base-=
SR
        Encoding                                  : 0x06 (64B/66B)
        BR, Nominal                               : 10300MBd
        Rate identifier                           : 0x00 (unspecified)
        Length (SMF,km)                           : 0km
        Length (SMF)                              : 0m
        Length (50um)                             : 80m
        Length (62.5um)                           : 30m
        Length (Copper)                           : 0m
        Length (OM3)                              : 300m
        Laser wavelength                          : 850nm
        Vendor name                               : FINISAR CORP.
        Vendor OUI                                : 00:90:65
        Vendor PN                                 : FTLX8571D3BCL
        Vendor rev                                : A
        Optical diagnostics support               : Yes
        Laser bias current                        : 18.160 mA
        Laser output power                        : 0.5945 mW / -2.26 dBm
        Receiver signal average optical power     : 0.6328 mW / -1.99 dBm
        Module temperature                        : 35.47 degrees C /
95.84 degrees F
        Module voltage                            : 3.3568 V
        Alarm/warning flags implemented           : Yes
        Laser bias current high alarm             : Off
        Laser bias current low alarm              : Off
        Laser bias current high warning           : Off
        Laser bias current low warning            : Off
        Laser output power high alarm             : Off
        Laser output power low alarm              : Off
        Laser output power high warning           : Off
        Laser output power low warning            : Off
        Module temperature high alarm             : Off
        Module temperature low alarm              : Off
        Module temperature high warning           : Off
        Module temperature low warning            : Off
        Module voltage high alarm                 : Off
        Module voltage low alarm                  : Off
        Module voltage high warning               : Off
        Module voltage low warning                : Off
        Laser rx power high alarm                 : Off
        Laser rx power low alarm                  : Off
        Laser rx power high warning               : Off
        Laser rx power low warning                : Off
        Laser bias current high alarm threshold   : 11.800 mA
        Laser bias current low alarm threshold    : 4.000 mA
        Laser bias current high warning threshold : 10.800 mA
        Laser bias current low warning threshold  : 5.000 mA
        Laser output power high alarm threshold   : 0.8318 mW / -0.80 dBm
        Laser output power low alarm threshold    : 0.2512 mW / -6.00 dBm
        Laser output power high warning threshold : 0.6607 mW / -1.80 dBm
        Laser output power low warning threshold  : 0.3162 mW / -5.00 dBm
        Module temperature high alarm threshold   : 78.00 degrees C /
172.40 degrees F
        Module temperature low alarm threshold    : -13.00 degrees C /
8.60 degrees F
        Module temperature high warning threshold : 73.00 degrees C /
163.40 degrees F
        Module temperature low warning threshold  : -8.00 degrees C /
17.60 degrees F
        Module voltage high alarm threshold       : 3.7000 V
        Module voltage low alarm threshold        : 2.9000 V
        Module voltage high warning threshold     : 3.6000 V
        Module voltage low warning threshold      : 3.0000 V
        Laser rx power high alarm threshold       : 1.0000 mW / 0.00 dBm
        Laser rx power low alarm threshold        : 0.0100 mW / -20.00 dBm
        Laser rx power high warning threshold     : 0.7943 mW / -1.00 dBm
        Laser rx power low warning threshold      : 0.0158 mW / -18.01 dBm

on firewall side (It didn't change after I replace SFP with another)
# ethtool -m enp7s0f0
        Identifier                                : 0x03 (SFP)
        Extended identifier                       : 0x04 (GBIC/SFP
defined by 2-wire interface ID)
        Connector                                 : 0x07 (LC)
        Transceiver codes                         : 0x10 0x00 0x00
0x00 0x00 0x00 0x00 0x00
        Transceiver type                          : 10G Ethernet: 10G Base-=
SR
        Encoding                                  : 0x06 (64B/66B)
        BR, Nominal                               : 10300MBd
        Rate identifier                           : 0x00 (unspecified)
        Length (SMF,km)                           : 0km
        Length (SMF)                              : 0m
        Length (50um)                             : 80m
        Length (62.5um)                           : 30m
        Length (Copper)                           : 0m
        Length (OM3)                              : 300m
        Laser wavelength                          : 850nm
        Vendor name                               : FINISAR CORP.
        Vendor OUI                                : 00:90:65
        Vendor PN                                 : FTLX8571D3BCL
        Vendor rev                                : A
        Option values                             : 0x00 0x1a
        Option                                    : RX_LOS implemented
        Option                                    : TX_FAULT implemented
        Option                                    : TX_DISABLE implemented
        BR margin, max                            : 0%
        BR margin, min                            : 0%
        Vendor SN                                 : AP40XS0
        Date code                                 : 130202
        Optical diagnostics support               : Yes
        Laser bias current                        : 7.762 mA
        Laser output power                        : 0.6590 mW / -1.81 dBm
        Receiver signal average optical power     : 0.4653 mW / -3.32 dBm
        Module temperature                        : 30.99 degrees C /
87.78 degrees F
        Module voltage                            : 3.3468 V
        Alarm/warning flags implemented           : Yes
        Laser bias current high alarm             : Off
        Laser bias current low alarm              : Off
        Laser bias current high warning           : Off
        Laser bias current low warning            : Off
        Laser output power high alarm             : Off
        Laser output power low alarm              : Off
        Laser output power high warning           : Off
        Laser output power low warning            : Off
        Module temperature high alarm             : Off
        Module temperature low alarm              : Off
        Module temperature high warning           : Off
        Module temperature low warning            : Off
        Module voltage high alarm                 : Off
        Module voltage low alarm                  : Off
        Module voltage high warning               : Off
        Module voltage low warning                : Off
        Laser rx power high alarm                 : Off
        Laser rx power low alarm                  : Off
        Laser rx power high warning               : Off
        Laser rx power low warning                : Off
        Laser bias current high alarm threshold   : 13.200 mA
        Laser bias current low alarm threshold    : 4.000 mA
        Laser bias current high warning threshold : 12.600 mA
        Laser bias current low warning threshold  : 5.000 mA
        Laser output power high alarm threshold   : 1.0000 mW / 0.00 dBm
        Laser output power low alarm threshold    : 0.2512 mW / -6.00 dBm
        Laser output power high warning threshold : 0.7943 mW / -1.00 dBm
        Laser output power low warning threshold  : 0.3162 mW / -5.00 dBm
        Module temperature high alarm threshold   : 78.00 degrees C /
172.40 degrees F
        Module temperature low alarm threshold    : -13.00 degrees C /
8.60 degrees F
        Module temperature high warning threshold : 73.00 degrees C /
163.40 degrees F
        Module temperature low warning threshold  : -8.00 degrees C /
17.60 degrees F
        Module voltage high alarm threshold       : 3.7000 V
        Module voltage low alarm threshold        : 2.9000 V
        Module voltage high warning threshold     : 3.6000 V
        Module voltage low warning threshold      : 3.0000 V
        Laser rx power high alarm threshold       : 1.0000 mW / 0.00 dBm
        Laser rx power low alarm threshold        : 0.0100 mW / -20.00 dBm
        Laser rx power high warning threshold     : 0.7943 mW / -1.00 dBm
        Laser rx power low warning threshold      : 0.0158 mW / -18.01 dBm

May that signal power difference be the problem?





On Wed, Jun 12, 2019 at 10:53 AM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
>
> On Wed, 12 Jun 2019 09:57:02 +0300 =C4=B0brahim Ercan <ibrahim.metu@gmail=
.com> wrote:
>
> > I removed bridge and did same tests again. Unfortunately result is
> > same :/
>
> I sort of expected that, as the ethtool "rx_missed_errors" counter
> says, that packets are dropped inside the NIC, before reaching Linux.
> Something more fundamental is wrong with your setup.
>
> You mentioned there was a switch between the machines in your lab.  One
> possibility is that the switch is somehow corrupting the frames before
> the reach the NIC, e.g. in these overload DDoS scenarios.  Try to
> remove the switch from the equation (by directly connecting machine
> back-to-back), to identify where the pitfall is...
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
