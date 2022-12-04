#!/bin/bash
sudo yum install httpd -y
sudo cat > /var/www/html/index.html <<EOF

<!DOCTYPE html>
<html>
<body>

<h1>Hello World</h1>

</body>
</html>

EOF

sudo systemctl start httpd