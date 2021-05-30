locals {
  files = ["ips.json", "report.csv", "sitemap.xml"]

  # for file in files, return only the extension
  file_extensions = [for file in local.files : regex("\\.[[:alnum:]]+$", file)]

  # for extension in file_extensions, return extension in upper case only if it's different of ".json"
  file_extensions_upper = { for ext in local.file_extensions : ext => upper(ext) if ext != ".json" }

  ips = [
    {
      public : "123.123.123.22",
      private : "123.123.123.23",
    },
    {
      public : "122.123.123.22",
      private : "122.123.123.23",
    }
  ]
}