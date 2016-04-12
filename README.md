# host-clip

Easy clip your hosts to the buffer.



```
Integration with ec2:

* * * * * aws ec2 describe-instances --output text --query 'Reservations[].Instances[].[PublicIpAddress, Tags[?Key==`Name`].Value | [0] ]' --region us-west-2 > /tmp/ec2-us-west-2
```
