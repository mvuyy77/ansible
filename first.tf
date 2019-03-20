provider "aws"{
 region = "ap-northeast-1"
}

resource "aws_instance" "instance"{
 ami = "ami-02794be3fb6de50e1"
 instance_type = "t2.micro"
 key_name = "madhukey"
 tags = {
  Name = "User6-for-ansible"
 }
provisioner "remote-exec"{
  inline=["sudo apt-get -y install python"]
  connection{
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/madhukey")}"

    }
 }
}

