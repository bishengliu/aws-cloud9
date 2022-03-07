# cloud9-search

cloud9 tf for search squad

## how to start

- `terraform init && terraform plan` to check what will be created by terraform;

- `terraform apply --auto-approve` to apply the changes;

- On the [AWS Cloud9 management console](https://console.aws.amazon.com/cloud9/home) and you should see a new cloud9 environment with the name started with `cloud9-yeti-search-personal-`; click `Open IDE` on the cloud9 card.

## how to access docdb

- open your cloud9 IDE;

- At the command prompt, create the repository file with the following code:

```bash
echo -e "[mongodb-org-3.6] \nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.6/x86_64/\ngpgcheck=1 \nenabled=1 \ngpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc" | sudo tee /etc/yum.repos.d/mongodb-org-3.6.repo
```

- When it is complete, install the mongo shell with the following code:

```bash
sudo yum install -y mongodb-org-shell
```

- get the CA certificate

```bash
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
```

- connect to docdb with the mongo shell (dev)

```bash
mongo --ssl --host product.cluster-cunald5kdfoi.eu-west-1.docdb.amazonaws.com:27017 --sslCAFile rds-combined-ca-bundle.pem --username product_admin --password <insertYourPassword>
```

ps: you can also connect to other environments

## how can I use MongoDB Compass?

you can make a dump of the docdb from cloud9 and restore the snapshots to your local machine mongo server and connect the mongodb compass to your local machine
