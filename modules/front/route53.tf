resource "aws_route53_record" "front" {
    zone_id = "Z06335482BEM13BVT0JEQ"
    name    = "front.jeanops.net"
    type    = "A"

    alias {
        name                   = aws_lb.front.dns_name
        zone_id                = aws_lb.front.zone_id
        evaluate_target_health = true
    }
}
