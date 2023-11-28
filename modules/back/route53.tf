resource "aws_route53_record" "back" {
    zone_id = "Z06335482BEM13BVT0JEQ"
    name    ="back.jeanops.net"
    type    = "A"

    alias {
        name                   = aws_lb.back.dns_name
        zone_id                = aws_lb.back.zone_id
        evaluate_target_health = true
    }
}
