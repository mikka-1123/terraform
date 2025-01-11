
region = "ap-south-1"
access_key = ""
secret_key=""

vpc_config = {
    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"
        tags={
            "Name" = "my_vpc"
        }
    }
}

subnet_config = {
    "public-ap-south-1a" = {

        vpc_name="vpc01"
        cidr_block = "192.168.0.0/18"
        availability_zone = "ap-south-1a"
        tags = {
            "Name" = "public-ap-south-1a"
        }
    }

    "public-ap-south-1b" = {

        vpc_name="vpc01"

        cidr_block = "192.168.64.0/18"
        availability_zone = "ap-south-1b"
        tags = {
            "Name" = "public-ap-south-1b"
        }
    }

    "private-ap-south-1a" = {

        vpc_name="vpc01"

        cidr_block = "192.168.128.0/18"
        availability_zone = "ap-south-1a"
        tags = {
            "Name" = "private-ap-south-1a"
        }
    }

    "private-ap-south-1b" = {

        vpc_name="vpc01"

        cidr_block = "192.168.192.0/18"
        availability_zone = "ap-south-1b"
        tags = {
            "Name" = "private-ap-south-1b"
        }
    }
}