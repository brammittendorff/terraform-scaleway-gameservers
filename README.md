# Gameservers

## Configuration

We store our access key and secret key inside of scaleway. You can use the devops@pescheck.nl account to acces it. To add the environment variables you can create a file called `keys.sh` and add the contents:

```bash
export SCW_ACCESS_KEY="my-access-key"
export SCW_SECRET_KEY="my-secret-key"
export SCW_DEFAULT_PROJECT_ID="my-project-id"
export SCW_DEFAULT_REGION=nl-ams
export SCW_DEFAULT_ZONE=nl-ams-1
```

After this you can run:

```bash
source keys.sh
```

## Running terraform

When you want to plan some changes after the configuration step you could run:

```bash
terraform plan
```

And for applying the configuration to the real infrastructure you can use:

```bash
terraform apply
```

And to destroy all instances you can run:


```bash
terraform destroy
```
