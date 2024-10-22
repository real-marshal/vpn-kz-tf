terraform {
  required_version = "~> 1.9.6"

  required_providers {
    serverspace = {
      source = "itglobalcom/serverspace"
      version = "~> 0.3.1"
    }

    remote = {
      source = "tenstad/remote"
      version = "~> 0.1.3"
    }
  }
}
