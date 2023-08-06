{ secrets, ... }:

{
  networking.firewall = {
    enable = true;
    # if packets are still dropped, they will show up in dmesg
    logReversePathDrops = true;
    # wireguard trips rpfilter up
    extraCommands = ''
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
    '';
    extraStopCommands = ''
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
    '';
  };
  
  environment.etc."NetworkManager/system-connections/Slovakia-wg0.nmconnection".text = ''
    [connection]
    id=wg0
    uuid=4a88b262-cfdd-46fa-bd20-5d73d094e9e6
    type=wireguard
    interface-name=Slovakia-wg0

    [wireguard]
    private-key=${secrets.proton-private-key}

    [wireguard-peer.${secrets.proton-public-key}]
    endpoint=${secrets.proton-endpoint}:51820
    allowed-ips=0.0.0.0/0;

    [ipv4]
    address1=10.2.0.2/32
    dns=10.2.0.1;
    dns-search=~;
    method=manual

    [ipv6]
    addr-gen-mode=default
    method=disabled

    [proxy]
  '';
  
  networking.wireguard.enable = true;
  networking.wireguard.interfaces."wg0" = {
    ips = [ "10.2.0.2/32" ];
    listenPort = 51820;
    
    privateKey = secrets.proton-private-key;

    peers = [{
      publicKey = "${secrets.proton-public-key}";
      allowedIPs = [ "0.0.0.0/0" ];
    }];
  };

}
