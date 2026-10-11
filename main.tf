data "oci_osub_usage_computed_usages" "osub_usage_computed_usages_lookup" {
  for_each = var.osub_usage_computed_usages_lookup

  compartment_id      = each.value.compartment_id
  subscription_id     = each.value.subscription_id
  time_from           = each.value.time_from
  time_to             = each.value.time_to
  computed_product    = each.value.computed_product
  parent_product      = each.value.parent_product
  x_one_origin_region = each.value.x_one_origin_region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

