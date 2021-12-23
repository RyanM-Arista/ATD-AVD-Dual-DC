# ATD_FABRIC

# Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

# Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision |
| --- | ---- | ---- | ------------- | -------- | -------------------------- |
| SITE1_POD | l3leaf | s1-brdr1 | 192.168.0.100/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-brdr2 | 192.168.0.101/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-core1 | 192.168.0.102/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-core2 | 192.168.0.103/24 | ceos | Provisioned |
| SITE1_POD | l2leaf | s1-host1 | 192.168.0.16/24 | ceos | Provisioned |
| SITE1_POD | l2leaf | s1-host2 | 192.168.0.17/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-leaf1 | 192.168.0.12/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-leaf2 | 192.168.0.13/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-leaf3 | 192.168.0.14/24 | ceos | Provisioned |
| SITE1_POD | l3leaf | s1-leaf4 | 192.168.0.15/24 | ceos | Provisioned |
| SITE1 | spine | s1-spine1 | 192.168.0.10/24 | ceos | Provisioned |
| SITE1 | spine | s1-spine2 | 192.168.0.11/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-brdr1 | 192.168.0.200/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-brdr2 | 192.168.0.201/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-core1 | 192.168.0.202/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-core2 | 192.168.0.203/24 | ceos | Provisioned |
| SITE2_POD | l2leaf | s2-host1 | 192.168.0.26/24 | ceos | Provisioned |
| SITE2_POD | l2leaf | s2-host2 | 192.168.0.27/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-leaf1 | 192.168.0.22/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-leaf2 | 192.168.0.23/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-leaf3 | 192.168.0.24/24 | ceos | Provisioned |
| SITE2_POD | l3leaf | s2-leaf4 | 192.168.0.25/24 | ceos | Provisioned |
| SITE2 | spine | s2-spine1 | 192.168.0.20/24 | ceos | Provisioned |
| SITE2 | spine | s2-spine2 | 192.168.0.21/24 | ceos | Provisioned |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

## Fabric Switches with inband Management IP
| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

# Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | s1-brdr1 | Ethernet1 | mlag_peer | s1-brdr2 | Ethernet1 |
| l3leaf | s1-brdr1 | Ethernet6 | mlag_peer | s1-brdr2 | Ethernet6 |
| l3leaf | s1-core1 | Ethernet1 | mlag_peer | s1-core2 | Ethernet1 |
| l3leaf | s1-core1 | Ethernet6 | mlag_peer | s1-core2 | Ethernet6 |
| l2leaf | s1-host1 | Ethernet1 | l3leaf | s1-leaf1 | Ethernet4 |
| l2leaf | s1-host1 | Ethernet2 | l3leaf | s1-leaf2 | Ethernet4 |
| l2leaf | s1-host2 | Ethernet1 | l3leaf | s1-leaf3 | Ethernet4 |
| l2leaf | s1-host2 | Ethernet2 | l3leaf | s1-leaf4 | Ethernet4 |
| l3leaf | s1-leaf1 | Ethernet1 | mlag_peer | s1-leaf2 | Ethernet1 |
| l3leaf | s1-leaf1 | Ethernet6 | mlag_peer | s1-leaf2 | Ethernet6 |
| l3leaf | s1-leaf3 | Ethernet1 | mlag_peer | s1-leaf4 | Ethernet1 |
| l3leaf | s1-leaf3 | Ethernet6 | mlag_peer | s1-leaf4 | Ethernet6 |
| l3leaf | s2-brdr1 | Ethernet1 | mlag_peer | s2-brdr2 | Ethernet1 |
| l3leaf | s2-brdr1 | Ethernet6 | mlag_peer | s2-brdr2 | Ethernet6 |
| l3leaf | s2-core1 | Ethernet1 | mlag_peer | s2-core2 | Ethernet1 |
| l3leaf | s2-core1 | Ethernet6 | mlag_peer | s2-core2 | Ethernet6 |
| l2leaf | s2-host1 | Ethernet1 | l3leaf | s2-leaf1 | Ethernet4 |
| l2leaf | s2-host1 | Ethernet2 | l3leaf | s2-leaf2 | Ethernet4 |
| l2leaf | s2-host2 | Ethernet1 | l3leaf | s2-leaf3 | Ethernet4 |
| l2leaf | s2-host2 | Ethernet2 | l3leaf | s2-leaf4 | Ethernet4 |
| l3leaf | s2-leaf1 | Ethernet1 | mlag_peer | s2-leaf2 | Ethernet1 |
| l3leaf | s2-leaf1 | Ethernet6 | mlag_peer | s2-leaf2 | Ethernet6 |
| l3leaf | s2-leaf3 | Ethernet1 | mlag_peer | s2-leaf4 | Ethernet1 |
| l3leaf | s2-leaf3 | Ethernet6 | mlag_peer | s2-leaf4 | Ethernet6 |

# Fabric IP Allocation

## Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 10.1.2.0/24 | 256 | 0 | 0.0 % |
| 10.1.7.0/24 | 256 | 0 | 0.0 % |
| 10.2.2.0/24 | 256 | 0 | 0.0 % |
| 10.2.7.0/24 | 256 | 0 | 0.0 % |

## Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

## Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.0.0.0/24 | 256 | 2 | 0.79 % |
| 10.1.0.0/24 | 256 | 2 | 0.79 % |
| 10.1.3.0/24 | 256 | 6 | 2.35 % |
| 10.1.8.0/24 | 256 | 2 | 0.79 % |
| 10.2.3.0/24 | 256 | 6 | 2.35 % |
| 10.2.8.0/24 | 256 | 2 | 0.79 % |

## Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SITE1_POD | s1-brdr1 | 10.1.3.5/32 |
| SITE1_POD | s1-brdr2 | 10.1.3.6/32 |
| SITE1_POD | s1-core1 | 10.1.8.1/32 |
| SITE1_POD | s1-core2 | 10.1.8.2/32 |
| SITE1_POD | s1-leaf1 | 10.1.3.1/32 |
| SITE1_POD | s1-leaf2 | 10.1.3.2/32 |
| SITE1_POD | s1-leaf3 | 10.1.3.3/32 |
| SITE1_POD | s1-leaf4 | 10.1.3.4/32 |
| SITE1 | s1-spine1 | 10.0.0.1/32 |
| SITE1 | s1-spine2 | 10.0.0.2/32 |
| SITE2_POD | s2-brdr1 | 10.2.3.5/32 |
| SITE2_POD | s2-brdr2 | 10.2.3.6/32 |
| SITE2_POD | s2-core1 | 10.2.8.1/32 |
| SITE2_POD | s2-core2 | 10.2.8.2/32 |
| SITE2_POD | s2-leaf1 | 10.2.3.1/32 |
| SITE2_POD | s2-leaf2 | 10.2.3.2/32 |
| SITE2_POD | s2-leaf3 | 10.2.3.3/32 |
| SITE2_POD | s2-leaf4 | 10.2.3.4/32 |
| SITE2 | s2-spine1 | 10.1.0.1/32 |
| SITE2 | s2-spine2 | 10.1.0.2/32 |

## VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.1.4.0/24 | 256 | 6 | 2.35 % |
| 10.1.9.0/24 | 256 | 2 | 0.79 % |
| 10.2.4.0/24 | 256 | 6 | 2.35 % |
| 10.2.9.0/24 | 256 | 2 | 0.79 % |

## VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| SITE1_POD | s1-brdr1 | 10.1.4.5/32 |
| SITE1_POD | s1-brdr2 | 10.1.4.5/32 |
| SITE1_POD | s1-core1 | 10.1.9.1/32 |
| SITE1_POD | s1-core2 | 10.1.9.1/32 |
| SITE1_POD | s1-leaf1 | 10.1.4.1/32 |
| SITE1_POD | s1-leaf2 | 10.1.4.1/32 |
| SITE1_POD | s1-leaf3 | 10.1.4.3/32 |
| SITE1_POD | s1-leaf4 | 10.1.4.3/32 |
| SITE2_POD | s2-brdr1 | 10.2.4.5/32 |
| SITE2_POD | s2-brdr2 | 10.2.4.5/32 |
| SITE2_POD | s2-core1 | 10.2.9.1/32 |
| SITE2_POD | s2-core2 | 10.2.9.1/32 |
| SITE2_POD | s2-leaf1 | 10.2.4.1/32 |
| SITE2_POD | s2-leaf2 | 10.2.4.1/32 |
| SITE2_POD | s2-leaf3 | 10.2.4.3/32 |
| SITE2_POD | s2-leaf4 | 10.2.4.3/32 |
