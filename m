Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE31243A21
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Jun 2019 17:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732831AbfFMPSu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Jun 2019 11:18:50 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:35286 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732143AbfFMNCt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Jun 2019 09:02:49 -0400
Received: by mail-io1-f51.google.com with SMTP id m24so16649657ioo.2
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Jun 2019 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tpyfpi9kjMwCdgP3pGb8qIXbZ1oqpy/gv/qwpxdkvL0=;
        b=sPYbRCFbshabKGe4S1BG7z1c6yOkjpdDtuhuVN09uuJdr08igfZgFFZM8hwuRJs3qv
         To4EhVfJ+I03OsSaJ3IQTTMgRMOPd8Xbx0maDCr0i/973supMGHVC3H8mJdM2+nKWNnq
         yFqEv//rXpfvqZrSLanvovVLw6gqNx0mwj5FJbZvRQxZFsydDYMxYrkhNg2PDreAquI8
         5iWjOMU9IzzwI5BTiXkzFlF5rg3+zKH0lT/N7KCJvVzY30otx37zGbB+qn622WlYKphM
         3p6qkKY6AHR2N4HI+blRj8On5ouTJ3z/vkU1vFhft2CHjcJCK2ZgKb5q6Xin4j6iSzhV
         /1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tpyfpi9kjMwCdgP3pGb8qIXbZ1oqpy/gv/qwpxdkvL0=;
        b=k4WB7eJDn5s/VHoJ5lhY7dwAPJNpCz7m3i33VVOHSneL7jsPvwQI0fFOaYNSI/4Wzq
         hRyiaEp4jxUg/9ViAs4OjZV4pk0KSCv+02whkEiZeQLx/t20POJEzuqQBCdZLKz/IFlv
         3PtLYaQmIMPHON1WehoR0xkNbtasHtdahvltsWwy+1M2evNhib0B4/7vwtPB+TLyZaCG
         59AKRod38ZnH9cwKo80W1ko1/pUNAlIf7rXIock4/8oU1BNKqo4tqTBLbAhPMnr6zJ/7
         sgU0B78dol6bRJCs3XqcPQcvBUomcGCGcIqqgtJCTS78NCt4sEe5CE/IV8LUcAZuzF4W
         1f3A==
X-Gm-Message-State: APjAAAUTcrqPWJwTP/U9/6HohgImyXO8p64AynoTcltowf0uWUp4L8Qn
        vq8jhLPvqI2ksevM9CkzW+CzNGwSDPHTxeSOxBQ=
X-Google-Smtp-Source: APXvYqyqYr+M3GZudvxUPa8E0nC7IxEeZOAGFg4AHYkCycdCOL+QrXlFxHeEl4S1XOmyJ6btC4TV+8OCBb/Ckd+dWtk=
X-Received: by 2002:a6b:9257:: with SMTP id u84mr51854169iod.278.1560430968012;
 Thu, 13 Jun 2019 06:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
 <20190610121540.36391dc3@carbon> <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
 <20190611124119.49a0e440@carbon> <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
 <20190611164525.6f8e845c@carbon> <CAK6Qs9kbWdRSer1LTz53BunJkvpQaa02YExen65Tha3HpGrW+w@mail.gmail.com>
 <20190612095323.620c0791@carbon> <CAK6Qs9k0t82_aDFx7xp=Lgz2tdQDUWdhZ4wSB-wJ-oCLHoevdw@mail.gmail.com>
In-Reply-To: <CAK6Qs9k0t82_aDFx7xp=Lgz2tdQDUWdhZ4wSB-wJ-oCLHoevdw@mail.gmail.com>
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Thu, 13 Jun 2019 16:02:36 +0300
Message-ID: <CAK6Qs9mBj9ufMY5r5rCOtDOWjZUj23ZbjA7MTS-V_PvhUe63bg@mail.gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi.
I did same tests on 2 other machines. One of them has same board, CPU
and NIC, second one has just same NIC but different board and CPU.

On first machine(same as initial) I got same results(too much rx_missed_err=
or),
On the second machine I got the output as It should be(almost none
rx_missed_error) and I got zero latency on even 12m pps.

That test tells me there is a issue about board or CPU I use on my
first test.  But I'm not sure how I am going to debug it. Here is
device informations

NICs are same on all device as I gave before
Intel Corporation 82599ES 10-Gigabit SFI/SFP+

Failed(initial) device:

Base Board Information
        Manufacturer: Intel
        Product Name: Greencity
CPU name:            Intel(R) Xeon(R) CPU           E5645  @ 2.40GHz


Second(successful) device:

Base Board Information
        Manufacturer: INTEL Corporation
        Product Name: DENLOW_WS
CPU name:            Intel(R) Xeon(R) CPU E3-1275 v3 @ 3.50GHz


On Wed, Jun 12, 2019 at 11:59 AM =C4=B0brahim Ercan <ibrahim.metu@gmail.com=
> wrote:
>
> I removed switch but still see rx_missed_errors.
>
> Ethtool(enp7s0f0) stat:       374068 (        374,068) <=3D fdir_miss /se=
c
> Ethtool(enp7s0f0) stat:     22269145 (     22,269,145) <=3D rx_bytes /sec
> Ethtool(enp7s0f0) stat:    566912795 (    566,912,795) <=3D rx_bytes_nic =
/sec
> Ethtool(enp7s0f0) stat:      8568315 (      8,568,315) <=3D rx_missed_err=
ors /sec
> Ethtool(enp7s0f0) stat:       371152 (        371,152) <=3D rx_packets /s=
ec
> Ethtool(enp7s0f0) stat:       297774 (        297,774) <=3D rx_pkts_nic /=
sec
>
> I also tried it with another copper NIC (Intel I350 Gigabit Network
> Connection) on same firewall. I loaded same xdp code and send about
> 1.5m pps. Here I didn't see any error
> Ethtool(enp9s0f0) stat:     95234803 (     95,234,803) <=3D rx_bytes /sec
> Ethtool(enp9s0f0) stat:     95234803 (     95,234,803) <=3D
> rx_long_byte_count /sec
> Ethtool(enp9s0f0) stat:      1488043 (      1,488,043) <=3D rx_packets /s=
ec
>
> Then I tried to change SFP module (with same model) but got same
> results. I compared 'ethtool -m' output of attacker and firewall. I
> noticed signal powers different
>
> on attacker side
> # ethtool -m enp9s0f1
>         Identifier                                : 0x03 (SFP)
>         Extended identifier                       : 0x04 (GBIC/SFP
> defined by 2-wire interface ID)
>         Connector                                 : 0x07 (LC)
>         Transceiver codes                         : 0x10 0x00 0x00
> 0x00 0x00 0x00 0x00 0x00
>         Transceiver type                          : 10G Ethernet: 10G Bas=
e-SR
>         Encoding                                  : 0x06 (64B/66B)
>         BR, Nominal                               : 10300MBd
>         Rate identifier                           : 0x00 (unspecified)
>         Length (SMF,km)                           : 0km
>         Length (SMF)                              : 0m
>         Length (50um)                             : 80m
>         Length (62.5um)                           : 30m
>         Length (Copper)                           : 0m
>         Length (OM3)                              : 300m
>         Laser wavelength                          : 850nm
>         Vendor name                               : FINISAR CORP.
>         Vendor OUI                                : 00:90:65
>         Vendor PN                                 : FTLX8571D3BCL
>         Vendor rev                                : A
>         Optical diagnostics support               : Yes
>         Laser bias current                        : 18.160 mA
>         Laser output power                        : 0.5945 mW / -2.26 dBm
>         Receiver signal average optical power     : 0.6328 mW / -1.99 dBm
>         Module temperature                        : 35.47 degrees C /
> 95.84 degrees F
>         Module voltage                            : 3.3568 V
>         Alarm/warning flags implemented           : Yes
>         Laser bias current high alarm             : Off
>         Laser bias current low alarm              : Off
>         Laser bias current high warning           : Off
>         Laser bias current low warning            : Off
>         Laser output power high alarm             : Off
>         Laser output power low alarm              : Off
>         Laser output power high warning           : Off
>         Laser output power low warning            : Off
>         Module temperature high alarm             : Off
>         Module temperature low alarm              : Off
>         Module temperature high warning           : Off
>         Module temperature low warning            : Off
>         Module voltage high alarm                 : Off
>         Module voltage low alarm                  : Off
>         Module voltage high warning               : Off
>         Module voltage low warning                : Off
>         Laser rx power high alarm                 : Off
>         Laser rx power low alarm                  : Off
>         Laser rx power high warning               : Off
>         Laser rx power low warning                : Off
>         Laser bias current high alarm threshold   : 11.800 mA
>         Laser bias current low alarm threshold    : 4.000 mA
>         Laser bias current high warning threshold : 10.800 mA
>         Laser bias current low warning threshold  : 5.000 mA
>         Laser output power high alarm threshold   : 0.8318 mW / -0.80 dBm
>         Laser output power low alarm threshold    : 0.2512 mW / -6.00 dBm
>         Laser output power high warning threshold : 0.6607 mW / -1.80 dBm
>         Laser output power low warning threshold  : 0.3162 mW / -5.00 dBm
>         Module temperature high alarm threshold   : 78.00 degrees C /
> 172.40 degrees F
>         Module temperature low alarm threshold    : -13.00 degrees C /
> 8.60 degrees F
>         Module temperature high warning threshold : 73.00 degrees C /
> 163.40 degrees F
>         Module temperature low warning threshold  : -8.00 degrees C /
> 17.60 degrees F
>         Module voltage high alarm threshold       : 3.7000 V
>         Module voltage low alarm threshold        : 2.9000 V
>         Module voltage high warning threshold     : 3.6000 V
>         Module voltage low warning threshold      : 3.0000 V
>         Laser rx power high alarm threshold       : 1.0000 mW / 0.00 dBm
>         Laser rx power low alarm threshold        : 0.0100 mW / -20.00 dB=
m
>         Laser rx power high warning threshold     : 0.7943 mW / -1.00 dBm
>         Laser rx power low warning threshold      : 0.0158 mW / -18.01 dB=
m
>
> on firewall side (It didn't change after I replace SFP with another)
> # ethtool -m enp7s0f0
>         Identifier                                : 0x03 (SFP)
>         Extended identifier                       : 0x04 (GBIC/SFP
> defined by 2-wire interface ID)
>         Connector                                 : 0x07 (LC)
>         Transceiver codes                         : 0x10 0x00 0x00
> 0x00 0x00 0x00 0x00 0x00
>         Transceiver type                          : 10G Ethernet: 10G Bas=
e-SR
>         Encoding                                  : 0x06 (64B/66B)
>         BR, Nominal                               : 10300MBd
>         Rate identifier                           : 0x00 (unspecified)
>         Length (SMF,km)                           : 0km
>         Length (SMF)                              : 0m
>         Length (50um)                             : 80m
>         Length (62.5um)                           : 30m
>         Length (Copper)                           : 0m
>         Length (OM3)                              : 300m
>         Laser wavelength                          : 850nm
>         Vendor name                               : FINISAR CORP.
>         Vendor OUI                                : 00:90:65
>         Vendor PN                                 : FTLX8571D3BCL
>         Vendor rev                                : A
>         Option values                             : 0x00 0x1a
>         Option                                    : RX_LOS implemented
>         Option                                    : TX_FAULT implemented
>         Option                                    : TX_DISABLE implemente=
d
>         BR margin, max                            : 0%
>         BR margin, min                            : 0%
>         Vendor SN                                 : AP40XS0
>         Date code                                 : 130202
>         Optical diagnostics support               : Yes
>         Laser bias current                        : 7.762 mA
>         Laser output power                        : 0.6590 mW / -1.81 dBm
>         Receiver signal average optical power     : 0.4653 mW / -3.32 dBm
>         Module temperature                        : 30.99 degrees C /
> 87.78 degrees F
>         Module voltage                            : 3.3468 V
>         Alarm/warning flags implemented           : Yes
>         Laser bias current high alarm             : Off
>         Laser bias current low alarm              : Off
>         Laser bias current high warning           : Off
>         Laser bias current low warning            : Off
>         Laser output power high alarm             : Off
>         Laser output power low alarm              : Off
>         Laser output power high warning           : Off
>         Laser output power low warning            : Off
>         Module temperature high alarm             : Off
>         Module temperature low alarm              : Off
>         Module temperature high warning           : Off
>         Module temperature low warning            : Off
>         Module voltage high alarm                 : Off
>         Module voltage low alarm                  : Off
>         Module voltage high warning               : Off
>         Module voltage low warning                : Off
>         Laser rx power high alarm                 : Off
>         Laser rx power low alarm                  : Off
>         Laser rx power high warning               : Off
>         Laser rx power low warning                : Off
>         Laser bias current high alarm threshold   : 13.200 mA
>         Laser bias current low alarm threshold    : 4.000 mA
>         Laser bias current high warning threshold : 12.600 mA
>         Laser bias current low warning threshold  : 5.000 mA
>         Laser output power high alarm threshold   : 1.0000 mW / 0.00 dBm
>         Laser output power low alarm threshold    : 0.2512 mW / -6.00 dBm
>         Laser output power high warning threshold : 0.7943 mW / -1.00 dBm
>         Laser output power low warning threshold  : 0.3162 mW / -5.00 dBm
>         Module temperature high alarm threshold   : 78.00 degrees C /
> 172.40 degrees F
>         Module temperature low alarm threshold    : -13.00 degrees C /
> 8.60 degrees F
>         Module temperature high warning threshold : 73.00 degrees C /
> 163.40 degrees F
>         Module temperature low warning threshold  : -8.00 degrees C /
> 17.60 degrees F
>         Module voltage high alarm threshold       : 3.7000 V
>         Module voltage low alarm threshold        : 2.9000 V
>         Module voltage high warning threshold     : 3.6000 V
>         Module voltage low warning threshold      : 3.0000 V
>         Laser rx power high alarm threshold       : 1.0000 mW / 0.00 dBm
>         Laser rx power low alarm threshold        : 0.0100 mW / -20.00 dB=
m
>         Laser rx power high warning threshold     : 0.7943 mW / -1.00 dBm
>         Laser rx power low warning threshold      : 0.0158 mW / -18.01 dB=
m
>
> May that signal power difference be the problem?
>
>
>
>
>
> On Wed, Jun 12, 2019 at 10:53 AM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> >
> >
> > On Wed, 12 Jun 2019 09:57:02 +0300 =C4=B0brahim Ercan <ibrahim.metu@gma=
il.com> wrote:
> >
> > > I removed bridge and did same tests again. Unfortunately result is
> > > same :/
> >
> > I sort of expected that, as the ethtool "rx_missed_errors" counter
> > says, that packets are dropped inside the NIC, before reaching Linux.
> > Something more fundamental is wrong with your setup.
> >
> > You mentioned there was a switch between the machines in your lab.  One
> > possibility is that the switch is somehow corrupting the frames before
> > the reach the NIC, e.g. in these overload DDoS scenarios.  Try to
> > remove the switch from the equation (by directly connecting machine
> > back-to-back), to identify where the pitfall is...
> >
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Principal Kernel Engineer at Red Hat
> >   LinkedIn: http://www.linkedin.com/in/brouer
