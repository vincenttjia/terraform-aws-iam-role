# frozen_string_literal: true

require "awspec"
require "rhcl"

main_tf = Rhcl.parse(File.open("examples/aws_service_config/main.tf"))
module_this = main_tf["module"]["this"]
aws_service = module_this["aws_service"]

state_file = "terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate"
tf_state = JSON.parse(File.open(state_file).read)
outputs = tf_state["modules"][0]["outputs"]
role_name = outputs["role_name"]["value"]
role_arn = outputs["role_arn"]["value"]
role_description = outputs["role_description"]["value"]
role_unique_id = outputs["role_unique_id"]["value"]


describe iam_role("#{role_name}") do
    it { should exist }

    its(:path) { should eq "/service-role/#{aws_service}/" }
    its(:arn) { should eq "#{role_arn}" }
    its(:description) { should eq "#{role_description}" }
    its(:role_id) { should eq "#{role_unique_id}" }
end