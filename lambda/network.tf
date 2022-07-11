##### SECURITY GROUP CDN #####
resource "aws_security_group" "lambda_allowed" {
    vpc_id = "${var.vpc_id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${local.internet_all_cidr}"]
    }

    tags = {
        Name = "${var.function_name}-${terraform.workspace}"
        service = "${var.servicetag}"
        lambda = "${var.function_name}"
    }
}