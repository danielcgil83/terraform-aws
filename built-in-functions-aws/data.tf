# render a template based on a external file, replacing the vars pretended
data "template_file" "json" {
    template = file("template.json.tpl")

    vars = {
        age = 38
        eye = "Brown"
        name = "Daniel"
        gender = "Male"
    }
}


# generates an archive from the template_file result
data "archive_file" "json" {
    type = local.file_ext
    output_path = "${path.module}/file/${local.object_name}.${local.file_ext}"

    source {
      content = data.template_file.json.rendered
      filename = "${local.object_name}.json"
    }
}