Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB0F3D6882
	for <lists+xdp-newbies@lfdr.de>; Mon, 26 Jul 2021 23:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhGZUgx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 26 Jul 2021 16:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhGZUgx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 26 Jul 2021 16:36:53 -0400
Received: from telegrapho.inexo.com.br (unknown [IPv6:2001:12c4:f0da:5e:216:3eff:feff:56a4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BB16C061757
        for <xdp-newbies@vger.kernel.org>; Mon, 26 Jul 2021 14:17:20 -0700 (PDT)
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 2D90C7AC5B1A; Mon, 26 Jul 2021 18:17:16 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 2D90C7AC5B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1627334236;
        bh=+h1DwkoO/42LBgYzsoeOhl8rAH54nfkXgBnQGdjNdBg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q++TPOvzkVqxRruDNKVF5nee7PH2+ZiME3ap0NMTIPcO/QEgjPjZWTTWgYRLg1zFm
         VYHlI2VtfYJ/2WsA6uUn1UzqLCMzED/0VOa6KkCu/TkGH+0qLtoqSw/o0+/c+qRHKp
         nMXvcK2oByYIYikqQq7sisKyeDwbEIJTO4RbJsX5akgnqZO4TIt1Gi/m4lv6VYB7Jx
         9NvDL5+Q9y1GCUTdM+2cLyN32tW73t3Yl/MttFuTMbT/E2MXSKhXkEdARYgo61Rb7M
         aJ8HM6+fBNWrLKZHZ1QU/sn6CatrxcOXA310+vvoK0ZtWyc4dRGw47tAVWxILw0o22
         EyM0Qm9IzKbTQ==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.32.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 9B3D07AC5B16;
        Mon, 26 Jul 2021 18:17:14 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 9B3D07AC5B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1627334234;
        bh=+h1DwkoO/42LBgYzsoeOhl8rAH54nfkXgBnQGdjNdBg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FjHiq+PT6xeka8elyBUKrKVUNI270/GOl6cYP7aeDgud/gfSG2L/3StbuTvZi7mnm
         t+uwYViQunNuoxexpiHAWe4YLGnrI/Bj1C48L1sUyV5Blemlmz4Y/ZRdVhEVk0QoPs
         TAWDNV3n9Mifc1zAPX38rJBzsow8U0M2Lydm8GFHw+YnvRWedusTrtBiU5/R0/Htyw
         BitUY+DBmHSChnyj4ObN4QyQRviPe46frW9mcuNEjsX1maU8Q5m4mOBTjUQvVtOYNp
         qSUj9VxsOHwZWmqX1xP2DSlRh3BQ9SwZIIysR3zt0vGKVNM9DhXfeDhiFIU50yzA0L
         Tm0f034B9j6+A==
Date:   Mon, 26 Jul 2021 18:17:13 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     Ivan Koveshnikov <ikoveshnik@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>
Subject: Re: xdp-cpumap-tc and VLAN not working together in my setup
Message-ID: <20210726181713.0a186bb7@babalu>
In-Reply-To: <CAHQrGVOVfhwPSbS5=ajzYTDER1bn-czXc+fmGLYgfBycODUKiw@mail.gmail.com>
References: <20210725221632.7647f054@babalu>
        <CAHQrGVOVfhwPSbS5=ajzYTDER1bn-czXc+fmGLYgfBycODUKiw@mail.gmail.com>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 26 Jul 2021 13:26:08 +0500
Ivan Koveshnikov <ikoveshnik@gmail.com> wrote:

> Hi Ethy,
> 
> >        8) Any packet ARRIVING thru middle's WAN (eth1) interface has its VLAN
> >        header removed with XDP loaded into kernel - observed with tcpdump as bellow  
> 
> Have you disabled vlan rx offloading on your nic, when trying XDP?
> When vlan rx offloading is enabled, nic cuts off vlan header from
> packets and sends them separately as metadata. When a packet is
> processed  by the kernel, this metadata is saved into `struct
> sk_buff->vlan_tci`, xdp hooks happen before that and don't work with
> skbs. But for the time being there is no uniform interface to address
> such metadata from XDP, and all XDP can see is a packet with vlan
> headers stripped. I believe you need to switch off vlan rx offload
> (`ethtool -K ${ifname} rxvlan off `) to get proper behaviour.
> 
> Best regards,
> Ivan Koveshnikov

Hi Ivan.

Thank you for your help.

"ethtool -K ${ifname} rxvlan off" solved the problem.

Now packets gets correctly classified and shaped.

But what is not clear for me is why, even with xdp_iphash_kern receiving the IP packet 
and have redirected it to the correct CPU,  the packets get "dropped" somewhere.
Any clues on this?

Regards

Ethy




> 
> On Mon, 26 Jul 2021 at 06:17, Ethy H. Brito <ethy.brito@inexo.com.br> wrote:
> >
> >
> > Hi everyone.
> >
> > (Long and very verbose email follows. Sorry about that - be patient)
> >
> > I can't make xdp-cpumap-tc work if vlan is used at WAN interface.
> >
> > If the packet gets redirected , that is, if it hits
> >
> >         "return bpf_redirect_map(&cpu_map, cpu_dest, 0);"
> >
> > in xdp_iphash_to_cpu_kern (function parse_ipv4) the packet never arrives
> > at client. It gets dropped somewhere.
> >
> > The test setup comprises three boxes:
> >         1) a client - vanila ubuntu 20
> >         2) a middle router box in-between (1) and (3) (that runs XDP and tc_classify)
> >         3) a server - vanila ubuntu 20
> >
> > They are almost completely isolated from production environment.
> >
> > A vlan (nic-br) is set between (2) and (3).
> >
> > xdp-cpumap-tc was git download with
> >
> >         git clone --recurse-submodules https://github.com/xdp-project/xdp-cpumap-tc
> >
> > and compiled yesterday. No errors.
> >
> > The VLANs are created like that:
> >         at middle box:
> >                 #ip link add link eth1 name nic-br type vlan id 1003
> >         at server box
> >                 #ip link add link eth0 name nic-br type vlan id 1003
> > The routes are
> >         at middle box:
> >                 # ip r sh
> >                 10.16.239.0/24 dev eth0 scope link
> >                 187.17.36.69 dev eth0 scope link
> >                 192.168.1.0/24 dev nic-br proto kernel scope link src 192.168.1.1
> >
> >         at server box:
> >                 # ip r s
> >                 default via 192.168.1.1 dev nic-br
> >                 10.16.239.0/24 via 192.168.1.1 dev nic-br
> >                 192.168.1.0/24 dev nic-br proto kernel scope link src 192.168.1.2
> >
> > Client box has two IP  addresses configured at its only interface (eth0)
> >         inet 10.16.239.213/32 scope global client
> >         inet 187.17.36.69/32 scope global client
> >
> > Both IPs "pings" server ip address 192.168.1.2 thru "middle" when XDP is *OFF*.
> >
> > # ping -I 187.17.36.69 192.168.1.2
> > PING 192.168.1.2 (192.168.1.2) from 187.17.36.69 : 56(84) bytes of data.
> > 64 bytes from 192.168.1.2: icmp_seq=1 ttl=63 time=0.391 ms
> > 64 bytes from 192.168.1.2: icmp_seq=2 ttl=63 time=0.360 ms
> >
> > # ping -I 10.16.239.213 192.168.1.2
> > PING 192.168.1.2 (192.168.1.2) from 10.16.239.213 : 56(84) bytes of data.
> > 64 bytes from 192.168.1.2: icmp_seq=1 ttl=63 time=0.410 ms
> > 64 bytes from 192.168.1.2: icmp_seq=2 ttl=63 time=0.389 ms
> >
> > But when the script bellow is executed at "middle", It is not possible
> > to ping the server from IP 187.17.36.69 anymore.
> > 10.16.239.213 works Ok.
> >
> > As you will see bellow I only "mapped" the 187... address.
> >
> > Since I have no clue where to investigate, I watched all I could think of.
> > These are my observations up to now:
> >
> >         1) if the packet is redirected to some CPU, it disappear inside
> >         the kernel never hitting the client.
> >
> >         2) if I unconditionally returns XDP_PASS at the end of parse_ipv4
> >         (xdp_iphash_to_cpu_kern) both pings work.
> >
> >         3) If I comment out the last line of the script bellow (the mapping line),
> >         then flush XDP and TC, and run the script again, both pings work.
> >         (since I do not have a map hit and the cpu redirect never occurs)
> >
> >         4) If I kill the vlans and route the packets thru the "naked" eth's
> >         both pings work. (no need to reload XDP or tc_classify - it just works right away)
> >
> >         5) I put some bpf_debug messages at the VLAN detection code, at both
> >         xdp_iphash and tc_classify, and they are both never hit.
> >
> >         6) locally, at middle box, I can always ping 187.17.36.69 and 10.16.239.213
> >         (even with XDP *ON*)
> >
> >         7) If I execute:
> >         /usr/local/bin/xdp_iphash_to_cpu_cmdline --add --ip '255.255.255.255' --classid '1:fffd' --cpu 0
> >         pings from 10.16.239.213 stop immediately (since now these IP packets gets redirected to a CPU).
> >         Deleting the IP entry from map, restores the ping immediately.
> >
> >         8) Any packet ARRIVING thru middle's WAN (eth1) interface has its VLAN
> >         header removed with XDP loaded into kernel - observed with tcpdump as bellow:
> >
> > Dump with XDP *OFF* (VLAN header OK - packet make thru client)
> > # stdbuf -o 0 -e 0 tcpdump -nei eth1 icmp
> > tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> > listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
> >
> > 19:32:45.676423 00:1b:21:8d:72:99 > 00:16:3e:f4:e9:88, ethertype *802.1Q (0x8100)*,
> > length 102: vlan 1003, p 0, ethertype IPv4, 187.17.36.69 > 192.168.1.2: ICMP echo request, id 1163, seq 137, length 64
> >
> > 19:32:45.676563 00:16:3e:f4:e9:88 > 00:1b:21:8d:72:99, ethertype *802.1Q (0x8100)*,
> > length 102: vlan 1003, p 0, ethertype IPv4, 192.168.1.2 > 187.17.36.69: ICMP echo reply, id 1163, seq 137, length 64
> >
> >
> > Dump with XDP *ON* (NO VLAN header - no packet get out thru middle's LAN (eth0))
> > # stdbuf -o 0 -e 0 tcpdump -nei eth1 icmp
> > tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> > listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
> >
> > 19:30:43.852543 00:1b:21:8d:72:99 > 00:16:3e:f4:e9:88, ethertype *802.1Q (0x8100)*,
> > length 102: vlan 1003, p 0, ethertype IPv4, 187.17.36.69 > 192.168.1.2: ICMP echo request, id 1163, seq 18, length 64
> >
> > 19:30:43.852695 00:16:3e:f4:e9:88 > 00:1b:21:8d:72:99, ethertype *IPv4 (0x0800)*,
> > length 98: 192.168.1.2 > 187.17.36.69: ICMP echo reply, id 1163, seq 18, length 64
> >
> > This is bpftool output:
> > # bpftool net
> > xdp:
> > eth0(3) driver id 796
> > eth1(4) driver id 801
> >
> > tc:
> > eth0(3) clsact/egress tc_classify_kern.o:[tc_classify] id 797
> > eth1(4) clsact/egress tc_classify_kern.o:[tc_classify] id 802
> >
> > flow_dissector:
> >
> >
> > This is the script I use to start xdp-cpumap. It is a fragment form a much
> > larger script that runs at my production box, stripped to a bare minimum where
> > the problem still happens.
> >
> > ----------------------------------- 8< -------------------------------------------
> > #!/bin/bash
> >
> > # Flushes all XDP maps
> > ###################################################
> > /usr/local/bin/xdp_iphash_to_cpu_cmdline --clear &>/dev/null
> >
> > /sbin/ip link set eth0 up
> > # Turn off eth0's XPS
> > for xps_cpus in $(ls /sys/class/net/eth0/queues/tx-*/xps_cpus | sort --field-separator='-' -k2n); do
> >         echo 0 > $xps_cpus
> > done
> >
> > # remove any existing qdiscs
> > /sbin/tc qdisc del dev eth0 root 2> /dev/null
> > /sbin/tc qdisc del dev eth0 ingress 2> /dev/null
> >
> > # Multiqueue root discipline, handle 7fff: handle
> > /sbin/tc qdisc replace dev eth0 root handle 7FFF: mq
> >
> > #Cria as disciplinas de fila (filhas de cada qdisc MQ acima) para atrelar (mais tarde) a cada CPU.
> > i=0
> > for dir in /sys/class/net/eth0/queues/tx-* ; do
> >     x=$((i++))
> >     # Qdisc HTB $i: under parent 7FFF:$i
> >     i_str=$(printf '%x' $i)
> >
> >     # "root" class
> >     /sbin/tc qdisc add dev eth0 parent 7FFF:$i_str handle $i_str: hfsc default fffd
> >
> >     # inner classes
> >     /sbin/tc class add dev eth0 parent $i_str: classid $i_str:1 hfsc sc m2 7gibit ul rate 7gibit
> >     # - set default class rate
> >     /sbin/tc class add dev eth0 parent $i_str:1 classid $i_str:fffd hfsc sc m2 7gibit ul rate 7gibit
> >     # Change the qdisc on default class
> >     /sbin/tc qdisc add dev eth0 parent $i_str:fffd fq_codel
> > done
> >
> > # Load XDP module
> > /usr/local/bin/xdp_iphash_to_cpu --dev eth0 --all-cpus --wan --quiet &>/dev/null
> > # Put all CPUs to dance. CPU X will process queue X+1 that holds the X+1 class
> > /usr/local/bin/tc_classify --dev-egress eth0 --base-setup  --quiet &>/dev/null
> >
> >
> > /sbin/ip link set eth1 up
> > # Turn off eth1's XPS
> > for xps_cpus in $(ls /sys/class/net/eth1/queues/tx-*/xps_cpus | sort --field-separator='-' -k2n); do
> >         echo 0 > $xps_cpus
> > done
> >
> > # remove any existing qdiscs
> > /sbin/tc qdisc del dev eth1 root 2> /dev/null
> > /sbin/tc qdisc del dev eth1 ingress 2> /dev/null
> >
> > # Multiqueue root discipline, handle 7fff: handle
> > /sbin/tc qdisc replace dev eth1 root handle 7FFF: mq
> >
> > #Cria as disciplinas de fila (filhas de cada qdisc MQ acima) para atrelar (mais tarde) a cada CPU.
> > i=0
> > for dir in /sys/class/net/eth1/queues/tx-* ; do
> >     x=$((i++))
> >     # Qdisc HTB $i: under parent 7FFF:$i
> >     i_str=$(printf '%x' $i)
> >
> >     # "root" class
> >     /sbin/tc qdisc add dev eth1 parent 7FFF:$i_str handle $i_str: hfsc default fffd
> >
> >     # inner classes
> >     /sbin/tc class add dev eth1 parent $i_str: classid $i_str:1 hfsc sc m2 7gibit ul rate 7gibit
> >     # - set default class rate
> >     /sbin/tc class add dev eth1 parent $i_str:1 classid $i_str:fffd hfsc sc m2 7gibit ul rate 7gibit
> >     # Change the qdisc on default class
> >     /sbin/tc qdisc add dev eth1 parent $i_str:fffd fq_codel
> > done
> >
> > # Load XDP module
> > /usr/local/bin/xdp_iphash_to_cpu --dev eth1 --all-cpus --wan --quiet &>/dev/null
> > # Put all CPUs to dance. CPU X will process queue X+1 that holds the X+1 class
> > /usr/local/bin/tc_classify --dev-egress eth1 --base-setup  --quiet &>/dev/null
> >
> > #/usr/local/bin/xdp_iphash_to_cpu_cmdline --add --ip '255.255.255.255' --classid '1:fffd' --cpu 0 >&/dev/null
> > #/usr/local/bin/xdp_iphash_to_cpu_cmdline --add --ip '255.255.255.254' --classid '1:fffe' --cpu 0 >&/dev/null
> > #/usr/local/bin/xdp_iphash_to_cpu_cmdline --add --ip '255.255.255.253' --classid '1:fffc' --cpu 0 >&/dev/null
> >
> > # Put the client's packets in its shaper
> > #from client: classid=4:105;VEL=52428800;
> > /sbin/tc class add dev eth1 parent 4:1 classid 4:105 hfsc sc m2 50mibit ul rate 50mibit
> > /sbin/tc qdisc add dev eth1 parent 4:105 fq_codel
> >
> > #to client: classid=4:105;VEL=52428800;
> > /sbin/tc class add dev eth0 parent 4:1 classid 4:105 hfsc sc m2 50mibit ul rate 50mibit
> > /sbin/tc qdisc add dev eth0 parent 4:105 fq_codel
> >
> > /usr/local/bin/xdp_iphash_to_cpu_cmdline --add --ip '187.17.36.69' --classid '4:105' --cpu 3 >&/dev/null
> >
> > exit 0
> >
> >
> > ----------------------------------- 8< -------------------------------------------
> >
> > Some bad interaction is happening when I use XDP and VLANs together.
> >
> > Can you guys help me with this??
> >
> > Regards
> >
> > Ethy  


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
