
resource "linode_domain" "mydomain" {
  type        = "master" # Ignore DNS records at external, REGISTRAR NS records point to Linode
  domain      = var.domain_name_mydomain_com
  soa_email   = var.domain_soa_email
  tags        = ["mydomain"]
  description = var.domain_name_mydomain_com

  ttl_sec     = var.domain_default_ttl_sec
  refresh_sec = var.domain_default_refresh_sec
  retry_sec   = var.domain_default_retry_sec
  expire_sec  = var.domain_default_expire_sec

  lifecycle {
    prevent_destroy = true
  }

}

resource "linode_domain_record" "main_A_mydomain" {
  count = var.myinstance_node_count

  domain_id   = linode_domain.mydomain.id
  name        = var.domain_name_mydomain_com
  record_type = "A"
  target      = linode_instance.myinstance_instance[count.index].ip_address #Target Our WWWW Instances Here at Linode
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "main_AAAA_mydomain" {
  count       = var.myinstance_node_count
  domain_id   = linode_domain.mydomain.id
  name        = var.domain_name_mydomain_com
  record_type = "AAAA"
  target      = replace(linode_instance.myinstance_instance[count.index].ipv6, "/128", "")
  #Target Our WWWW Instances Here at Linode
  ttl_sec     = var.domain_default_ttl_sec


}


#### All of these POINT to existing external ####


#### MX Records ####

resource "linode_domain_record" "mx1_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = var.domain_name_mydomain_com
  record_type = "MX"
  target      = "mail.mydomain.com"
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0


}

#### A Records ####

resource "linode_domain_record" "localhost_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "localhost.mydomain.com"
  record_type = "A"
  target      = "127.0.0.1"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "candela_external_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "external.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "mail_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "mail.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "whm_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "whm.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "autoconfig_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "autoconfig.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "autodiscover_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "autodiscover.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "webdisk_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "webdisk.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "cpcontacts_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "cpcontacts.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "cpcalendars_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "cpcalendars.mydomain.com"
  record_type = "A"
  target      = var.domain_external_ipaddress
  ttl_sec     = var.domain_default_ttl_sec


}

#### SRV Records ####

resource "linode_domain_record" "autodiscover_tcp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_autodiscover._tcp"
  record_type = "SRV"
  target      = "cpanelemaildiscovery.cpanel.net"
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0
  weight      = 0
  port        = 443
  service     = "_autodiscover._tcp.mydomain.com"


}

resource "linode_domain_record" "caldavs_tcp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_caldavs._tcp"
  record_type = "SRV"
  target      = "ext4325.external."
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0
  weight      = 0
  port        = 2080
  service     = "_caldavs._tcp.mydomain.com"


}

resource "linode_domain_record" "caldav_tcp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_caldav._tcp"
  record_type = "SRV"
  target      = "ext4325.external."
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0
  weight      = 0
  port        = 2079
  service     = "_caldav._tcp.mydomain.com"


}

resource "linode_domain_record" "carddavs_tcp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_carddavs._tcp"
  record_type = "SRV"
  target      = "ext4325.external."
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0
  weight      = 0
  port        = 2080
  service     = "_carddavs._tcp.mydomain.com"


}

resource "linode_domain_record" "carddav_tcp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_carddav._tcp"
  record_type = "SRV"
  target      = "ext4325.external."
  ttl_sec     = var.domain_default_ttl_sec
  priority    = 0
  weight      = 0
  port        = 2079
  service     = "_carddav._tcp.mydomain.com"


}

#### CNAME Records ####

resource "linode_domain_record" "ftp_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "ftp.mydomain.com"
  record_type = "CNAME"
  target      = "external.mydomain.com"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "cpanel_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "cpanel.mydomain.com"
  record_type = "CNAME"
  target      = "external.mydomain.com"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "webmail_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "webmail.mydomain.com"
  record_type = "CNAME"
  target      = "external.mydomain.com"
  ttl_sec     = var.domain_default_ttl_sec


}


#### TXT Records ####

resource "linode_domain_record" "SPF_1_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_mydomain.com"
  record_type = "TXT"
  target      = "v=spf1 a mx include:websitewelcome.com ~all"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "SPF_3_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_mydomain.com"
  record_type = "TXT"
  target      = "v=spf1 a mx include:websitewelcome.com ~all"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "SPF_4_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_mydomain.com"
  record_type = "TXT"
  target      = "v=spf1 a mx include:websitewelcome.com ~all"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "SPF_2_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_mydomain.com"
  record_type = "TXT"
  target      = "v=spf1 +a +mx +ip4:162.241.122.122 +include:websitewelcome.com ~all"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "caldav_path_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_caldav._tcp.mydomain.com"
  record_type = "TXT"
  target      = "path=/"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "caldavs_path_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_caldavs._tcp.mydomain.com"
  record_type = "TXT"
  target      = "path=/"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "carddav_path_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_carddav._tcp.mydomain.com"
  record_type = "TXT"
  target      = "path=/"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "carddavs_path_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_carddavs._tcp.mydomain.com"
  record_type = "TXT"
  target      = "path=/"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "cpanel-dcv-test-record_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_cpanel-dcv-test-record.mydomain.com"
  record_type = "TXT"
  target      = "_cpanel-dcv-test-record=Sv_anSGcMdoBp_MzHHpbYj3euSux_e3HEMBw59hx1DH2DscIr3fmpWXcMnxYFz_y"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "acme-challenge_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "_acme-challenge.mydomain.com"
  record_type = "TXT"
  target      = "18oY7PYIAMHhfcf67_zlNPfPPODFmaMU92gGnt9_Yuo"
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "domain_key_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "default._domainkey.mydomain.com"
  record_type = "TXT"
  target      = ""
  ttl_sec     = var.domain_default_ttl_sec


}


