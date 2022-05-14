module aws-dev {
  source = "../../infra"

}
output "IP"{
    value = module.aws-dev.IP_PUBLIC
}
