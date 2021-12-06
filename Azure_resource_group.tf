resource "azurerm_resource_group" "MY-RG" {

    name = "MY-RG"
    location = "centralus"

    tags = {

        Application  =  "WEB SERVER"
        Servcie   =  "ResourceGroup"
        "Application ID" = "1234"
        Environment  = "QA Environment"
        "Managed By"   = "US"
        POC           = "US Team"

  }
}