{
  "log": {
    "level": "info",
    "timestamp": true
  },
  "experimental": {
    "clash_api": {
      "external_controller": "0.0.0.0:9090",
      "external_ui": "ui",
      "secret": "",
      "external_ui_download_url": "https://ghproxy.cn/https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip",
      "external_ui_download_detour": "direct",
      "default_mode": "rule"
    },
  "cache_file": {
    "enabled": true,
    "store_fakeip": false
    }
  },
  "dns": {
    "servers": [
      {
        "tag": "proxyDns",
        "address": "h3://dns.google/dns-query",
        "address_resolver": "dns_resolver",
        "detour": "Proxy"
      },
      {
        "tag": "localDns",
        "address": "h3://dns.alidns.com/dns-query",
        "address_resolver": "dns_resolver",
        "detour": "direct"
      },
      {
        "tag": "dns_resolver",
        "address": "local",
        "detour": "direct"
      },
      {
        "tag": "block",
        "address": "rcode://refused"
      }
    ],
    "rules": [
      {
        "rule_set": "geosite-category-ads-all",
        "server": "block"
      },
      {
        "outbound": "any",
        "server": "localDns",
        "disable_cache": true
      },
      {
        "rule_set": "geosite-cn",
        "server": "localDns"
      },   
      {
        "clash_mode": "direct",
        "server": "localDns"
      },
      {
        "clash_mode": "global",
        "server": "proxyDns"
      },
      {
        "rule_set": "geosite-geolocation-!cn",
        "server": "proxyDns"
      }
    ],
    "final": "localDns",
    "strategy": "prefer_ipv4"
  },
  "inbounds": [
    {
      "type": "tun",
      "address": "172.19.0.1/30",
      "mtu": 9000,
      "auto_route": true,
      "auto_redirect": false,
      "strict_route": true,
      "sniff": true,
      "endpoint_independent_nat": false,
      "stack": "system",
      "route_exclude_address_set": "geoip-cn",
      "platform": {
        "http_proxy": {
          "enabled": true,
          "server": "127.0.0.1",
          "server_port": 2080
        }
      }
    },
    {
      "type": "mixed",
      "listen": "127.0.0.1",
      "listen_port": 2080,
      "sniff": true,
      "users": []
    }
  ],
  "outbounds": [
    {
      "tag":"Proxy",
      "type":"selector",
      "outbounds":[
        "auto",
        "direct",
        "{all}"
      ]
    },
    {
      "tag":"OpenAI",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ],
      "default": "America"
    },
    {
      "tag":"Google",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Telegram",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Twitter",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Facebook",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"BiliBili",
      "type":"selector",
      "outbounds":[
        "direct",
        "HongKong",
        "TaiWan"
      ]
    },
    {
      "tag":"Bahamut",
      "type":"selector",
      "outbounds":[
        "TaiWan",
        "Proxy"
      ]
    },
    {
      "tag":"Spotify",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ],
      "default": "America"
    },
    {
      "tag":"TikTok",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America"
      ],
      "default": "Japan"
    },
    {
      "tag":"Netflix",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Disney+",
      "type":"selector",
      "outbounds":[
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Apple",
      "type":"selector",
      "outbounds":[
        "direct",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Microsoft",
      "type":"selector",
      "outbounds":[
        "direct",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Games",
      "type":"selector",
      "outbounds":[
        "direct",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Streaming",
      "type":"selector",
      "outbounds":[
        "direct",
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others"
      ]
    },
    {
      "tag":"Global",
      "type":"selector",
      "outbounds":[ 
        "Proxy",
        "HongKong",
        "TaiWan",
        "Singapore",
        "Japan",
        "America",
        "Others",
        "direct"
      ]
    },
    {
      "tag":"China",
      "type":"selector",
      "outbounds":[
        "direct",
        "Proxy"
      ]
    },
    {
      "tag":"AdBlock",
      "type":"selector",
      "outbounds":[
        "block",
        "direct"
      ]
    },
    {
      "tag":"HongKong",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"include","keywords":["🇭🇰|HK|hk|香港|港|HongKong"]}
      ]
    },
    {
      "tag":"TaiWan",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"include","keywords":["🇹🇼|TW|tw|台湾|臺灣|台|Taiwan"]}
      ]
    },
    {
      "tag":"Singapore",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"include","keywords":["🇸🇬|SG|sg|新加坡|狮|Singapore"]}
      ]
    },
    {
      "tag":"Japan",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"include","keywords":["🇯🇵|JP|jp|日本|日|Japan"]}
      ]
    },
    {
      "tag":"America",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"include","keywords":["🇺🇸|US|us|美国|美|United States"]}
      ]
    },
    {
      "tag":"Others",
      "type":"selector",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"exclude","keywords":["🇭🇰|HK|hk|香港|香|🇹🇼|TW|tw|台湾|台|🇸🇬|SG|sg|新加坡|狮|🇯🇵|JP|jp|日本|日|🇺🇸|US|us|美国|美"]}
      ]
    },
    {
      "tag":"auto",
      "type":"urltest",
      "outbounds":[
        "{all}"
      ],
      "filter":[
        {"action":"exclude","keywords":["网站|地址|剩余|过期|时间|有效"]}
      ],
      "url": "http://www.gstatic.com/generate_204",
      "interval": "10m",
      "tolerance": 50
    },
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "dns",
      "tag": "dns-out"
    },
    {
      "type": "block",
      "tag": "block"
    }
  ],
  "route": {
    "auto_detect_interface": true,
    "final": "Proxy",
    "rules": [
      {
        "type": "logical",
        "mode": "or",
        "rules":[
          {
            "port":53
          },
          {
            "protocol": "dns"
          }
        ],
        "outbound": "dns-out"
      },
      {
        "rule_set": "geosite-category-ads-all",
        "outbound": "AdBlock"
      },
      {
        "clash_mode": "direct",
        "outbound": "direct"
      },
      {
        "clash_mode": "global",
        "outbound": "Proxy"
      },
      {
        "domain": [
          "clash.razord.top",
          "yacd.metacubex.one",
          "yacd.haishan.me",
          "d.metacubex.one"
        ],
        "outbound": "direct"
      },
      {
        "ip_is_private": true,
        "outbound": "direct"
      },
      {
        "rule_set": "geosite-openai",
        "outbound": "OpenAI"
      },
      {
        "rule_set": ["geosite-youtube", "geoip-google", "geosite-google", "geosite-github"],
        "outbound": "Google"
      },
      {
        "rule_set": ["geoip-telegram", "geosite-telegram"],
        "outbound": "Telegram"
      },
      {
        "rule_set": ["geoip-twitter", "geosite-twitter"],
        "outbound": "Twitter"
      },
      {
        "rule_set":["geoip-facebook", "geosite-facebook"],
        "outbound": "Facebook"
      },
      {
        "rule_set": "geosite-bilibili",
        "outbound": "BiliBili"
      },
      {
        "rule_set": "geosite-bahamut",
        "outbound": "Bahamut"
      },
      {
        "rule_set": "geosite-spotify",
        "outbound": "Spotify"
      },
      {
        "rule_set": "geosite-tiktok",
        "outbound": "TikTok"
      },
      {
        "rule_set": ["geoip-netflix", "geosite-netflix"],
        "outbound": "Netflix"
      },
      {
        "rule_set": "geosite-disney",
        "outbound": "Disney+"
      },
      {
        "rule_set": ["geoip-apple", "geosite-apple", "geosite-amazon"],
        "outbound": "Apple"
      },
      {
        "rule_set": "geosite-microsoft",
        "outbound": "Microsoft"
      },
      {
        "rule_set": ["geosite-category-games", "geosite-dmm"],
        "outbound": "Games"
      },
      {
        "rule_set": ["geosite-hbo", "geosite-primevideo"],
        "outbound": "Streaming"
      },
      {
        "rule_set": "geosite-geolocation-!cn",
        "outbound": "Global"
      },
      {
        "rule_set": ["geoip-cn", "geosite-cn"],
        "outbound": "China"
      }
    ],
    "rule_set": [
      {
        "tag": "geosite-category-ads-all",
        "type": "remote",
        "format": "binary",
        "url": "https://anti-ad.net/anti-ad-sing-box.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-openai",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/Toperlock/sing-box-geosite/main/rule/OpenAI.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-youtube",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/youtube.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-google",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/google.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-google",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/google.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-github",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/github.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-telegram",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/telegram.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-telegram",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/telegram.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-twitter",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/twitter.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-twitter",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/twitter.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-facebook",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/facebook.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-facebook",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/facebook.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-bilibili",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/bilibili.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-bahamut",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/bahamut.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-spotify",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/spotify.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-tiktok",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/tiktok.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-netflix",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/netflix.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-netflix",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/netflix.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-disney",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/disney.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-apple",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo-lite/geoip/apple.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-apple",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/apple.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-amazon",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/amazon.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-microsoft",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/microsoft.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-category-games",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/category-games.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-dmm",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/dmm.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-hbo",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/hbo.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-primevideo",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/primevideo.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-geolocation-!cn",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/geolocation-!cn.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geoip-cn",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/cn.srs",
        "download_detour": "direct"
      },
      {
        "tag": "geosite-cn",
        "type": "remote",
        "format": "binary",
        "url": "https://ghproxy.cn/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/cn.srs",
        "download_detour": "direct"
      }
    ]
  }
}
