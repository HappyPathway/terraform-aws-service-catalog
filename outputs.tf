output portfolio {
    value = local.portfolio
}

output product {
    value = local.product
}

output repo {
    value = module.product_repo.github_repo
}